# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('migu', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='result',
            name='server',
            field=models.ForeignKey(verbose_name=b'\xe7\x8e\xaf\xe5\xa2\x83', to='migu.Server', null=True),
        ),
    ]
