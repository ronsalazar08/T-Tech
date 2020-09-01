from django import template

register = template.Library()


@register.filter
def index_day(sequence, position):
    return sequence[position][0] if sequence[position][0] != 0 or sequence[position][0] != 0.0 else None
