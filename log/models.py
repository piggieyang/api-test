# -*- coding: utf-8 -*-
from django.db import models

# Create your models here.


class MyCustomLogBase(models.Model):
    asctime = models.DateTimeField(verbose_name='时间', auto_now_add=True)
    created = models.FloatField(verbose_name='时间戳')
    funcName = models.CharField(verbose_name='函数', max_length=255,
                                blank=True, null=True)
    levelname = models.CharField(verbose_name='级别', max_length=255)
    lineno = models.IntegerField(verbose_name='行号')
    module = models.CharField(verbose_name='模块', max_length=255)
    message = models.TextField(verbose_name='信息')
    pathname = models.CharField(verbose_name='路径', max_length=255)

    def __str__(self):
        levelname = self.levelname
        module = self.module
        funcname = self.funcName
        lineno = self.lineno
        return '%(levelname)s: %(module)s-%(funcname)s-%(lineno)d' % locals()

    def __unicode__(self):
        return self.__str__()

    class Meta:
        # app_label = 'My_Custom_Log' manage.py syncdb 无法创建该表
        abstract = True
        db_table = 'django_my_custom_log'
        verbose_name = '日志内容'
        verbose_name_plural = '日志内容'
        ordering = ['-created']


# class CriticalLog(MyCustomLogBase):
#     class Meta(MyCustomLogBase.Meta):
#         db_table = 'django_critical_log'
#         verbose_name = '严重错误'
#         verbose_name_plural = verbose_name


# class ErrorLog(MyCustomLogBase):
#     class Meta(MyCustomLogBase.Meta):
#         db_table = 'django_error_log'
#         verbose_name = '错误日志'
#         verbose_name_plural = verbose_name


# class WarningLog(MyCustomLogBase):
#     class Meta(MyCustomLogBase.Meta):
#         db_table = 'django_warning_log'
#         verbose_name = '警告日志'
#         verbose_name_plural = verbose_name


# class InfoLog(MyCustomLogBase):
#     class Meta(MyCustomLogBase.Meta):
#         db_table = 'django_info_log'
#         verbose_name = '信息日志'
#         verbose_name_plural = verbose_name


# class DebugLog(MyCustomLogBase):
#     class Meta(MyCustomLogBase.Meta):
#         db_table = 'django_debug_log'
#         verbose_name = '调试日志'
#         verbose_name_plural = verbose_name


# class NotsetLog(MyCustomLogBase):
#     class Meta(MyCustomLogBase.Meta):
#         db_table = 'django_notset_log'
#         verbose_name = 'Notset日志'
#         verbose_name_plural = verbose_name


class MyCustomLog(MyCustomLogBase):

    class Meta(MyCustomLogBase.Meta):
        db_table = 'django_my_custom_log'
        verbose_name = '日志'
        verbose_name_plural = verbose_name
