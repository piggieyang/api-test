# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='MobileService',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=50, verbose_name=b'\xe6\x8e\xa5\xe5\x8f\xa3\xe5\x90\x8d\xe7\xa7\xb0')),
                ('version', models.CharField(default=b'2.0', max_length=5, verbose_name=b'\xe6\x8e\xa5\xe5\x8f\xa3\xe7\x89\x88\xe6\x9c\xac')),
                ('service', models.CharField(max_length=50, verbose_name=b'\xe6\x9c\x8d\xe5\x8a\xa1\xe5\x90\x8d\xe7\xa7\xb0')),
                ('data', models.TextField(default=b'{}', verbose_name=b'\xe8\xaf\xb7\xe6\xb1\x82\xe7\xa4\xba\xe4\xbe\x8b\xe5\x8c\x85')),
                ('description', models.TextField(null=True, verbose_name=b'\xe6\x8e\xa5\xe5\x8f\xa3\xe7\xae\x80\xe4\xbb\x8b', blank=True)),
                ('active', models.BooleanField(default=True, verbose_name=b'\xe6\x98\xaf\xe5\x90\xa6\xe6\x9c\x89\xe6\x95\x88')),
            ],
            options={
                'ordering': ('service', 'version', 'active'),
                'abstract': False,
                'verbose_name_plural': '\u624b\u673a\u7248\u63a5\u53e3',
                'db_table': 'migu_mobile_service',
                'verbose_name': '\u624b\u673a\u7248\u63a5\u53e3',
            },
        ),
        migrations.CreateModel(
            name='Module',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=50, verbose_name=b'\xe6\xa8\xa1\xe5\x9d\x97\xe5\x90\x8d\xe7\xa7\xb0')),
                ('service_list', models.TextField(default=b'[]', verbose_name=b'\xe6\x8e\xa5\xe5\x8f\xa3\xe5\x88\x97\xe8\xa1\xa8')),
                ('param_dict', models.TextField(default=b'{}', verbose_name=b'\xe5\x8f\x82\xe6\x95\xb0\xe5\x88\x97\xe8\xa1\xa8')),
                ('additional', models.TextField(default=b'{}', help_text=b'JSON\xe6\xa0\xbc\xe5\xbc\x8f\xef\xbc\x8c\xe7\x94\xa8\xe4\xba\x8e\xe6\xb7\xbb\xe5\x8a\xa0\xe5\x88\xb0\xe8\xaf\xb7\xe6\xb1\x82\xe7\x9a\x84\xe5\x8f\xaf\xe9\x80\x89\xe5\x8f\x82\xe6\x95\xb0,\xe5\xa6\x82\xe7\x89\x88\xe6\x9c\xac\xe5\x8f\xb7\xe7\xad\x89\xe5\x9f\xba\xe7\xa1\x80\xe5\x8f\x82\xe6\x95\xb0', verbose_name=b'\xe9\x99\x84\xe5\x8a\xa0\xe5\x8f\x82\xe6\x95\xb0')),
                ('description', models.TextField(null=True, verbose_name=b'\xe6\xa8\xa1\xe5\x9d\x97\xe6\x8f\x8f\xe8\xbf\xb0', blank=True)),
                ('active', models.BooleanField(default=True, verbose_name=b'\xe6\x98\xaf\xe5\x90\xa6\xe6\x9c\x89\xe6\x95\x88')),
            ],
            options={
                'ordering': ['name'],
                'db_table': 'migu_module',
                'verbose_name': '\u7ec4\u5408\u63a5\u53e3',
                'verbose_name_plural': '\u529f\u80fd\u6a21\u5757',
            },
        ),
        migrations.CreateModel(
            name='OpenService',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=50, verbose_name=b'\xe6\x8e\xa5\xe5\x8f\xa3\xe5\x90\x8d\xe7\xa7\xb0')),
                ('version', models.CharField(default=b'2.0', max_length=5, verbose_name=b'\xe6\x8e\xa5\xe5\x8f\xa3\xe7\x89\x88\xe6\x9c\xac')),
                ('service', models.CharField(max_length=50, verbose_name=b'\xe6\x9c\x8d\xe5\x8a\xa1\xe5\x90\x8d\xe7\xa7\xb0')),
                ('data', models.TextField(default=b'{}', verbose_name=b'\xe8\xaf\xb7\xe6\xb1\x82\xe7\xa4\xba\xe4\xbe\x8b\xe5\x8c\x85')),
                ('description', models.TextField(null=True, verbose_name=b'\xe6\x8e\xa5\xe5\x8f\xa3\xe7\xae\x80\xe4\xbb\x8b', blank=True)),
                ('active', models.BooleanField(default=True, verbose_name=b'\xe6\x98\xaf\xe5\x90\xa6\xe6\x9c\x89\xe6\x95\x88')),
            ],
            options={
                'ordering': ('service', 'version', 'active'),
                'abstract': False,
                'verbose_name_plural': '\u5f00\u653e\u5e73\u53f0\u63a5\u53e3',
                'db_table': 'migu_open_service',
                'verbose_name': '\u5f00\u653e\u5e73\u53f0\u63a5\u53e3',
            },
        ),
        migrations.CreateModel(
            name='PluginService',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=50, verbose_name=b'\xe6\x8e\xa5\xe5\x8f\xa3\xe5\x90\x8d\xe7\xa7\xb0')),
                ('version', models.CharField(default=b'2.0', max_length=5, verbose_name=b'\xe6\x8e\xa5\xe5\x8f\xa3\xe7\x89\x88\xe6\x9c\xac')),
                ('service', models.CharField(max_length=50, verbose_name=b'\xe6\x9c\x8d\xe5\x8a\xa1\xe5\x90\x8d\xe7\xa7\xb0')),
                ('data', models.TextField(default=b'{}', verbose_name=b'\xe8\xaf\xb7\xe6\xb1\x82\xe7\xa4\xba\xe4\xbe\x8b\xe5\x8c\x85')),
                ('description', models.TextField(null=True, verbose_name=b'\xe6\x8e\xa5\xe5\x8f\xa3\xe7\xae\x80\xe4\xbb\x8b', blank=True)),
                ('active', models.BooleanField(default=True, verbose_name=b'\xe6\x98\xaf\xe5\x90\xa6\xe6\x9c\x89\xe6\x95\x88')),
            ],
            options={
                'ordering': ('service', 'version', 'active'),
                'abstract': False,
                'verbose_name_plural': '\u63d2\u4ef6\u63a5\u53e3',
                'db_table': 'migu_plugin_service',
                'verbose_name': '\u63d2\u4ef6\u63a5\u53e3',
            },
        ),
        migrations.CreateModel(
            name='Result',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('service', models.CharField(max_length=50, verbose_name=b'\xe6\x9c\x8d\xe5\x8a\xa1\xe5\x90\x8d\xe7\xa7\xb0')),
                ('version', models.CharField(max_length=25, verbose_name=b'\xe7\x89\x88\xe6\x9c\xac')),
                ('data', models.TextField(default=b'{}', verbose_name=b'\xe8\xaf\xb7\xe6\xb1\x82\xe5\x8c\x85')),
                ('url', models.TextField(verbose_name=b'GET\xe5\x9c\xb0\xe5\x9d\x80')),
                ('status', models.IntegerField(null=True, verbose_name=b'\xe8\xbf\x94\xe5\x9b\x9e\xe7\x8a\xb6\xe6\x80\x81\xe7\xa0\x81', blank=True)),
                ('message', models.CharField(max_length=255, null=True, verbose_name=b'\xe8\xbf\x94\xe5\x9b\x9e\xe6\x8f\x8f\xe8\xbf\xb0', blank=True)),
                ('result', models.TextField(null=True, verbose_name=b'\xe8\xbf\x94\xe5\x9b\x9e\xe7\xbb\x93\xe6\x9e\x9c', blank=True)),
                ('ExecutionTime', models.FloatField(default=9999.9, verbose_name=b'\xe6\x8e\xa5\xe5\x8f\xa3\xe8\x80\x97\xe6\x97\xb6')),
                ('CreateTime', models.DateTimeField(auto_now_add=True, verbose_name=b'\xe6\x89\xa7\xe8\xa1\x8c\xe6\x97\xb6\xe9\x97\xb4')),
            ],
            options={
                'ordering': ['CreateTime'],
                'db_table': 'migu_test_result',
                'verbose_name': '\u6267\u884c\u7ed3\u679c',
                'verbose_name_plural': '\u6267\u884c\u7ed3\u679c',
            },
        ),
        migrations.CreateModel(
            name='Server',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=50, verbose_name=b'\xe6\x8e\xa5\xe5\x8f\xa3\xe5\x9c\xb0\xe5\x9d\x80\xe5\x90\x8d\xe7\xa7\xb0')),
                ('address', models.CharField(max_length=255, verbose_name=b'\xe6\x8e\xa5\xe5\x8f\xa3\xe5\x9c\xb0\xe5\x9d\x80')),
                ('key', models.CharField(help_text=b'\xe6\x8e\xa5\xe5\x8f\xa3\xe5\x8a\xa0/\xe8\xa7\xa3\xe5\xaf\x86\xe7\x9a\x84\xe5\xaf\x86\xe9\x92\xa5', max_length=50, null=True, verbose_name=b'\xe5\xaf\x86\xe9\x92\xa5', blank=True)),
                ('postfix', models.CharField(default=b'/do', max_length=50, verbose_name=b'\xe6\x8e\xa5\xe5\x8f\xa3\xe5\x90\x8e\xe7\xbc\x80')),
                ('postfix_file', models.CharField(default=b'/do_file', max_length=50, verbose_name=b'\xe6\x96\x87\xe4\xbb\xb6\xe4\xb8\x8a\xe4\xbc\xa0\xe6\x8e\xa5\xe5\x8f\xa3\xe5\x90\x8e\xe7\xbc\x80')),
                ('additional', models.TextField(default=b'{}', help_text=b'JSON\xe6\xa0\xbc\xe5\xbc\x8f\xef\xbc\x8c\xe7\x94\xa8\xe4\xba\x8e\xe6\xb7\xbb\xe5\x8a\xa0\xe5\x88\xb0\xe8\xaf\xb7\xe6\xb1\x82\xe7\x9a\x84\xe5\x8f\xaf\xe9\x80\x89\xe5\x8f\x82\xe6\x95\xb0', verbose_name=b'\xe9\x99\x84\xe5\x8a\xa0\xe5\x8f\x82\xe6\x95\xb0')),
                ('active', models.BooleanField(default=True, verbose_name=b'\xe6\x98\xaf\xe5\x90\xa6\xe6\x9c\x89\xe6\x95\x88')),
            ],
            options={
                'ordering': ['name'],
                'db_table': 'migu_server',
                'verbose_name': '\u73af\u5883\u914d\u7f6e',
                'verbose_name_plural': '\u73af\u5883\u5730\u5740',
            },
        ),
        migrations.CreateModel(
            name='TVService',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=50, verbose_name=b'\xe6\x8e\xa5\xe5\x8f\xa3\xe5\x90\x8d\xe7\xa7\xb0')),
                ('version', models.CharField(default=b'2.0', max_length=5, verbose_name=b'\xe6\x8e\xa5\xe5\x8f\xa3\xe7\x89\x88\xe6\x9c\xac')),
                ('service', models.CharField(max_length=50, verbose_name=b'\xe6\x9c\x8d\xe5\x8a\xa1\xe5\x90\x8d\xe7\xa7\xb0')),
                ('data', models.TextField(default=b'{}', verbose_name=b'\xe8\xaf\xb7\xe6\xb1\x82\xe7\xa4\xba\xe4\xbe\x8b\xe5\x8c\x85')),
                ('description', models.TextField(null=True, verbose_name=b'\xe6\x8e\xa5\xe5\x8f\xa3\xe7\xae\x80\xe4\xbb\x8b', blank=True)),
                ('active', models.BooleanField(default=True, verbose_name=b'\xe6\x98\xaf\xe5\x90\xa6\xe6\x9c\x89\xe6\x95\x88')),
            ],
            options={
                'ordering': ('service', 'version', 'active'),
                'abstract': False,
                'verbose_name_plural': 'TV\u7248\u63a5\u53e3',
                'db_table': 'migu_tv_service',
                'verbose_name': 'TV\u7248\u63a5\u53e3',
            },
        ),
        migrations.AlterUniqueTogether(
            name='tvservice',
            unique_together=set([('version', 'service')]),
        ),
        migrations.AddField(
            model_name='result',
            name='server',
            field=models.ForeignKey(verbose_name=b'\xe7\x8e\xaf\xe5\xa2\x83', to='migu.Server'),
        ),
        migrations.AlterUniqueTogether(
            name='pluginservice',
            unique_together=set([('version', 'service')]),
        ),
        migrations.AlterUniqueTogether(
            name='openservice',
            unique_together=set([('version', 'service')]),
        ),
        migrations.AlterUniqueTogether(
            name='mobileservice',
            unique_together=set([('version', 'service')]),
        ),
    ]
