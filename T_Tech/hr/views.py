from django.apps import apps
from django.urls import reverse_lazy
from django.shortcuts import render, redirect
from django.contrib.auth.models import Permission
from django.contrib.auth.decorators import login_required
from django.contrib.messages.views import SuccessMessageMixin
from django.views.generic import TemplateView, ListView, UpdateView

from .models import *


def permitted_apps(usera):
    """
    Returning list of allowed apps for current user
    """
    if str(usera) == 'admin':
        permissions = Permission.objects.all()
    else:
        permissions = Permission.objects.filter(user=usera)
    lista = list(set([((str(p).split())[0]).upper() for p in permissions]))
    lista.sort()
    return lista


class HrView(TemplateView):
    template_name = "hr/hr.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context.update({
            'title' : 'HR',
            'lista' : permitted_apps(self.request.user),
        })
        return context


class ThcListView(ListView):
    model = THC
    template_name = "hr/thc_list.html"
    context_object_name = 'thc'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context.update({
            'title' : 'HR',
            'lista' : permitted_apps(self.request.user),
        })
        return context


class TtechListView(ListView):
    model = TTECH
    template_name = "hr/ttech_list.html"
    context_object_name = 'ttech'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context.update({
            'title' : 'HR',
            'lista' : permitted_apps(self.request.user),
        })
        return context


class YtmiListView(ListView):
    model = TTECH
    template_name = "hr/ytmi_list.html"
    context_object_name = 'ytmi'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context.update({
            'title' : 'HR',
            'lista' : permitted_apps(self.request.user),
        })
        return context

