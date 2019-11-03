from django.contrib import messages
from django.http import HttpResponse, HttpResponseRedirect
from django.views.decorators.http import require_http_methods
from django.shortcuts import get_object_or_404, render, render_to_response, redirect
from django.template import RequestContext
from django.urls import reverse
from django.views import generic, defaults
from django.utils import timezone
import json
from ..models import Choice, Question
from ..apps import PollsConfig
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

    def get_queryset(self):
        """
        Excludes any questions that aren't published yet.
        """
        return Question.objects.filter(pub_date__lte=timezone.now())


class ResultsView(generic.DetailView):
    model = Question
    template_name = 'polls/results.html'


@require_http_methods(["POST"])
def vote(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    try:
        selected_choice = question.choice_set.get(pk=request.POST['choice'])
    except (KeyError, Choice.DoesNotExist):
        logger.error('')
        return render(request, 'polls/detail.html', {
            'question': question,
            'error_message': PollsConfig.NOT_EXIST_CHOICE_MSG,
        })
    else:
        selected_choice.votes += 1
        selected_choice.save()
        logger.info(f'Selected choices have been successfully recorded to {question.question_text}.')
        messages.success(request, "Your choice has been successfully recorded. The result is shown below.")
        return HttpResponseRedirect(reverse('polls:results', args=(question.id,)))


def handler404(request, exception, template_name="404.html"):
    response = render_to_response("polls/404.html", {'request': request.path.replace("/", "").replace("polls", "")})
    response.status_code = 404
    return response
