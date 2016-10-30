from django.contrib import admin

# Register your models here.
# from models import CriticalLog
# from models import DebugLog
# from models import ErrorLog
# from models import InfoLog
# from models import NotsetLog
# from models import WarningLog
from models import MyCustomLog


class MyCustomLogAdmin(admin.ModelAdmin):
    list_display = ['levelname', 'module', 'funcName', 'lineno', 'asctime']
    list_filter = ['levelname', 'funcName']
    search_fields = ['message']

    def has_add_permission(self, request):
        return False

    # def has_change_permission(self, request, obj=None):
    #     return False

    def get_readonly_fields(self, request, obj=None):
        all_fileds = ('levelname', 'module', 'funcName', 'pathname',
                      'lineno', 'message', 'asctime', 'created')
        return self.readonly_fields + all_fileds


# admin.site.register(CriticalLog, MyCustomLogAdmin)
# admin.site.register(ErrorLog, MyCustomLogAdmin)
# admin.site.register(WarningLog, MyCustomLogAdmin)
# admin.site.register(InfoLog, MyCustomLogAdmin)
# admin.site.register(DebugLog, MyCustomLogAdmin)
# admin.site.register(NotsetLog, MyCustomLogAdmin)
admin.site.register(MyCustomLog, MyCustomLogAdmin)
