from django.apps import AppConfig


class PollsConfig(AppConfig):
    name = 'polls'
    verbose_name = "Tutorial Polls App"
    NOT_EXIST_CHOICE_MSG = "You didn't select a choice."
    EXIST_VOTE_MSG = "You already voted on this polls"
