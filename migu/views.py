# -*- coding: utf-8 -*-
import json
import logging

from django.contrib.auth.decorators import login_required
from django.http import Http404
from django.http import HttpResponse
from django.shortcuts import get_list_or_404
from django.shortcuts import get_object_or_404
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.utils import timezone
from urllib import urlencode
# Create your views here.
from migu.api.service.djprocess import djprocess
from migu.api.service.djprocess import find_multi_service
from migu.api.service.djprocess import find_one_service, get_service_by_name
from migu.api.service.process import DEFAULT_EKEY
from migu.api.service.process import MiguThread
from migu.api.service.process import des3_decrypt
from migu.api.service.process import encrypt_necessary
from migu.api.service.process import get_func_val
from migu.api.service.process import migu_multi_thread
from migu.api.service.process import now
from migu.models import MobileService
from migu.models import Module
from migu.models import OpenService
from migu.models import PluginService
from migu.models import Result
from migu.models import Server
from migu.models import TVService

log = logging.getLogger('my.custom.log')


@login_required
def home(request):
    servers = get_list_or_404(Server, active=True)
    return render_to_response(template_name='migu/index.html',
                              context={'servers': servers},
                              context_instance=RequestContext(request))


@login_required
def query(request):
    post = request.POST
    server = get_object_or_404(Server, pk=post.get('server', 1))
    service = post.get('service', 'systemTime')
    version = post.get('version', '2.0')
    data = post.get('data', '{}')
    # files = request.FILES.get('files', None)
    files = request.FILES.getlist('files', list())
    service = service or 'systemTime'
    data = data or '{}'
    try:
        dataj = json.loads(get_func_val(data))
    except ValueError, value_error:
        log.error(value_error)
        content = 'Please input JSON value\n\n\n\n%s' % data
        return HttpResponse(content=content,
                            content_type='text/plain;charset=utf-8')
    else:
        data = dataj
    try:
        resp = djprocess(server=server, service=service,
                         version=version, data=data,
                         files=files)
    except Exception, e:
        response = HttpResponse(content=e,
                                # status_code=500,
                                # reason_phrase='Internal Server Error',
                                content_type='text/plain;charset=utf-8')
        response.status_code = 500
        response.reason_phrase = 'Internal Server Error'
    else:
        migu_headers = dict(json.loads(resp.headers))
        content_type = migu_headers.get(
            'Content-Type', 'text/html;charset=utf-8')
        response = HttpResponse(content=resp.result,
                                content_type=content_type)
        for k, v in migu_headers.items():
            response['Migu_%s' % k] = v
    finally:
        return response


@login_required
def decrypt(request):
    post = request.POST
    data = post.get('data')
    salt = post.get('salt')
    data = data.replace('data=', '')
    data = data.replace('body=', '')
    salt = salt.replace('salt=', '')
    text = des3_decrypt(data, salt)
    try:
        textd = json.loads(text)
    except:
        pass
    else:
        text = json.dumps(textd, indent=4, sort_keys=True,
                          ensure_ascii=False).encode('utf-8')
    return HttpResponse(content=text,
                        content_type='text/plain;charset=utf-8')


@login_required
def encrypt(request):
    post = request.POST
    servers = get_list_or_404(Server, active=True)
    service = post.get('service', 'systemTime')
    version = post.get('version', '2.0')
    data = post.get('data', '{}')
    # files = request.FILES.get('files', None)
    files = request.FILES.getlist('files', list())
    service = service or 'systemTime'
    data = data or '{}'
    try:
        dataj = json.loads(get_func_val(data))
    except ValueError:
        content = 'Please input JSON value\n\n\n\n%s' % data
        return HttpResponse(content=content,
                            content_type='text/plain;charset=utf-8')
    else:
        data = dataj
    resp = list()
    for server in servers:
        if files:
            url = server.address + server.postfix_file
        else:
            url = server.address + server.postfix
        necessary = encrypt_necessary(service, version, data,
                                      server.key or DEFAULT_EKEY)
        necessary2 = necessary.copy()
        djson = json.dumps(data, ensure_ascii=False).encode('utf-8')
        necessary2.update(dict(data=djson, test='yes'))
        urls = [url + '?' + urlencode(necessary2),
                url + '?' + urlencode(necessary)]
        resp.append({server.name: urls})
    pretty = json.dumps(resp, indent=4, ensure_ascii=False).encode('utf-8')
    return HttpResponse(pretty, content_type='text/plain;charset=utf-8')


