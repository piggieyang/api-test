# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('log', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='MyCustomLog',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('asctime', models.DateTimeField(auto_now_add=True, verbose_name=b'\xe6\x97\xb6\xe9\x97\xb4')),
                ('created', models.FloatField(verbose_name=b'\xe6\x97\xb6\xe9\x97\xb4\xe6\x88\xb3')),
                ('funcName', models.CharField(max_length=255, null=True, verbose_name=b'\xe5\x87\xbd\xe6\x95\xb0', blank=True)),
                ('levelname', models.CharField(max_length=255, verbose_name=b'\xe7\xba\xa7\xe5\x88\xab')),
                ('lineno', models.IntegerField(verbose_name=b'\xe8\xa1\x8c\xe5\x8f\xb7')),
                ('module', models.CharField(max_length=255, verbose_name=b'\xe6\xa8\xa1\xe5\x9d\x97')),
                ('message', models.TextField(verbose_name=b'\xe4\xbf\xa1\xe6\x81\xaf')),
                ('pathname', models.CharField(max_length=255, verbose_name=b'\xe8\xb7\xaf\xe5\xbe\x84')),
            ],
            options={
                'ordering': ['-created'],
                'abstract': False,
                'db_table': 'django_my_custom_log',
                'verbose_name': '\u65e5\u5fd7',
                'verbose_name_plural': '\u65e5\u5fd7',
            },
        ),
    ]
