# -*- coding: utf-8 -*-

import json
import logging
import random
import re
import string
import threading
import time

from datetime import datetime
from migu.api.crypt import MiguDES3
from migu.api.crypt import md5
from migu.api.httpclient import post
from uuid import uuid4

log = logging.getLogger('my.custom.log')
DEFAULT_EKEY = '9HkocpYLeG1LNi5m'


def uuid():
    return str(uuid4()).replace('-', '')


def now():
    return datetime.now().strftime('%Y%m%d%H%M%S')


def repl(match):
    mgrpdct = match.groupdict()
    function = mgrpdct.get('function', '').lower()
    try:
        return eval(function)()
    except Exception, e:
        log.error(e)
        return match.string


def get_func_val(s):
    pattern = '\$\{(?P<function>[A-Z]+)\}'
    prog = re.compile(pattern)
    return prog.sub(repl, s)


def timestamp_int():
    return int(time.time())


def random_str(length=6, rules=string.digits):
    return ''.join(random.sample(rules, length))


def get_token(service, timestamp, data, salt, version, ekey):
    loc = '%(service)s%(timestamp)d%(data)s%(salt)s%(version)s%(ekey)s'
    s = loc % locals()
    return md5(s)


def des3_encrypt(data, salt, ekey=DEFAULT_EKEY):
    cipher = MiguDES3(key=md5(salt + ekey)[:24])
    if isinstance(data, (dict, list,)):
        data = json.dumps(data, ensure_ascii=False).encode('utf-8')
    return cipher.encrypt(data)


def des3_decrypt(data, salt, ekey=DEFAULT_EKEY):
    cipher = MiguDES3(key=md5(salt + ekey)[:24])
    return cipher.decrypt(data)


def encrypt_necessary(service, version, data, ekey=DEFAULT_EKEY):
    timestamp = timestamp_int()
    salt = random_str()
    data_encrypted = des3_encrypt(data, salt, ekey)
    necessary = {'service': service,
                 'version': version,
                 'data': data_encrypted,
                 'token': get_token(service, timestamp,
                                    data_encrypted,
                                    salt, version, ekey),
                 'time': timestamp,
                 'salt': salt}
    return necessary


def get_resp_json_or_content(resp, ekey=DEFAULT_EKEY):
    try:
        resp_json = resp.json()
    except ValueError:
        return resp.text.encode('utf-8') or resp.content.encode('utf-8')
    else:
        if resp_json and isinstance(resp_json, (dict,)):
            if 'body' in resp_json.keys():
                text = des3_decrypt(resp_json['body'], resp_json['salt'], ekey)
                try:
                    json_resp = json.loads(text)
                except Exception, e:
                    raise e
                else:
                    text = json.dumps(json_resp, indent=4,
                                      ensure_ascii=False).encode('utf-8')
                finally:
                    return text
            else:
                return json.dumps(resp_json, indent=4,
                                  ensure_ascii=False).encode('utf-8')


def process(url, service='systemTime', version='2.0', data={}, files=None,
            ekey=DEFAULT_EKEY, additional={}, **kwargs):
    '''接口测试函数
    @url：接口地址
    @service: 接口
    @version：版本
    @data： 请求数据
    @files：请求文件
    @ekey：密钥
    @additional：附加参数
    '''
    necessary = encrypt_necessary(service, version, data, ekey)
    kwargs.update(necessary)
    resp = post(url, files, **kwargs)
    return get_resp_json_or_content(resp, ekey)


class MiguThread(threading.Thread):

    def __init__(self, func, args, name=''):
        threading.Thread.__init__(self)
        self.name = name
        self.func = func
        self.args = args

    def get_result(self):
        return self.res

    def run(self):
        self.res = apply(self.func, self.args)


def migu_multi_thread(func, args, times=1):
    threads = list()
    for i in range(times):
        t = MiguThread(func, args, func.__name__)
        threads.append(t)
    for i in range(times):
        threads[i].start()
    for i in range(times):
        threads[i].join()
    results = list()
    for i in range(times):
        try:
            results.append(threads[i].get_result())
        except:
            pass
    return results
