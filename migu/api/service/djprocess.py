# -*- coding: utf-8 -*-

import json
import logging
import os
import re
import time
import urllib

from django.db.models import ObjectDoesNotExist

from migu.api.httpclient import post
from migu.api.service.process import DEFAULT_EKEY
from migu.api.service.process import encrypt_necessary
from migu.api.service.process import get_resp_json_or_content
from migu.api.service.process import uuid
from migu.models import MobileService
from migu.models import OpenService
from migu.models import PluginService
from migu.models import Result
from migu.models import TVService
from mysite.settings import FILE_UPLOAD_TEMP_DIR

log = logging.getLogger('my.custom.log')


def djprocess(server, service='systemTime', version='2.0', data={}, files=None,
              **kwargs):
    """ 接口测试函数
    @url：接口地址
    @service: 接口
    @version：版本
    @data： 请求数据
    @files：请求文件
    @ekey：密钥
    @additional：附加参数
    """

    ekey = server.key or DEFAULT_EKEY
    necessary = encrypt_necessary(service, version, data, ekey)
    kwargs.update(necessary)
    additional = server.additional or '{}'
    kwargs.update(json.loads(additional))
    if files:
        url = server.address + server.postfix_file
        fs = list()
        for f in files:
            file_path = os.path.join(FILE_UPLOAD_TEMP_DIR,
                                     uuid()).replace('\\', '/')
            file_name = f.name
            with open(file_path, 'wb+') as dest:
                for chunk in f.chunks():
                    dest.write(chunk)
            fs.append((file_path, file_name))
        files = fs
    else:
        url = server.address + server.postfix
    now = time.time()
    resp = post(url, files, **kwargs)
    excute_time = time.time() - now
    ekey = server.key or DEFAULT_EKEY
    data = json.dumps(data, indent=4,
                      ensure_ascii=False).encode('utf-8')
    url = url + '?' + urllib.urlencode(kwargs)
    headers = json.dumps(dict(resp.headers.items()), indent=4,
                         ensure_ascii=False).encode('utf-8')
    result = get_resp_json_or_content(resp, ekey)
    status = resp.status_code
    message = resp.reason
    try:
        status = resp.json().get('status')
        message = resp.json().get('message')
    except ValueError:
        pass
    r = Result(server=server, service=service, version=version,
               data=data, url=url, headers=headers,
               status=status, message=message, result=result,
               ExecutionTime=excute_time)
    r.save()
    return r


def find_one_service(service, version):
    service_models = [MobileService, TVService, PluginService, OpenService]
    result = None
    for smodel in service_models:
        try:
            result = smodel.objects.get(active=True,
                                        service=service,
                                        version=version)
        except ObjectDoesNotExist:
            pass
        else:
            break
    return result


def find_multi_service(service):
    service_models = [MobileService, TVService, PluginService, OpenService]
    result = list()
    for smodel in service_models:
        result.extend(smodel.objects.filter(active=True,
                                            service__contains=service))
    return result


def get_service_by_name(name):
    pattern = '(?P<service>\w+)(\((?P<version>\d\.\d)\))?'
    prog = re.compile(pattern)
    m = prog.match(name)
    mgrdct = m.groupdict()
    service = mgrdct.get('service')
    version = mgrdct.get('version')
    srvc = None
    if version:
        srvc = find_one_service(service, version)
    else:
        for v in ['2.0', '3.0', '4.0', '5.0']:
            srvc = find_one_service(service, v)
            if srvc:
                break
    return srvc
