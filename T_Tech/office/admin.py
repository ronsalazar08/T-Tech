from django.contrib import admin
from django.contrib.auth.models import Group, User
from .models import *
from django.http import HttpResponse
from django.urls import path

# admin.site.unregister(User)
# admin.site.unregister(Group)


def set_P(modeladmin, request, queryset):
    queryset.update(status='P') 

def set_L(modeladmin, request, queryset):
    queryset.update(status='L')
    
def set_A(modeladmin, request, queryset):
    queryset.update(status='A')

def set_Blank(modeladmin, request, queryset):
    queryset.update(status=None)

set_P.short_description = "Set STATUS to `P`"
set_L.short_description = "Set STATUS to `L`"
set_A.short_description = "Set STATUS to `A`"
set_Blank.short_description = "Set STATUS to `-`"

@admin.register(employee)
class emp(admin.ModelAdmin):
    def get_form(self, request, obj=None, **kwargs):
        self.fields = []
        if request.user.is_superuser:
            self.fields.append('thumbnail')
            self.fields.append('picture')
            self.fields.append('rfid')
            self.fields.append('no')
            self.fields.append('firstname')
            self.fields.append('middlename')
            self.fields.append('lastname')
            self.fields.append('position')
            self.fields.append('birthday')
            self.fields.append('name_sound')
            self.fields.append('status')
        else:
            self.fields.append('thumbnail')
            self.fields.append('picture')
            self.fields.append('firstname')
            self.fields.append('middlename')
            self.fields.append('lastname')
            self.fields.append('position')
            self.fields.append('birthday')
            self.fields.append('name_sound')
            self.fields.append('status')

        return super(emp, self).get_form(request, obj, **kwargs)

    readonly_fields = ['thumbnail']
    list_display = ['__str__', 'position', 'birthday', 'status']
    search_fields = ['firstname', 'lastname']
    ordering = (['no'])
    actions = [ set_P, set_L, set_A, set_Blank ]
    # change_form_template = 'admin/cfmc/employee_change_form.html'
