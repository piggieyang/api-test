{% extends "migu/local/base.py" %}
{% block functions %}
{% for service in services %}
{% autoescape off %}
def {{ service.service }}(url, **kwargs):
    '''{{ service.name }}
    {{ service.description }}
    '''
    service = '{{ service.service }}'
    version = '{{ service.version }}'
    data = {{ service.data }}
    data.update(kwargs)
    return process(url, service, version, data)
{% endautoescape %}

{% empty %}
def systemTime(url, **kwargs):
    '''获取系统时间接口
    '''
    service = 'systemTime'
    version = '2.0'
    data = dict()
    data.update(kwargs)
    return process(url, service, version, data)

{% endfor %}
{% endblock functions %}