@login_required
def ajax_services(request):
    post = request.POST
    service = post.get('service', 'systemTime')
    services = find_multi_service(service)
    result = list()
    for s in services:
        result.append(s.service)
    return HttpResponse(content=json.dumps(list(set(result))),
                        content_type='text/plain;charset=utf-8')


@login_required
def ajax_service_data(request):
    post = request.POST
    service = post.get('service', 'systemTime')
    version = post.get('version', '2.0')
    result = find_one_service(service, version)
    return HttpResponse(content=result.data if result else '{}',
                        content_type='text/plain;charset=utf-8')


@login_required
def multi_home(request):
    servers = get_list_or_404(Server, active=True)
    return render_to_response(template_name='migu/multi/index.html',
                              context={'servers': servers},
                              context_instance=RequestContext(request))


@login_required
def repeat_query(request):
    post = request.POST
    server = get_object_or_404(Server, pk=post.get('server', 1))
    service = post.get('service', 'systemTime')
    version = post.get('version', '2.0')
    data = post.get('data', '{}')
    # files = request.FILES.get('files', None)
    files = request.FILES.getlist('files', list())
    repeat = post.get('repeat', 1)
    thread = post.get('thread', False)
    service = service or 'systemTime'
    data = data or '{}'
    try:
        dataj = json.loads(get_func_val(data))
    except ValueError:
        content = 'Please input JSON value\n\n\n\n%s' % data
        return HttpResponse(content=content,
                            content_type='text/plain;charset=utf-8')
    else:
        data = dataj
    repeat = int(repeat) or 1
    thread = True if thread else False
    results = list()
    create = timezone.now()
    if thread:
        results.extend(migu_multi_thread(djprocess,
                                         (server, service, version, data,
                                          files),
                                         repeat))
    else:
        for i in range(1, repeat + 1 if repeat > 0 else 2):
            try:
                results.append(djprocess(server=server, service=service,
                                         version=version, data=data,
                                         files=files))
            except:
                pass
    execute_time = timezone.now() - create
    return render_to_response(template_name='migu/results.html',
                              context={'server': server,
                                       'results': results,
                                       'create': create,
                                       'execute_time': execute_time},
                              context_instance=RequestContext(request))


