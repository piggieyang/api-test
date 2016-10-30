from django.contrib import admin

# Register your models here.
from models import MobileService
from models import Module
from models import OpenService
from models import PluginService
from models import Result
from models import Server
from models import TVService


def disable(modeladmin, request, queryset):
    queryset.update(active=False)


def active(modeladmin, request, queryset):
    queryset.update(active=True)

disable.short_description = 'Disable selected'
active.short_description = 'Active selected'


class ServiceAdmin(admin.ModelAdmin):
    list_display = ['name', 'service', 'version', 'active']
    list_editable = ['active']
    list_filter = ['active', 'version']
    search_fields = ['name', 'service', 'data', 'description']
    actions = [disable, active]
    # "Save and add another" will be replaced by a "Save as" button.
    save_as = True


class ServerModelAdmin(admin.ModelAdmin):
    list_display = ['name', 'address', 'additional', 'active']
    list_editable = ['active']
    list_filter = ['active', 'name']
    actions = [disable, active]
    save_as = True


class ResultModelAdmin(admin.ModelAdmin):
    list_display = ['service', 'version', 'server', 'data', 'status']
    list_filter = ['version', 'server', 'status', 'service']
    search_fields = ['service', 'data', 'result', 'status', 'message']

    def has_add_permission(self, request):
        return False

    # def has_change_permission(self, request, obj=None):
    #     return False

    def get_readonly_fields(self, request, obj=None):
        all_fields = ('server', 'service', 'version', 'data',
                      'url', 'headers', 'status', 'message',
                      'result', 'ExecutionTime', 'CreateTime')
        return self.readonly_fields + all_fields


class ModuleModelAdmin(admin.ModelAdmin):
    list_display = ['name', 'active']
    list_editable = ['name', 'active']
    list_filter = ['active']
    search_fields = ['service_list', 'param_dict', 'description']
    actions = [disable, active]


admin.site.register(MobileService, ServiceAdmin)
admin.site.register(TVService, ServiceAdmin)
admin.site.register(PluginService, ServiceAdmin)
admin.site.register(OpenService, ServiceAdmin)
admin.site.register(Server, ServerModelAdmin)
admin.site.register(Result, ResultModelAdmin)
admin.site.register(Module, ModuleModelAdmin)
