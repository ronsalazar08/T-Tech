from django import template

register = template.Library()


@register.filter
def removeSpecial(value):
    val = ""
    for character in value:
        if character.isalnum():
            val += character
    return val
