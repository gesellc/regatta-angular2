# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2016-09-07 19:27
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('events', '0018_auto_20160905_2022'),
    ]

    operations = [
        migrations.AddField(
            model_name='placement',
            name='calculated_place',
            field=models.PositiveIntegerField(blank=True, help_text='calculated place', null=True),
        ),
    ]