
from django.test import TestCase
from django.urls import reverse
from django.shortcuts import get_object_or_404
from django.contrib.auth.models import User
from polls.apps import PollsConfig
from .test_models import Question, Choice, datetime, create_choice, create_question, vote_for


class QuestionIndexViewTests(TestCase):
    def test_no_questions(self):
        """
        If no questions exist, an appropriate message is displayed.
        """
        response = self.client.get(reverse('polls:index'))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, "No polls are available.")
        self.assertQuerysetEqual(response.context['latest_question_list'], [])

    def test_past_question(self):
        """
        Questions with a pub_date in the past are displayed on the
        index page.
        """
        create_question(question_text="Past question.", days=-30)
        response = self.client.get(reverse('polls:index'))
        self.assertQuerysetEqual(
            response.context['latest_question_list'],
            ['<Question: Past question.>']
        )

    def test_future_question(self):
        """
        Questions with a pub_date in the future aren't displayed on
        the index page.
        """
        create_question(question_text="Future question.", days=30)
        response = self.client.get(reverse('polls:index'))
        self.assertContains(response, "No polls are available.")
        self.assertQuerysetEqual(response.context['latest_question_list'], [])

    def test_future_question_and_past_question(self):
        """
        Even if both past and future questions exist, only past questions
        are displayed.
        """
        create_question(question_text="Past question.", days=-30)
        create_question(question_text="Future question.", days=30)
        response = self.client.get(reverse('polls:index'))
        self.assertQuerysetEqual(
            response.context['latest_question_list'],
            ['<Question: Past question.>']
        )

    def test_two_past_questions(self):
        """
        The questions index page may display multiple questions.
        """
        create_question(question_text="Past question 1.", days=-30)
        create_question(question_text="Past question 2.", days=-5)
        response = self.client.get(reverse('polls:index'))
        self.assertQuerysetEqual(
            response.context['latest_question_list'],
            ['<Question: Past question 2.>', '<Question: Past question 1.>']
        )


class QuestionDetailViewTests(TestCase):

    def test_future_question(self):
        """
        The detail view of a question with a pub_date in the future
        returns a 404 not found.
        """
        future_question = create_question(question_text='Future question.', days=5)
        url = reverse('polls:detail', args=(future_question.id,))
        response = self.client.get(url)
        self.assertEqual(response.status_code, 404)

    def test_past_question(self):
        """
        The detail view of a question with a pub_date in the past
        displays the question's text.
        """
        past_question = create_question(question_text='Past Question.', days=-5)
        url = reverse('polls:detail', args=(past_question.id,))
        response = self.client.get(url)
        self.assertContains(response, past_question.question_text)


class QuestionDetailVoteViewTests(TestCase):

    def setUp(self) -> None:
        self.user = User.objects.create_user(username='testuser', password='secret')
        self.user2 = User.objects.create_user(username='testuser2', password='secret')
        self.user3 = User.objects.create_user(username='testuser3', password='secret')
        self.user4 = User.objects.create_user(username='testuser4', password='secret')
        self.client.login(username='testuser', password='secret')
        self.main_question = create_question(question_text='Past Question.', days=-5)
        self.main_choice = create_choice("Hi", 1)

    def test_vote_single(self):
        vote_for(self.client, self.main_question.id, self.main_choice.id, self.user)
        self.assertEqual(1, get_object_or_404(Choice, pk=self.main_choice.id).votes())

    def test_vote_multiple(self):
        vote_for(self.client, self.main_question.id, self.main_choice.id, self.user)
        self.client.login(username='testuser2', password='secret')
        vote_for(self.client, self.main_question.id, self.main_choice.id, self.user)
        self.client.login(username='testuser3', password='secret')
        vote_for(self.client, self.main_question.id, self.main_choice.id, self.user)
        self.client.login(username='testuser4', password='secret')
        vote_for(self.client, self.main_question.id, self.main_choice.id, self.user)
        self.assertEqual(4, get_object_or_404(Choice, pk=self.main_choice.id).votes())

    def test_vote_non_existent_choice(self):
        response = vote_for(self.client, self.main_question.id, 3, self.user)
        self.assertTrue(PollsConfig.NOT_EXIST_CHOICE_MSG in response.context['error_message'])
