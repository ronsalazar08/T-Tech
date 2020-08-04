from django.contrib import admin
from .models import *


class ttech(admin.ModelAdmin):
    list_display = ('__str__', 'probationary', 'regular', 'male',
                    'female', 'married', 'single', 'g1', 'g2', 'g3', 'g4')
    ordering = ['id']


class thc(admin.ModelAdmin):
    list_display = ('__str__', 'probationary', 'regular', 'male',
                    'female', 'married', 'single', 'g1', 'g2', 'g3', 'g4')
    ordering = ['id']


class ytmi(admin.ModelAdmin):
    list_display = ('__str__', 'reg_a', 'khmpc_a', 'reg_b',
                    'khmpc_b', 'reg_rt', 'khmpc_rt')
    ordering = ['id']


class asof(admin.ModelAdmin):
    list_display = ('__str__', 'date_modified')
    ordering = ['id']


admin.site.register(TTECH, ttech)
admin.site.register(THC, thc)
admin.site.register(YTMI, ytmi)
admin.site.register(AS_OF, asof)
