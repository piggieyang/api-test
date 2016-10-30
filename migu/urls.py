# -*- coding: utf-8 -*-
__author__ = 'piggie'
from django.conf.urls import url
from migu import views

urlpatterns = [
    url(r'^$', views.home),
    url(r'^query/result/$', views.query),
    url(r'^decrypt/result/$', views.decrypt),
    url(r'^encrypt/result/$', views.encrypt),
    url(r'^ajax/services/$', views.ajax_services),
    url(r'^ajax/service/data/$', views.ajax_service_data),
    url(r'^multi/$', views.multi_home),
    url(r'^repeat/result/$', views.repeat_query),
    url(r'^multi/result/$', views.multi_query),
    url(r'^module/$', views.module_home),
    url(r'^module/result/$', views.module_query),
    url(r'^ajax/module/services/params/$',
        views.ajax_module_params),
    url(r'^ajax/multi/services/params/$',
        views.ajax_multi_params),
    url(r'^download/sql/results/$', views.make_result_download),
    url(r'^download/(?P<template_type>python|jmeter|sql)/$',
        views.make_download),
]