@login_required
def multi_query(request):
    post = request.POST
    server = get_object_or_404(Server, pk=post.get('server', 1))
    service = post.get('service', 'systemTime')
    version = post.get('version', '2.0')
    data = post.get('data', '{}')
    # files = request.FILES.get('files', None)
    files = request.FILES.getlist('files', list())
    params = post.get('params', '{}')
    thread = post.get('thread', False)
    service = service or 'systemTime'
    data = data or '{}'
    try:
        dataj = json.loads(get_func_val(data))
    except ValueError:
        content = 'Please input JSON value\n\n\n\n%s' % data
        return HttpResponse(content=content,
                            content_type='text/plain;charset=utf-8')
    else:
        data = dataj
    params = params or '{}'
    params = json.loads(params)
    thread = True if thread else False
    results = list()
    create = timezone.now()
    if params and isinstance(params, (dict,)) and params.keys():
        # for key in params.keys():
        # 只接受单参数变化
        key = params.keys()[0]
        k_value = params[key]
        if isinstance(k_value, (list,)):
            if thread:
                threads = list()
                length = len(k_value)
                sequence = range(length)
                for i in sequence:
                    data[key] = k_value[i]
                    t = MiguThread(djprocess,
                                   (server, service,
                                    version, data.copy(),
                                    files),
                                   djprocess.__name__)
                    threads.append(t)

                for i in sequence:
                    threads[i].start()
                for i in sequence:
                    threads[i].join()
                for i in sequence:
                    try:
                        results.append(threads[i].get_result())
                    except:
                        pass
            else:
                for value in k_value:
                    data[key] = value
                    try:
                        results.append(djprocess(server=server,
                                                 service=service,
                                                 version=version,
                                                 data=data,
                                                 files=files))
                    except:
                        pass
        elif isinstance(k_value, (basestring, int, float, bool,)):
            data[key] = k_value
            results.append(djprocess(server=server, service=service,
                                     version=version, data=data,
                                     files=files))
    else:
        results.append(djprocess(server=server, service=service,
                                 version=version, data=data,
                                 files=files))
    execute_time = timezone.now() - create
    return render_to_response(template_name='migu/results.html',
                              context={'server': server,
                                       'results': results,
                                       'create': create,
                                       'execute_time': execute_time},
                              context_instance=RequestContext(request))


@login_required
def make_download(request, template_type='python'):
    service_models = dict(mobile=MobileService, tv=TVService,
                          plugin=PluginService, open=OpenService)
    model = request.GET.get('model', 'mobile')
    smodel = service_models.get(model, MobileService)
    services = get_list_or_404(smodel, active=True)
    for service in services:
        service.data = json.dumps(json.loads(service.data),
                                  ensure_ascii=False).encode('utf-8')
    template_name_switch = dict(python='migu/local/functions.py',
                                jmeter='migu/jmeter/testplan.jmx',
                                sql='migu/sql/services.sql')
    content_type_switch = dict(python='text/plain;charset=UTF-8',
                               jmeter='application/force-download')
    sql_postfix = 'service_%s.sql' % now
    file_name_postfix_switch = dict(python='functions.py',
                                    jmeter='testpan.jmx',
                                    sql=sql_postfix)
    template_name = template_name_switch.get(template_type,
                                             'migu/local/functions.py')

    content_type = content_type_switch.get(template_type,
                                           'text/plain;charset=UTF-8')
    # log.info('%(template_type)s,%(template_name)s' % locals())
    response = render_to_response(template_name=template_name,
                                  context={'services': services,
                                           'model': model, 'now': now},
                                  content_type=content_type,
                                  context_instance=RequestContext(request))
    file_name_postfix = file_name_postfix_switch.get(template_type,
                                                     'functions.py')
    file_name = '%s_%s' % (model, file_name_postfix)
    content_disposition = 'attachment; filename=%s' % file_name
    response['Content-Disposition'] = content_disposition
    content_length = len(response.content)
    response['Content-Length'] = content_length
    return response


@login_required
def make_result_download(request):
    results = get_list_or_404(Result)
    response = render_to_response(template_name='migu/sql/results.sql',
                                  context={'results': results, 'now': now},
                                  content_type='text/plain;charset=UTF-8',
                                  context_instance=RequestContext(request))
    file_name = 'migu_test_results_%s.sql' % now
    content_disposition = 'attachment; filename=%s' % file_name
    response['Content-Disposition'] = content_disposition
    content_length = len(response.content)
    response['Content-Length'] = content_length
    return response


@login_required
def module_home(request):
    servers = get_list_or_404(Server, active=True)
    try:
        modules = get_list_or_404(Module, active=True)
    except Http404:
        modules = [dict(name='请先添加模块...')]
    return render_to_response(template_name='migu/module/index.html',
                              context={'servers': servers, 'modules': modules},
                              context_instance=RequestContext(request))


