from django.contrib import admin
from .models import *


@admin.register(sale)
class sales(admin.ModelAdmin):
    list_display = ('__str__', 'amount')
    ordering = ['id']

@admin.register(rfpg)
class rfpgs(admin.ModelAdmin):
    list_display = ('__str__', 'ISSUED', 'CLOSED',
                    'CLOSED_WITH_IN_TARGET_DATE')
    ordering = ['id']
