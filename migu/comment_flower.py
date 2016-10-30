# -*- coding: utf-8 -*-
import string

from api.service.process import process
from api.service.process import random_str
from api.service.process import timestamp_int


def systemTime(url, **kwargs):
    service = 'systemTime'
    version = '2.0'
    data = {}
    data.update(kwargs)
    return process(url=url, service=service, version=version, data=data)


def comment(url, **kwargs):
    service = 'comment'
    version = '2.0'
    data = {}
    data.update(kwargs)
    return process(url=url, service=service, version=version, data=data)


def listComment(url, **kwargs):
    service = 'listComment'
    version = '2.0'
    data = {}
    data.update(kwargs)
    return process(url=url, service=service, version=version, data=data)


def delComment(url, **kwargs):
    service = 'delComment'
    version = '2.0'
    data = {}
    data.update(kwargs)
    return process(url=url, service=service, version=version, data=data)


def listUserComment(url, **kwargs):
    service = 'listUserComment'
    version = '2.0'
    data = {}
    data.update(kwargs)
    return process(url=url, service=service, version=version, data=data)


def commentPraise(url, **kwargs):
    service = 'commentPraise'
    version = '3.0'
    data = {}
    data.update(kwargs)
    return process(url=url, service=service, version=version, data=data)


def commentPraiseList(url, **kwargs):
    service = 'commentPraiseList'
    version = '3.0'
    data = {}
    data.update(kwargs)
    return process(url=url, service=service, version=version, data=data)


def dynamicComment(url, **kwargs):
    service = 'dynamicComment'
    version = '4.0'
    data = {
        "did": "03b9e94e95114d889079794a25816dcb",
        "sn": "201512110953000000000001",
        "content": "评论点啥好呢",
        "pid": "",
        "from": 2240,
        "to": 2239,
        "tags": [
            "2239",
            "2240"
        ]
    }
    data.update(kwargs)
    return process(url=url, service=service, version=version, data=data)


def dynamicCommentList(url, **kwargs):
    service = 'dynamicCommentList'
    version = '4.0'
    data = {}
    data.update(kwargs)
    return process(url=url, service=service, version=version, data=data)


def dynamicCommentDel(url, **kwargs):
    service = 'dynamicCommentDel'
    version = '4.0'
    data = {}
    data.update(kwargs)
    return process(url=url, service=service, version=version, data=data)


def flower2(url, **kwargs):
    service = 'flower'
    version = '2.0'
    data = {}
    data.update(kwargs)
    return process(url=url, service=service, version=version, data=data)


def flower3(url, **kwargs):
    service = 'flower'
    version = '3.0'
    data = {}
    data.update(kwargs)
    return process(url=url, service=service, version=version, data=data)


def flowerList(url, **kwargs):
    service = 'flowerList'
    version = '2.0'
    data = {}
    data.update(kwargs)
    return process(url=url, service=service, version=version, data=data)


def flowerListGroupByUser(url, **kwargs):
    service = 'flowerListGroupByUser'
    version = '2.0'
    data = {}
    data.update(kwargs)
    return process(url=url, service=service, version=version, data=data)


def flowerListToUser(url, **kwargs):
    service = 'flowerListToUser'
    version = '2.0'
    data = {}
    data.update(kwargs)
    return process(url=url, service=service, version=version, data=data)


def goldFlower(url, **kwargs):
    service = 'goldFlower'
    version = '3.0'
    data = {}
    data.update(kwargs)
    return process(url=url, service=service, version=version, data=data)


def dynamicFlower(url, **kwargs):
    service = 'dynamicFlower'
    version = '4.0'
    data = {}
    data.update(kwargs)
    return process(url=url, service=service, version=version, data=data)


def dynamicFlowerStat(url, **kwargs):
    service = 'dynamicFlowerStat'
    version = '4.0'
    data = {}
    data.update(kwargs)
    return process(url=url, service=service, version=version, data=data)


def dynamicPub(url, **kwargs):
    service = 'dynamicPub'
    version = '4.0'
    data = {
        "content": "动态发布怎么打成动态发布了呢",
        "uToken": "en2St0DRU4q3tlXHlFcG5iKJrhyyRp47",
        "sn": "2015121110200000000001",
        "uid": 816,
        "title": "短头发不"
    }
    files = kwargs.pop('files')
    data.update(kwargs)
    return process(url=url, service=service, version=version,
                   data=data, files=files)


def main():
    url = 'http://172.16.4.196:8080'
    # print systemTime(url=url + '/do')
    # print dynamicPub(url + '/do_file',
    #                  # uid=2246,
    #                  # uToken="qCXFJTowQ5fA+wDRLgc9V871cL722IHJu091s6m/Ik0H5w16ymfoLJ0pZwtfRgmOPejXdTnPO38=",
    #                  # uid=2178,
    #                  # uToken="tiR2IL/xAgXV8ibtI0bou55zF5w2g/Q30KM2yRxyn0gdTSh6RFv931LqYT8Xs2MJ",
    #                  uid=2239,
    #                  uToken="HDwTdVTyTlmsFIflXy4zUwJYbzJNyDyT",
    #                  sn='%d%s' % (timestamp_int(), random_str(
    #                      length=16, rules=string.letters + string.digits)),
    #                  title=random_str(length=20, rules=string.printable),
    #                  content=random_str(length=20, rules=string.printable),
    #                  files=['D:/Pictures/CDN/1.jpg',
    #                         'D:/Pictures/CDN/2.jpg',
    #                         'D:/Pictures/CDN/3.jpg'])
    print dynamicComment(url + '/do', did="cd23391a0c9f4f52bda14e02191471f3",
                         pid="",
                         # from=2235,
                         to=2239, tags=["2239", "2240"],
                         sn='%d%s' % (timestamp_int(), random_str(
                             length=16, rules=string.letters + string.digits)),
                         content=random_str(length=20, rules=string.printable))

if __name__ == '__main__':
    main()
