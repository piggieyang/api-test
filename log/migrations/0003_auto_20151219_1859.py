# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('log', '0002_mycustomlog'),
    ]

    operations = [
        migrations.DeleteModel(
            name='CriticalLog',
        ),
        migrations.DeleteModel(
            name='DebugLog',
        ),
        migrations.DeleteModel(
            name='ErrorLog',
        ),
        migrations.DeleteModel(
            name='InfoLog',
        ),
        migrations.DeleteModel(
            name='NotsetLog',
        ),
        migrations.DeleteModel(
            name='WarningLog',
        ),
    ]
