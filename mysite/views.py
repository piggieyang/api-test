# -*- coding: utf-8 -*-

import json
import logging
import migu
import os
import re

from uuid import uuid4

from django.http import HttpResponse
from django.shortcuts import redirect
from django.utils import timezone
from django.views.decorators.csrf import csrf_exempt
from settings import TEMP_ROOT
# from depend import requests

log = logging.getLogger('my.custom.log')

import gzip


def home(request):
    return redirect(to=migu.views.home)


def migu_click_analysis_track_cfg(request):
    cfg = dict(
        EXP_TM=20000, SEND_MODE="7", OFFLINE_MAX_MB=5,
        SEND_PER_COUNT=10, SEND_MAX_TIME=600,
        INTERFACE_ONLINE_SWITCH="1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0"
    )
    # try:
    #     url = 'http://ua.data.migu.cn/track/cfg.php'
    #     cfg = requests.get(url=url).json()
    # except:
    #     pass
    return HttpResponse(content=json.dumps(cfg, indent=4, sort_keys=True),
                        content_type='application/json;charset=utf-8')


@csrf_exempt
def migu_click_analysis_track_gzbeh(request):
    zipbehs = request.FILES.get('zipbehs', None)
    content = ''
    today = timezone.now().strftime('%Y%m%d')
    today_dir = os.path.join(TEMP_ROOT, today).replace('\\', '/')
    if os.path.isdir(today_dir):
        pass
    else:
        os.mkdir(today_dir)
    csv_path = os.path.join(today_dir,
                            'necessary.%s.csv' % uuid4()).replace('\\', '/')
    necessary_info_4_analysis = open(csv_path, 'a')
    if zipbehs:
        file_path = os.path.join(today_dir, 'zipdata.%s.gz' %
                                 uuid4()).replace('\\', '/')
        with open(file_path, 'wb+') as dest:
            for chunk in zipbehs.chunks():
                dest.write(chunk)
        try:
            with gzip.open(file_path, 'rb') as gz:
                content += gz.read()
        except Exception, e:
            log.error(e)
        # try:
        #     files = {'zipbehs': ('zipdata.gz', open(file_path, 'rb'))}
        #     url = 'http://ua.data.migu.cn/track/gzbeh.php'
        #     requests.post(url=url, files=files)
        # except:
        #     pass
    pattern = r'^.+at=(?P<at>.+)&chanel=(?P<channel>.+)&os=(?P<os>.+)&screen.+event_tag=(?P<event>.+)&activity.+appv=(?P<version>.+)$'
    prog = re.compile(pattern)
    resp = list()
    for line in content.split('\n'):
        m = prog.match(line)
        if m:
            mgrpdct = m.groupdict()
            resp.append(mgrpdct)
            necessary_info_4_analysis.write(
                '%(at)s,%(channel)s,%(os)s,%(event)s,%(version)s' % mgrpdct)
            necessary_info_4_analysis.write('\n')

    return HttpResponse(content=json.dumps(resp, indent=4),
                        content_type='application/json;charset=utf-8')