@login_required
def module_query(request):
    post = request.POST
    server_id = post.get('server', 1)
    server_id = server_id or 1
    server = get_object_or_404(Server, pk=server_id)
    services = post.get('services', '[]')
    params = post.get('params', '{}')
    services = services or '[]'
    params = params or '{}'
    services = json.loads(services)
    params = json.loads(get_func_val(params))
    service_response = dict()
    results = list()
    execute_begin = timezone.now()
    for s in services:
        srvc = get_service_by_name(s)
        if not srvc:
            break
        key = '%s(%s)' % (srvc.service, srvc.version)
        current_service_request_data = params.get(
            key, params.get(srvc.service))
        # get params
        for curt_ser_key, curt_ser_key_val in current_service_request_data.items():
            try:
                if isinstance(curt_ser_key_val, (dict,)):
                    # 匹配"logout":{"uid":{"login":"id"}}类型
                    for pre_ser, pre_ser_resp_key in curt_ser_key_val.items():
                        pre_srvc = get_service_by_name(pre_ser)
                        pre_key = '%s(%s)' % (
                            pre_srvc.service, pre_srvc.version)
                        try:
                            pre_ser_resp = service_response[pre_key]
                            current_service_request_data[
                                curt_ser_key] = pre_ser_resp[pre_ser_resp_key]
                        except Exception, e:
                            # raise e
                            log.error(e)
                elif isinstance(curt_ser_key_val, (list,)):
                    # 匹配"kRoomComment":{"kRoomId":["kRoomMyList",0,"kRoomId"]}类型
                    if len(curt_ser_key_val) == 3:
                        pre_ser = curt_ser_key_val[0]
                        pre_ser_resp_index = curt_ser_key_val[1]
                        pre_ser_resp_index_key = curt_ser_key_val[2]
                        pre_srvc = get_service_by_name(pre_ser)
                        pre_key = '%s(%s)' % (
                            pre_srvc.service, pre_srvc.version)
                        try:
                            pre_ser_resp = service_response[pre_key]
                            current_service_request_data[curt_ser_key] = pre_ser_resp[
                                pre_ser_resp_index][pre_ser_resp_index_key]
                        except Exception, e:
                            log.error(e)
                else:
                    pass
            except Exception, e:
                log.error(e)
        # srvc_data = json.loads(srvc.data)
        # srvc_data.update(current_service_request_data)
        srvc_data = current_service_request_data
        result = djprocess(server=server, service=srvc.service,
                           version=srvc.version, data=srvc_data)
        results.append(result)
        service_response[key] = json.loads(result.result)
    execute_time = timezone.now() - execute_begin
    return render_to_response(template_name='migu/results.html',
                              context={'server': server,
                                       'create': execute_begin,
                                       'execute_time': execute_time,
                                       'results': results},
                              context_instance=RequestContext(request))


@login_required
def ajax_module_params(request):
    post = request.POST
    module_id = post.get('module', 1)
    module_id = module_id or 1
    module = get_object_or_404(Module, pk=module_id)
    params = json.loads(module.param_dict)
    for key in params.keys():
        try:
            params[key].update(json.loads(get_func_val(module.additional)))
        except ValueError:
            pass
    result = dict(services=json.loads(module.service_list),
                  params=params)
    resp = json.dumps(result, ensure_ascii=False).encode('utf-8')
    return HttpResponse(content=resp,
                        content_type='text/plain;charset=UTF-8')


@login_required
def ajax_multi_params(request):
    post = request.POST
    services = post.get('services', '[]')
    params = post.get('params', '{}')
    services = services or '[]'
    params = params or '{}'
    services = json.loads(services)
    params = json.loads(params)
    result = dict()
    if services:
        for s in services:
            srvc = get_service_by_name(s)
            if srvc:
                key = '%s(%s)' % (srvc.service, srvc.version)
                result[key] = json.loads(srvc.data)
    resp = json.dumps(result, ensure_ascii=False).encode('utf-8')
    return HttpResponse(content=resp, content_type='text/plain;charset=UTF-8')
