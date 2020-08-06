from django import template

register = template.Library()

@register.filter
def subt(value, arg):
    return value - arg