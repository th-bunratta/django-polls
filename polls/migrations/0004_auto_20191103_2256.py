# Generated by Django 2.2.5 on 2019-11-03 15:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('polls', '0003_auto_20191103_2245'),
    ]

    operations = [
        migrations.AlterField(
            model_name='vote',
            name='voted_date',
            field=models.DateTimeField(auto_now=True, verbose_name='Date Voted'),
        ),
    ]