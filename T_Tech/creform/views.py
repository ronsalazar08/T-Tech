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


class CreformView(TemplateView):
    template_name = "creform/creform.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context.update({
            'title' : 'CREFORM',
            'lista' : permitted_apps(self.request.user),
        })
        return context


class SaleListView(ListView):
    model = sale
    template_name = 'creform/sale_list.html'  # Default: <app_label>/<model_name>_list.html
    context_object_name = 'sales'  # Default: object_list
    paginate_by = 6

    def get_context_data(self, **kwargs):
        context = super(SaleListView, self).get_context_data(**kwargs)
        context.update({
            'title' : 'CREFORM',
            'lista' : permitted_apps(self.request.user),
            'rfpgs' : rfpg.objects.all(),
        })
        return context


class SaleUpdateView(SuccessMessageMixin, UpdateView):
    model = sale
    template_name = 'creform/sale_edit.html'
    context_object_name = 'sales'
    success_message = 'Updating CREFORM <strong>%(name)s</strong> Sales Successfull!'
    fields = ('name', 'amount')
    
    def get_context_data(self, **kwargs):
        context = super(SaleUpdateView, self).get_context_data(**kwargs)
        context.update({
            'title' : 'CREFORM',
            'lista' : permitted_apps(self.request.user),
        })
        return context

    def get_success_url(self):
        return reverse_lazy('creform_sales')
        # return reverse_lazy('book-detail', kwargs={'pk': self.object.id})
