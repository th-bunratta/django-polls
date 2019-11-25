import datetime
from django.test import TestCase
from django.urls import reverse
from django.utils import timezone
from polls.models import Question, Choice


def create_question(question_text, days=0):
    """
    Create a question with the given `question_text` and published the
    given number of `days` offset to now (negative for questions published
    in the past, positive for questions that have yet to be published).
    """
    time = timezone.now() + datetime.timedelta(days=days)
    return Question.objects.create(question_text=question_text, pub_date=time)


def create_choice(choice_text, question_id):
    return Choice.objects.create(choice_text=choice_text, choice_question_id=question_id)


def vote_for(client, question_id, choice_id, user):
    response = client.post(reverse("polls:vote", args=(question_id,)), {'choice': choice_id, 'user': user})
    return response


class QuestionModelTests(TestCase):


    def test_was_published_recently_with_future_question(self):
        """
        was_published_recently() returns False for questions whose pub_date
        is in the future.
        """
        time = timezone.now() + datetime.timedelta(days=30)
        future_question = Question(pub_date=time)
        self.assertIs(future_question.was_published_recently(), False)

    def test_was_published_recently_with_old_question(self):
        """
        was_published_recently() returns False for questions whose pub_date
        is older than 1 day.
        """
        time = timezone.now() - datetime.timedelta(days=1, seconds=1)
        old_question = Question(pub_date=time)
        self.assertIs(old_question.was_published_recently(), False)

    def test_was_published_recently_with_recent_question(self):
        """
        was_published_recently() returns True for questions whose pub_date
        is within the last day.
        """
        time = timezone.now() - datetime.timedelta(hours=23, minutes=59, seconds=59)
        recent_question = Question(pub_date=time)
        self.assertIs(recent_question.was_published_recently(), True)


class ChoiceModelTests(TestCase):

    def test_choice_str(self):
        choice_text = "Howdy"
        choice = Choice(choice_text=choice_text)
        self.assertEqual(choice_text, str(choice))
