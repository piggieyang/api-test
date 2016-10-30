# -*- coding: utf-8 -*-
__author__ = 'piggie'

from django.db import models

# Create your models here.


class MiguServiceBase(models.Model):
    """咪咕爱唱接口模板"""

    name = models.CharField(verbose_name='接口名称', max_length=50)
    version = models.CharField(
        verbose_name='接口版本', max_length=5, default='2.0')
    service = models.CharField(verbose_name='服务名称', max_length=50)
    data = models.TextField(verbose_name='请求示例包', default='{}')
    description = models.TextField(verbose_name='接口简介', blank=True, null=True)
    active = models.BooleanField(verbose_name='是否有效', default=True)

    def __str__(self):
        return '%s(%s)' % (self.name, self.version)

    def __unicode__(self):
        return self.__str__()

    class Meta:
        abstract = True
        ordering = ('service', 'version', 'active')
        unique_together = (('version', 'service',),)


class MobileService(MiguServiceBase):
    '''咪咕爱唱手机版接口'''

    class Meta(MiguServiceBase.Meta):
        verbose_name = '手机版接口'
        verbose_name_plural = '手机版接口'
        db_table = 'migu_mobile_service'


class TVService(MiguServiceBase):
    '''咪咕爱唱电视版接口'''

    class Meta(MiguServiceBase.Meta):
        verbose_name = 'TV版接口'
        verbose_name_plural = 'TV版接口'
        db_table = 'migu_tv_service'


class PluginService(MiguServiceBase):
    '''咪咕爱唱插件接口'''

    class Meta(MiguServiceBase.Meta):
        verbose_name = '插件接口'
        verbose_name_plural = '插件接口'
        db_table = 'migu_plugin_service'


class OpenService(MiguServiceBase):
    '''咪咕爱唱开放平台接口'''

    class Meta(MiguServiceBase.Meta):
        verbose_name = '开放平台接口'
        verbose_name_plural = '开放平台接口'
        db_table = 'migu_open_service'


class Server(models.Model):
    '''咪咕爱唱服务器配置'''

    name = models.CharField(verbose_name='接口地址名称', max_length=50)
    address = models.CharField(verbose_name='接口地址', max_length=255)
    key = models.CharField(verbose_name='密钥', max_length=50,
                           blank=True, null=True,
                           help_text='接口加/解密的密钥')
    postfix = models.CharField(verbose_name='接口后缀',
                               max_length=50, default='/do')
    postfix_file = models.CharField(verbose_name='文件上传接口后缀',
                                    max_length=50, default='/do_file')
    additional = models.TextField(verbose_name='附加参数', default='{}',
                                  help_text='JSON格式，用于添加到请求的可选参数')
    active = models.BooleanField(verbose_name='是否有效', default=True)

    def __str__(self):
        return self.name

    def __unicode__(self):
        return self.__str__()

    class Meta:
        verbose_name = '环境配置'
        verbose_name_plural = '环境地址'
        db_table = 'migu_server'
        ordering = ['name']


class Result(models.Model):
    """咪咕爱唱接口测试结果"""

    server = models.ForeignKey(to=Server, verbose_name='环境',
                               null=True)  # 测试后可以删除环境保存结果
    service = models.CharField(verbose_name='服务名称', max_length=50)
    version = models.CharField(verbose_name='版本', max_length=25)
    data = models.TextField(verbose_name='请求包', default='{}')
    url = models.TextField(verbose_name='GET地址')
    headers = models.TextField(verbose_name='响应头', blank=True, null=True)
    status = models.IntegerField(verbose_name='返回状态码', blank=True, null=True)
    message = models.CharField(
        verbose_name='返回描述', max_length=255, blank=True, null=True)
    result = models.TextField(verbose_name='返回结果', blank=True, null=True)
    ExecutionTime = models.FloatField(verbose_name='接口耗时', default=9999.9)
    CreateTime = models.DateTimeField(verbose_name='执行时间', auto_now_add=True)

    def __str__(self):
        return self.service

    def __unicode__(self):
        return self.__str__()

    class Meta:
        verbose_name = '执行结果'
        verbose_name_plural = '执行结果'
        db_table = 'migu_test_result'
        ordering = ['-CreateTime']


class Module(models.Model):
    '''咪咕爱唱组合接口模块'''

    name = models.CharField(verbose_name='模块名称', max_length=50)
    service_list = models.TextField(verbose_name='接口列表', default='[]')
    param_dict = models.TextField(verbose_name='参数列表', default='{}')
    additional = models.TextField(
        verbose_name='附加参数', default='{}',
        help_text='JSON格式，用于添加到请求的可选参数,如版本号等基础参数')
    description = models.TextField(verbose_name='模块描述', blank=True, null=True)
    active = models.BooleanField(verbose_name='是否有效', default=True)

    def __str__(self):
        return self.name

    def __unicode__(self):
        return self.__str__()

    class Meta:
        verbose_name = '组合接口'
        verbose_name_plural = '功能模块'
        db_table = 'migu_module'
        ordering = ['name']
