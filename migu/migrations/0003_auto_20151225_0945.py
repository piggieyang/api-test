# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('migu', '0002_auto_20151218_0452'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='result',
            options={'ordering': ['-CreateTime'], 'verbose_name': '\u6267\u884c\u7ed3\u679c', 'verbose_name_plural': '\u6267\u884c\u7ed3\u679c'},
        ),
        migrations.AddField(
            model_name='result',
            name='headers',
            field=models.TextField(null=True, verbose_name=b'\xe5\x93\x8d\xe5\xba\x94\xe5\xa4\xb4', blank=True),
        ),
    ]
