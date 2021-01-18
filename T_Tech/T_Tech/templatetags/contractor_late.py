from django import template
import datetime

register = template.Library()


@register.filter
def contractor_late(petsa):
    val = ""
    print (petsa)
    try:
        seven_am = petsa.replace(hour=7, minute=1, second=0, microsecond=0)
        print(seven_am)
        if petsa >= seven_am:
            val='background-color:red; color: white;'
    except Exception as ex:
        print(ex)
    print (val)
    return val
