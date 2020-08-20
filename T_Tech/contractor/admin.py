from django.contrib import admin
from django.contrib.auth.models import Group, User
from .models import *
from django.http import HttpResponse
from django.urls import path
from . import views


@admin.register(employee)
class emp(admin.ModelAdmin):
    fields = ['thumbnail', 'picture', 'id_number',
              'firstname', 'middlename', 'lastname',
              'company','shift', 'status']
    readonly_fields = ['thumbnail']
    list_display = ['__str__', 'id_number', 'company', 'shift', 'status', 'action']
    list_filter = ['company', 'shift', 'status']
    search_fields = ['firstname', 'lastname']
    ordering = (['lastname'])
    actions = None
    # change_list_template = 'admin/cfmc/employee_change_list.html'
    change_form_template = 'admin/contractor/employee_change_form.html'


@admin.register(logbox)
class logboxAdmin(admin.ModelAdmin):
    list_display = ['employee', 'date_time', 'transaction', 'shift']
    list_filter = ['transaction', 'shift']
    search_fields = ['employee__lastname', 'employee__firstname', 'date_time']
    actions = None
    # change_list_template = 'admin/contractor/logbox_change_list.html'


class d31(admin.ModelAdmin):
    list_display = ('__str__', 'd1','d2','d3','d4','d5','d6','d7','d8','d9','d10',
                    'd11','d12','d13','d14','d15','d16','d17','d18','d19','d20',
                    'd21','d22','d23','d24','d25','d26','d27','d28','d29','d30','d31',
    )
    actions = None
    list_per_page = 200
    #search_fields = (['face_id__firstname', 'face_id__lastname'])
    
    list_filter = ['face_id__company']
    change_list_template = 'admin/contractor/d31_change_list.html'


class d30(admin.ModelAdmin):
    list_display = ('__str__', 'd1','d2','d3','d4','d5','d6','d7','d8','d9','d10',
                    'd11','d12','d13','d14','d15','d16','d17','d18','d19','d20',
                    'd21','d22','d23','d24','d25','d26','d27','d28','d29','d30'
    )
    actions = None
    list_per_page = 200
    #search_fields = (['face_id__firstname', 'face_id__lastname'])
    
    list_filter = ['face_id__company']
    change_list_template = 'admin/contractor/d31_change_list.html'


class d29(admin.ModelAdmin):
    list_display = ('__str__', 'd1','d2','d3','d4','d5','d6','d7','d8','d9','d10',
                    'd11','d12','d13','d14','d15','d16','d17','d18','d19','d20',
                    'd21','d22','d23','d24','d25','d26','d27','d28','d29'
    )
    actions = None
    list_per_page = 200
    #search_fields = (['face_id__firstname', 'face_id__lastname'])
    
    list_filter = ['face_id__company']
    change_list_template = 'admin/contractor/d31_change_list.html'


class CurrentWeekAdmin(admin.ModelAdmin):
    model = CurWeek
    def get_urls(self):
        view_name = '{}_{}_changelist'.format(
            self.model._meta.app_label, self.model._meta.model_name)
        return [
            path('', views.CurrentWeek, name=view_name),
        ]


class CurrentWeekAdminNS(admin.ModelAdmin):
    model = CurWeekNS
    def get_urls(self):
        view_name = '{}_{}_changelist'.format(
            self.model._meta.app_label, self.model._meta.model_name)
        return [
            path('', views.CurrentWeekNS, name=view_name),
        ]


class LastWeekAdmin(admin.ModelAdmin):
    model = LasWeek
    def get_urls(self):
        view_name = '{}_{}_changelist'.format(
            self.model._meta.app_label, self.model._meta.model_name)
        return [
            path('', views.LastWeek, name=view_name),
        ]


class LastWeekAdminNS(admin.ModelAdmin):
    model = LasWeekNS
    def get_urls(self):
        view_name = '{}_{}_changelist'.format(
            self.model._meta.app_label, self.model._meta.model_name)
        return [
            path('', views.LastWeekNS, name=view_name),
        ]


admin.site.register(CurWeek, CurrentWeekAdmin)
admin.site.register(CurWeekNS, CurrentWeekAdminNS)
admin.site.register(LasWeek, LastWeekAdmin)
admin.site.register(LasWeekNS, LastWeekAdminNS)
admin.site.register(january, d31)
admin.site.register(february, d29)
admin.site.register(march, d31)
admin.site.register(april, d30)
admin.site.register(may, d31)
admin.site.register(june, d30)
admin.site.register(july, d31)
admin.site.register(august, d31)
admin.site.register(september, d30)
admin.site.register(october, d31)
admin.site.register(november, d30)
admin.site.register(december, d31)