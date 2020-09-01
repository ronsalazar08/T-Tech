from django import template

register = template.Library()


@register.filter
def index_ot(sequence, position):
    return sequence[position][1] if sequence[position][1] != 0 or sequence[position][1] != 0.0 else None
