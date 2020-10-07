from django.apps import apps
from django.utils import timezone
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


class OfficeView(TemplateView):
    template_name = "office/office.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context.update({
            'title' : 'OFFICE',
            'lista' : permitted_apps(self.request.user),
        })
        return context


class OfficeEmployeeListView(ListView):
    model = employee
    template_name = 'office/office_list.html'  # Default: <app_label>/<model_name>_list.html
    context_object_name = 'employees'  # Default: object_list
    paginate_by = 5
    queryset = employee.objects.all().order_by('no')  # Default: Model.objects.all()

    def get_context_data(self, **kwargs):
        context = super(OfficeEmployeeListView, self).get_context_data(**kwargs)
        context.update({
            'title' : 'OFFICE',
            'lista' : permitted_apps(self.request.user),
        })
        return context


class OfficeEmployeeUpdateView(SuccessMessageMixin, UpdateView):
    model = employee
    template_name = 'office/office_employee.html'
    context_object_name = 'employee'
    success_message = '<strong>%(firstname)s\'s</strong> Profile is now Updated!'
    fields = ('firstname', 'middlename', 'lastname', 'position', 'birthday', 'name_sound', 'picture', 'status')
    
    def get_context_data(self, **kwargs):
        context = super(OfficeEmployeeUpdateView, self).get_context_data(**kwargs)
        context.update({
            'title' : 'OFFICE',
            'lista' : permitted_apps(self.request.user),
        })
        return context

    def get_success_url(self):
        return reverse_lazy('office_list')
        # return reverse_lazy('book-detail', kwargs={'pk': self.object.id})


class MonthListView(ListView):
    month = timezone.now().strftime("%B").lower()
    model = apps.get_model('office', month)
    template_name = "office/month.html"
    paginate_by = 5
    m31 = ['january', 'march', 'may', 'july', 'august', 'october', 'december']
    m30 = ['april', 'june', 'september', 'november']
    m29 = ['february']
    context_object_name = 'monsq'  # Default: object_list
    queryset = employee.objects.raw(f"""select 1 as id, no,
                                    concat(lastname, ', ', firstname, LEFT(middlename, 1)) as name,
                                    office_{month}.* FROM office_employee inner join office_{month} 
                                    on office_employee.id = office_{month}.rfid_id ORDER BY no;""")
    if month in m31:
        count = 31
    elif month in m30:
        count = 30
    elif month in m29:
        count = 29
    

    def get_context_data(self, **kwargs):
        context = super(MonthListView, self).get_context_data(**kwargs)
        context.update({
            'title' : 'OFFICE',
            'lista' : permitted_apps(self.request.user),
            'count': range(self.count),
            'cnt': self.count,
        })
        return context
