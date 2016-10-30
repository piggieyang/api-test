# -*- coding: utf-8 -*-


class PKCS7(object):

    def __init__(self, block_size=8):
        self.block_size = block_size

    def encode(self, data):
        if isinstance(data, (basestring,)):
            length = len(data)
            amount_to_pad = self.block_size - (length % self.block_size)
            if amount_to_pad == 0:
                amount_to_pad = self.block_size
            pad = chr(amount_to_pad)
            return data + pad * amount_to_pad
        else:
            raise TypeError('%s is not allowed' % type(data))

    def decode(self, data):
        if isinstance(data, (basestring,)):
            pad = ord(data[-1])
            if pad < 1 or pad > self.block_size:
                pad = 0
            return data[:-pad]
        else:
            raise TypeError('%s is not allowed' % type(data))
