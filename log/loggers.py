# -*- coding: utf-8 -*-
import logging

from django.utils import timezone


class LogToDBHandler(logging.Handler):

    def __init__(self):
        logging.Handler.__init__(self)

    def emit(self, record):
        try:
            # from log.models import CriticalLog
            # from log.models import DebugLog
            # from log.models import ErrorLog
            # from log.models import InfoLog
            # from log.models import NotsetLog
            # from log.models import WarningLog
            from log.models import MyCustomLog
            message = None
            try:
                message = record.message
            except AttributeError:
                try:
                    message = record.msg % record.args
                except TypeError:
                    if record.args:
                        message = 'log.msg: %s,\n\nlog.args: %s' % (
                            record.msg, record.args)
                    else:
                        message = record.msg

            # ERROR_LEVEL_MODEL = dict(CRITICAL=CriticalLog, ERROR=ErrorLog,
            #                          WARNING=WarningLog, INFO=InfoLog,
            #                          DEBUG=DebugLog, NOTSET=NotsetLog)
            # LOG_MODEL = ERROR_LEVEL_MODEL.get(record.levelname, NotsetLog)

            # log = LOG_MODEL(
            log = MyCustomLog(
                asctime=getattr(record, 'asctime', timezone.now()),
                created=record.created,
                funcName=record.funcName,
                levelname=record.levelname,
                lineno=record.lineno,
                module=record.module,
                message=message,
                pathname=record.pathname,
            )
            log.save()
        finally:
            return None


class RequireSaeFalse(logging.Filter):

    def filter(self, record):
        try:
            import sae
        except ImportError:
            return True
        else:
            return False
        # finally:
        #     from os import environ
        #     return not ('SERVER_SOFTWARE' in environ)


class RequireSaeTrue(logging.Filter):

    def filter(self, record):
        try:
            import sae
        except ImportError:
            return False
        else:
            return True
        # finally:
        #     from os import environ
        #     return ('SERVER_SOFTWARE' in environ)
