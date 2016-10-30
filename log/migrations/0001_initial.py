# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='CriticalLog',
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
                'db_table': 'django_critical_log',
                'verbose_name': '\u4e25\u91cd\u9519\u8bef',
                'verbose_name_plural': '\u4e25\u91cd\u9519\u8bef',
            },
        ),
        migrations.CreateModel(
            name='DebugLog',
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
                'db_table': 'django_debug_log',
                'verbose_name': '\u8c03\u8bd5\u65e5\u5fd7',
                'verbose_name_plural': '\u8c03\u8bd5\u65e5\u5fd7',
            },
        ),
        migrations.CreateModel(
            name='ErrorLog',
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
                'db_table': 'django_error_log',
                'verbose_name': '\u9519\u8bef\u65e5\u5fd7',
                'verbose_name_plural': '\u9519\u8bef\u65e5\u5fd7',
            },
        ),
        migrations.CreateModel(
            name='InfoLog',
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
                'db_table': 'django_info_log',
                'verbose_name': '\u4fe1\u606f\u65e5\u5fd7',
                'verbose_name_plural': '\u4fe1\u606f\u65e5\u5fd7',
            },
        ),
        migrations.CreateModel(
            name='NotsetLog',
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
                'db_table': 'django_notset_log',
                'verbose_name': 'Notset\u65e5\u5fd7',
                'verbose_name_plural': 'Notset\u65e5\u5fd7',
            },
        ),
        migrations.CreateModel(
            name='WarningLog',
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
                'db_table': 'django_warning_log',
                'verbose_name': '\u8b66\u544a\u65e5\u5fd7',
                'verbose_name_plural': '\u8b66\u544a\u65e5\u5fd7',
            },
        ),
    ]
