import datetime
from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User


class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('Date Published')

    def was_published_recently(self):
        now = timezone.now()
        return now - datetime.timedelta(days=1) <= self.pub_date <= now

    def __str__(self):
        return self.question_text


class Choice(models.Model):
    choice_question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)

    def votes(self):
        return Vote.objects.filter(choice=self, question=self.choice_question).count()

    def __str__(self):
        return self.choice_text


class Vote(models.Model):
    voter = models.ForeignKey(User, on_delete=models.CASCADE)
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice = models.ForeignKey(Choice, on_delete=models.CASCADE)
    voted_date = models.DateTimeField('Date Voted', auto_now=True)

    def __str__(self):
        return f'Vote({self.voter.username}, {self.question.question_text}, {self.choice.choice_text})'
