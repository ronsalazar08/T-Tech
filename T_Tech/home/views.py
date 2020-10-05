from django.contrib.auth import logout
from django.shortcuts import render, redirect
from django.contrib.auth.models import Permission
from django.contrib.auth.decorators import login_required
from django.utils import timezone
from django.views.generic import TemplateView, ListView, UpdateView
from django.contrib.messages.views import SuccessMessageMixin
from django.urls import reverse_lazy
from office.models import employee as office_employee
from contractor.models import employee as contractor_employee
from hr.models import *
import fabrication.models as fabrication
import creform.models as creform
import rbf.models as rbf


def permitted_apps(usera):
    if str(usera) == 'admin':
        permissions = Permission.objects.all()
    else:
        permissions = Permission.objects.filter(user=usera)
    lista = list(set([((str(p).split())[0]).upper() for p in permissions]))
    lista.sort()
    return lista


def Logout(request):
    logout(request)
    return redirect('login')

@login_required
def home(request):
    """
    DASHBOARD PAGE
    """
    #Current Page title
    title = 'DASHBOARD'

    #Apps permitted to current user
    if str(request.user) == 'admin':
        permissions = Permission.objects.all()
    else:
        permissions = Permission.objects.filter(user=request.user)
    lista = list(set([((str(p).split())[0]).upper() for p in permissions]))
    lista.sort()

    #present employees on office
    emp = office_employee.objects.all()
    emps = {'total': emp.count(),
            'present': emp.filter(status='P'),
            'percentage': "{:.2f}".format((emp.filter(status='P').count() / emp.count()) * 100),}

    #employee count with birthday this month
    m = timezone.now().strftime("%m")
    birthday_list = emp.filter(birthday__contains=f'-{m}-').order_by('firstname')

    #contractor data
    con_emp = contractor_employee.objects.all()
    blairwin = con_emp.filter(company='BLAIRWIN')
    ngb = con_emp.filter(company='NGB')
    blairwin_percentage = 0
    ngb_percentage = 0
    if len(blairwin) > 0:
        blairwin_percentage = (blairwin.filter(status='P').count() / blairwin.count()) * 100
    if len(ngb) > 0:
        ngb_percentage = (ngb.filter(status='P').count() / ngb.count()) * 100
    
    #Fabrication Sales & Rfpgs data
    fab_sales = fabrication.sale.objects.all()
    fab_rfpg = fabrication.rfpg.objects.all()

    #Creform Sales & Rfpgs data
    cre_sales = creform.sale.objects.all()
    cre_rfpg = creform.rfpg.objects.all()

    #rbf Sales & Rfpgs data
    rbf_sales = rbf.sale.objects.all()
    rbf_rfpg = rbf.rfpg.objects.all()

    #HR manpower data
    thc_data = THC.objects.all()
    ttech_data = TTECH.objects.all()
    ytmi_data = YTMI.objects.all()
    date_as_of = AS_OF.objects.first()
    thc_total = 0
    ttech_total = 0
    ytmi_total = 0
    for i in thc_data:
        thc_total += i.probationary + i.regular
    for i in ttech_data:
        ttech_total += i.probationary + i.regular
    for i in ytmi_data:
        ytmi_total += i.reg_a + i.khmpc_a + i.reg_b + i.khmpc_b + i.reg_rt + i.khmpc_rt

    dictlist = {'creform': [cre_sales, cre_rfpg], 'fabrication': [fab_sales, fab_rfpg], 'rbf': [rbf_sales, rbf_rfpg], }
    dictcolor = {'creform': 'warning', 'fabrication': 'primary', 'rbf': 'info'}
    dicticon = {'creform': 'build', 'fabrication': 'construction', 'rbf': 'settings'}
    sales_rfpgs_graph = {'creform': '', 'fabrication': '', 'rbf': ''}
    for app in sales_rfpgs_graph:
        sales_rfpgs_graph[app] = {'sales': dictlist[app][0],
                         'target': (dictlist[app][0])[12].amount,
                         'current': (dictlist[app][0])[int(m)-1].amount,
                         'rfpgs': dictlist[app][1],
                         'color': dictcolor[app],
                         'icon': dicticon[app]
                        }

    context = {
        'title' : title,
        'lista' : permitted_apps(request.user),
        'emps'  : emps,
        'bday_list' : birthday_list,
        'contractor': {'blairwin': "{:.2f}".format(blairwin_percentage),
                       'ngb': "{:.2f}".format(ngb_percentage),
                      },
        'date_today': timezone.now(),
        'graph' : sales_rfpgs_graph,
        'hr'    : {'data':[thc_total, ttech_total, ytmi_total],
                   'date': date_as_of.date_modified.strftime("%b %d, %Y"),
                   'total': thc_total + ttech_total + ytmi_total },

    }
    return render(request, 'home/dashboard.html', context)


class OfficeView(TemplateView):
    template_name = "home/office.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context.update({
            'title' : 'OFFICE',
            'lista' : permitted_apps(self.request.user),
        })
        return context


class OfficeEmployeeListView(ListView):
    model = office_employee
    template_name = 'home/office_list.html'  # Default: <app_label>/<model_name>_list.html
    context_object_name = 'employees'  # Default: object_list
    paginate_by = 5
    queryset = office_employee.objects.all().order_by('no')  # Default: Model.objects.all()

    def get_context_data(self, **kwargs):
        context = super(OfficeEmployeeListView, self).get_context_data(**kwargs)
        context.update({
            'title' : 'OFFICE',
            'lista' : permitted_apps(self.request.user),
        })
        return context

class OfficeEmployeeUpdateView(SuccessMessageMixin, UpdateView):
    model = office_employee
    template_name = 'home/office_employee.html'
    context_object_name = 'employee'
    success_message = '<strong>%(firstname)s</strong> Profile is now Updated!'
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