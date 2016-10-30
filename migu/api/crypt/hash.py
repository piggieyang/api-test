# -*- coding: utf-8 -*-
import hashlib


def md5(text):
    if not text:
        text = ''
    return hashlib.md5(text).hexdigest()


def file_md5(files, block_size=128):
    m = hashlib.md5()

    def wrapper(f):
        while True:
            buf = f.read(block_size)
            if not buf:
                break
            m.update(buf)

    if isinstance(files, file):
        wrapper(files)
    elif isinstance(files, basestring):
        with open(name=files, mode='rb') as f:
            wrapper(f)
    else:
        raise TypeError("%s is not allowed" % type(files))
    return m.hexdigest()


def main():
    print md5(None)
    print file_md5()

if __name__ == '__main__':
    main()
