# Generated by Django 2.2.5 on 2019-11-03 15:45

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('polls', '0002_auto_20190908_1600'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='choice',
            name='votes',
        ),
        migrations.CreateModel(
            name='Vote',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('voted_date', models.DateTimeField(auto_now=True)),
                ('choice', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='polls.Choice')),
                ('question', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='polls.Question')),
                ('voter', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]