# -*- coding: utf-8 -*-
import base64

from Crypto.Cipher import DES3
from rsa import PKCS7


class MiguDES3(object):

    def __init__(self, key, *args, **kwargs):
        self.pkcs = PKCS7(block_size=8)
        self.cipher = DES3.new(key, *args, **kwargs)

    def encrypt(self, data):
        paded_data = self.pkcs.encode(data)
        encrypted_data = self.cipher.encrypt(paded_data)
        return base64.b64encode(encrypted_data)

    def decrypt(self, data):
        encrypt_data = base64.b64decode(data)
        decrypted_data = self.cipher.decrypt(encrypt_data)
        return self.pkcs.decode(decrypted_data)
