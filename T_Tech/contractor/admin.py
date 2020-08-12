from django.contrib import admin
from django.contrib.auth.models import Group, User
from .models import *
from django.http import HttpResponse
from django.urls import path



@admin.register(employee)
class emp(admin.ModelAdmin):
    fields = ['thumbnail', 'picture',
              'firstname', 'middlename', 'lastname',
              'company','shift', 'status']
    readonly_fields = ['thumbnail']
    list_display = ['__str__', 'company', 'shift', 'status', 'action']
    list_filter = ['company', 'shift', 'status']
    search_fields = ['firstname', 'lastname']
    ordering = (['lastname'])
    # change_list_template = 'admin/cfmc/employee_change_list.html'
    change_form_template = 'admin/contractor/employee_change_form.html'


@admin.register(logbox)
class logboxAdmin(admin.ModelAdmin):
    list_display = ['employee', 'date_time', 'transaction']
    list_filter = ['transaction']
    search_fields = ['employee__lastname', 'employee__firstname', 'date_time']



class d31(admin.ModelAdmin):
    list_display = ('__str__', 'd1','d2','d3','d4','d5','d6','d7','d8','d9','d10',
                    'd11','d12','d13','d14','d15','d16','d17','d18','d19','d20',
                    'd21','d22','d23','d24','d25','d26','d27','d28','d29','d30','d31',
    )
    #actions = None
    
    search_fields = (['face_id__firstname', 'face_id__lastname'])
    def has_add_permission(self, request, obj=None):
        if request.user.groups.filter(name='admin').exists():
            return True
        else:
            return False

class d30(admin.ModelAdmin):
    list_display = ('__str__', 'd1','d2','d3','d4','d5','d6','d7','d8','d9','d10',
                    'd11','d12','d13','d14','d15','d16','d17','d18','d19','d20',
                    'd21','d22','d23','d24','d25','d26','d27','d28','d29','d30'
    )
    #actions = None
    
    search_fields = (['face_id__firstname', 'face_id__lastname'])
    def has_add_permission(self, request, obj=None):
        if request.user.groups.filter(name='admin').exists():
            return True
        else:
            return False

class d29(admin.ModelAdmin):
    list_display = ('__str__', 'd1','d2','d3','d4','d5','d6','d7','d8','d9','d10',
                    'd11','d12','d13','d14','d15','d16','d17','d18','d19','d20',
                    'd21','d22','d23','d24','d25','d26','d27','d28','d29'
    )
    #actions = None
    
    search_fields = (['face_id__firstname', 'face_id__lastname'])
    def has_add_permission(self, request, obj=None):
        if request.user.groups.filter(name='admin').exists():
            return True
        else:
            return False


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