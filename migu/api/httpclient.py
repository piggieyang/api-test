# -*- coding: utf-8 -*-
import logging
import os

from migu.api import requests


log = logging.getLogger('my.custom.log')


def get_filename(filepath):
    try:
        return os.path.basename(filepath)
    except Exception, e:
        log.error(e)
        raise


def get(url, **kwargs):
    return requests.get(url=url.strip(), params=kwargs,
                        auth=('ryan', 'stornado'),
                        verify=True)


def head(url, **kwargs):
    return requests.head(url=url.strip(), params=kwargs,
                         auth=('ryan', 'stornado'),
                         verify=True)


def post(url, files=None, **kwargs):
    fp = None
    if files:
        if isinstance(files, (file,)):
            fp = {'files': (files.name, files)}
        elif isinstance(files, (basestring,)):
            fp = {'files': (get_filename(files), open(files, 'rb'))}
        elif isinstance(files, (list,)):
            fp = list()
            for f in files:
                if isinstance(f, (file,)):
                    fp.append(('files', (f.name), f))
                elif isinstance(f, (basestring,)):
                    fp.append(('files', (get_filename(f), open(f, 'rb'))))
                elif isinstance(f, (tuple,)) and len(f) == 2:
                    try:
                        fp.append(('files', (f[1], open(f[0], 'rb'))))
                    except IOError:
                        try:
                            fp.append(('files', (f[0], open(f[1], 'rb'))))
                        except IOError:
                            pass
        elif isinstance(files, (dict,)):
            fp = list()
            for (n, f) in files.items():
                if isinstance(f, (file,)):
                    fp.append(n, (f.name, f))
                elif isinstance(f, (basestring,)):
                    fp.append((n, (get_filename(f), open(f, 'rb'))))
        else:
            raise TypeError('files not support this type: %s' % type(files))
    return requests.post(url, data=kwargs, files=fp,
                         auth=('ryan', 'stornado'),
                         verify=True)


def put(url, **kwargs):
    return requests.put(url=url.strip(), data=kwargs,
                        auth=('ryan', 'stornado'),
                        verify=True)


def delete(url, **kwargs):
    return requests.delete(url=url.strip(), data=kwargs,
                           auth=('ryan', 'stornado'),
                           verify=True)


def main():
    # print requests.get('http://zxye.me').content
    print post('http://zxye.me', files='D:/rss.png')
    print post('http://zxye.me', files=['D:/rss.png', 'D:/rss.png'])
    print post('http://zxye.me',
               files=dict(image1='D:/rss.png', image2='D:/rss.png'))

if __name__ == '__main__':
    main()
