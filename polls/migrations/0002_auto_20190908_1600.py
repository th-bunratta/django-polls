# Generated by Django 2.2.5 on 2019-09-08 09:00

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('polls', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='choice',
            old_name='question',
            new_name='choice_question',
        ),
    ]
