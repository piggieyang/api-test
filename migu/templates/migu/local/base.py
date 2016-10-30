# -*- coding: utf-8 -*-
# {% now "r" %}

from api.service import process

{% block functions %}{% endblock functions %}


def main():
    url = 'http://test.migu.cn:90'
    print systemTime(url)

if __name__ == '__main__':
    main()
