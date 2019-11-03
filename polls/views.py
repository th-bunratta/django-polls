from django.contrib import messages
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required
from django.views.decorators.http import require_http_methods
from django.shortcuts import get_object_or_404, render, render_to_response, redirect
from django.template import RequestContext
from django.urls import reverse
from django.views import generic, defaults
from django.utils import timezone
import json
from .models import Choice, Question, Vote
from .apps import PollsConfig
import logging

logger = logging.getLogger(__name__)


class IndexView(generic.ListView):
    template_name = 'polls/index.html'
    context_object_name = 'latest_question_list'

    def get_queryset(self):
        """Return the last five published questions."""
        logger.info("Retrieved questions by date")
        return Question.objects.filter(
            pub_date__lte=timezone.now()
        ).order_by('-pub_date')[:5]


class DetailView(generic.DetailView):
    model = Question
    template_name = 'polls/detail.html'

    def get_context_data(self, **kwargs):
        # Call the base implementation first to get a context
        context = super().get_context_data(**kwargs)
        # Add in a QuerySet of all the books
        context['current_choice_id'] = Vote.objects.get(voter=self.request.user, question_id=int(self.kwargs['pk'])).choice.id
        return context

    def get_queryset(self):
        """
        Excludes any questions that aren't published yet.
        """
        return Question.objects.filter(pub_date__lte=timezone.now())


class ResultsView(LoginRequiredMixin, generic.DetailView):
    login_url = 'accounts:login'
    model = Question
    template_name = 'polls/results.html'


@login_required
@require_http_methods(["GET", "POST"])
def vote(request, question_id):
    if request.method == 'GET':
        return redirect('polls:detail', question_id)
    else:
        question = get_object_or_404(Question, pk=question_id)
        if 'choice' not in request.POST: return render(request, 'polls/detail.html', {
                    'question': question,
                    'error_message': PollsConfig.NOT_EXIST_CHOICE_MSG,
                })
        else:
            choice = request.POST['choice']

        def get_choice(selected_vote, message):
            try:
                selected_choice = question.choice_set.get(pk=choice)
            except (KeyError, Choice.DoesNotExist):
                logger.error('')
                return render(request, 'polls/detail.html', {
                    'question': question,
                    'error_message': PollsConfig.NOT_EXIST_CHOICE_MSG,
                })
            else:
                selected_vote.choice = selected_choice
                selected_vote.save()
                logger.info(f'The choice have been successfully upserted in {question.question_text}.')
                messages.success(request, message)
                return HttpResponseRedirect(reverse('polls:results', args=(question.id,)))
        try:
            current_vote = Vote.objects.get(voter=request.user, question=question)
            return get_choice(current_vote, "Your choice has been successfully recorded. The result is shown below.")
        except (KeyError, Vote.DoesNotExist):
            current_vote = Vote(voter=request.user, question=question)
            return get_choice(current_vote, "Your choice has successfully been changed. The result is shown below.")


def handler404(request, exception, template_name="404.html"):
    response = render_to_response("polls/404.html", {'request': request.path.replace("/", "").replace("polls", "")})
    response.status_code = 404
    return response
