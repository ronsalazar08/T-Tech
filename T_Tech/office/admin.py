from django.contrib import admin
from .models import *



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
    # change_form_template = 'admin/cfmc/employee_change_form.html'

    def set_P(modeladmin, request, queryset):
        queryset.update(status='P') 

    def set_L(modeladmin, request, queryset):
        queryset.update(status='L')
        
    def set_A(modeladmin, request, queryset):
        queryset.update(status='A')

    def set_Blank(modeladmin, request, queryset):
        queryset.update(status=None)

    # set_P.short_description = "Set STATUS to `P`"
    # set_L.short_description = "Set STATUS to `L`"
    # set_A.short_description = "Set STATUS to `A`"
    set_Blank.short_description = "Set STATUS to `-`"
    
    # actions = [ set_P, set_L, set_A, set_Blank ]
    actions = [ set_Blank ]



class d31(admin.ModelAdmin):
    list_display = ('__str__', 'd1','d2','d3','d4','d5','d6','d7','d8','d9','d10',
                    'd11','d12','d13','d14','d15','d16','d17','d18','d19','d20',
                    'd21','d22','d23','d24','d25','d26','d27','d28','d29','d30','d31',
    )
    #actions = None
    ordering = (['rfid'])
    search_fields = (['rfid__firstname', 'rfid__lastname'])
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
    ordering = (['rfid'])
    search_fields = (['rfid__firstname', 'rfid__lastname'])
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
    ordering = (['rfid'])
    search_fields = (['rfid__firstname', 'rfid__lastname'])
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