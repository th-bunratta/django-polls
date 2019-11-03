from django.shortcuts import render
from django.contrib.auth.signals import user_logged_out
from django.contrib import messages


def successful_logout_message(sender, user, request, **kwargs):
    messages.info(request, 'You have successfully been signed out.')


user_logged_out.connect(successful_logout_message)
