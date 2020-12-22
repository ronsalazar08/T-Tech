from django.apps import apps
from django.db.models import Q
from django.contrib import messages
from django.urls import reverse_lazy
from django.shortcuts import render, redirect
from django.shortcuts import get_object_or_404
from django.contrib.auth.models import Permission
from django.contrib.auth.decorators import login_required
from django.contrib.messages.views import SuccessMessageMixin
from django.views.generic import TemplateView, ListView, UpdateView, CreateView, DeleteView

from .models import *
from django.utils import timezone
import datetime


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


#============================================================ DASH PAGE


class ContractorView(TemplateView):
    template_name = "contractor/contractor.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context.update({
            'title' : 'CONTRACTOR',
            'lista' : permitted_apps(self.request.user),
        })
        return context


class ContractorEmployeeListView(ListView):
    model = employee
    template_name = 'contractor/contractor_list.html'  # Default: <app_label>/<model_name>_list.html
    context_object_name = 'employees'  # Default: object_list
    paginate_by = 5
    # queryset = employee.objects.all().filter(company='BLAIRWIN')  # Default: Model.objects.all()

    def get_context_data(self, **kwargs):
        context = super(ContractorEmployeeListView, self).get_context_data(**kwargs)
        context.update({
            'title' : 'CONTRACTOR',
            'lista' : permitted_apps(self.request.user),
        })
        return context
    def get_queryset(self, **kwargs):
        company_name = self.request.user
        if str(company_name) == 'admin':
            queryset = employee.objects.all().order_by('lastname')
        else:
            queryset = employee.objects.all().filter(company=str(company_name).upper()).order_by('lastname')
        return queryset


class ContractorEmployeeCreateView(SuccessMessageMixin, CreateView):
    model = employee
    template_name = 'contractor/contractor_add.html'
    context_object_name = 'employee'
    success_message = '<strong>%(firstname)s\'s</strong> Profile Successfully Created!'
    fields = ('id_number', 'firstname', 'middlename', 'lastname', 'position', 'company', 'shift', 'picture', 'status')
    
    def get_context_data(self, **kwargs):
        context = super(ContractorEmployeeCreateView, self).get_context_data(**kwargs)
        context.update({
            'title' : 'CONTRACTOR',
            'lista' : permitted_apps(self.request.user),
        })
        return context

    def get_success_url(self):
        return reverse_lazy('contractor_list')
        # return reverse_lazy('book-detail', kwargs={'pk': self.object.id})


class ContractorEmployeeUpdateView(SuccessMessageMixin, UpdateView):
    model = employee
    template_name = 'contractor/contractor_employee.html'
    context_object_name = 'employee'
    success_message = '<strong>%(firstname)s\'s</strong> Profile is now Updated!'
    fields = ('id_number', 'firstname', 'middlename', 'lastname', 'position', 'company', 'shift', 'picture', 'status')


    def get_context_data(self, **kwargs):
        context = super(ContractorEmployeeUpdateView, self).get_context_data(**kwargs)
        context.update({
            'title' : 'CONTRACTOR',
            'lista' : permitted_apps(self.request.user),
        })
        return context

    def get_success_url(self):
        return reverse_lazy('contractor_list')
        # return reverse_lazy('book-detail', kwargs={'pk': self.object.id})


class ContractorEmployeeDeleteView(DeleteView):
    model = employee
    template_name = 'contractor/contractor_delete.html'
    context_object_name = 'employee'
    success_message = '<strong>Employee</strong> Profile is now Deleted!'

    def get_context_data(self, **kwargs):
        context = super(ContractorEmployeeDeleteView, self).get_context_data(**kwargs)
        context.update({
            'title' : 'CONTRACTOR',
            'lista' : permitted_apps(self.request.user),
        })
        return context
    
    def get_success_url(self):
        return reverse_lazy('contractor_list')

    def delete(self, request, *args, **kwargs):
        messages.success(self.request, self.success_message)
        return super(ContractorEmployeeDeleteView, self).delete(request, *args, **kwargs)


class ContractorLogboxListView(ListView):
    model = logbox
    template_name = 'contractor/contractor_logbox.html'  # Default: <app_label>/<model_name>_list.html
    context_object_name = 'logbox'  # Default: object_list
    paginate_by = 5
    # queryset = logbox.objects.all().order_by("-date_time")# Default: Model.objects.all()

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context.update({
            'title' : 'CONTRACTOR',
            'lista' : permitted_apps(self.request.user),
        })
        return context

    def get_queryset(self):
        search = self.request.GET.get('search')
        object_list = self.model.objects.all().order_by("-date_time")
        if search:
            object_list = object_list.filter(Q(employee__lastname__contains=search.upper()) | Q(employee__firstname__contains=search.upper()) | Q(date_time__contains=search)).order_by("-date_time")
            messages.success(self.request, f'Displaying "{search.upper()}"')
            if len(object_list) == 0:
                object_list = self.model.objects.all().order_by("-date_time")
                messages.success(self.request, f'Cannot find "{search.upper()}"')
        
        return object_list

#=====================================================================ADMIN PAGE


@login_required(login_url='/admin') 
def record_per_employee(request, tid):
    emp = employee.objects.get(id=tid)
    recordDS = logbox.objects.raw(
        f'''
        SELECT
            DISTINCT DATE(date_time) as petsa, 1 as id,
            TIME_FORMAT((SELECT TIME(date_time) FROM contractor_logbox WHERE face_id = '{emp.face_id}' AND transaction = 'I' AND DATE(date_time) = petsa AND shift = 'DS'), '%%h:%%i %%p') AS timeIn,
            TIME_FORMAT((SELECT TIME(date_time) FROM contractor_logbox WHERE face_id = '{emp.face_id}' AND transaction = 'O' AND DATE(date_time) = petsa AND shift = 'DS'), '%%h:%%i %%p') AS timeOut,            
            shift
        FROM contractor_logbox AS SOD WHERE face_id = '{emp.face_id}' AND shift = 'DS' ORDER BY petsa;
        '''
    )
    recordNS = logbox.objects.raw(
        f'''
        SELECT
            DISTINCT DATE(date_time) as petsa, 1 as id,
            TIME_FORMAT((SELECT TIME(date_time) FROM contractor_logbox WHERE face_id = '{emp.face_id}' AND transaction = 'I' AND DATE(date_time) = petsa AND shift = 'NS'), '%%h:%%i %%p') AS timeIn,       
            TIME_FORMAT((SELECT TIME(date_time) FROM contractor_logbox WHERE face_id = '{emp.face_id}' AND transaction = 'O' AND DATE(date_time) = petsa  + INTERVAL 1 DAY AND shift = 'NS'), '%%h:%%i %%p') AS timeOut,
            shift
        FROM contractor_logbox AS SOD WHERE face_id = '{emp.face_id}' AND shift = 'NS' ORDER BY petsa;
        '''
    )
    context = {
        'emp': emp,
        'recordDS': recordDS,
        'recordNS': recordNS,
        
    }
    return render(request, 'contractor/record.html', context)

@login_required
def CurrentWeek(request):
    current_user = str(request.user).upper()
    query, petsa, final_listahan = week_record(-1, current_user, 'DS')
    context = {
        'query': query,
        'ts': petsa,
        'final_listahan' : final_listahan,
        'shift': 'DAY SHIFT'
    }
    return render(request, 'contractor/week.html', context)

@login_required
def CurrentWeekNS(request):
    current_user = str(request.user).upper()
    query, petsa, final_listahan = week_record(-1, current_user, 'NS')
    context = {
        'query': query,
        'ts': petsa,
        'final_listahan' : final_listahan,
        'shift': 'NIGHT SHIFT'
    }
    return render(request, 'contractor/week.html', context)


@login_required
def LastWeek(request):
    current_user = str(request.user).upper()
    query, petsa, final_listahan = week_record(-8, current_user, 'DS')
    context = {
        'query': query,
        'ts': petsa,
        'final_listahan' : final_listahan,
        'shift': 'DAY SHIFT'
    }
    return render(request, 'contractor/week.html', context)




@login_required
def LastWeekNS(request):
    current_user = str(request.user).upper()
    query, petsa, final_listahan = week_record(-8, current_user, 'NS')
    context = {
        'query': query,
        'ts': petsa,
        'final_listahan' : final_listahan,
        'shift': 'NIGHT SHIFT'
    }
    return render(request, 'contractor/week.html', context)


@login_required
def computation_template_regular(request):
    current_user = str(request.user).upper()
    t = timezone.now().weekday()
    ts = timezone.now() + timezone.timedelta(days=-t)
    ts = ts + timezone.timedelta(days=-8)

    petsa = {}
    for c in range(14):
        pet = ts + timezone.timedelta(days=c)
        petsa[c] = pet.date()

    query = employee.objects.filter(company=current_user).filter(position='R').order_by('lastname')
    context = {
        'query' : query,
        'ts'    : petsa,
    }
    return render(request, 'contractor/computation_template.html', context)


@login_required
def computation_template_non_regular(request):
    current_user = str(request.user).upper()
    t = timezone.now().weekday()
    ts = timezone.now() + timezone.timedelta(days=-t)
    ts = ts + timezone.timedelta(days=-8)

    petsa = {}
    for c in range(14):
        pet = ts + timezone.timedelta(days=c)
        petsa[c] = pet.date()

    query = employee.objects.filter(company=current_user).filter(position='NR').order_by('lastname')
    context = {
        'query' : query,
        'ts'    : petsa,
    }
    return render(request, 'contractor/computation_template.html', context)








#==============================================================OTHER FUNCTIONS

def ceil_dt(dt):
    '''Round down timestamp by 30 minutes'''
    dt = dt.replace(second=0, microsecond=0)
    return dt + (datetime.datetime.min - dt) % datetime.timedelta(minutes=30)


def floor_dt(dt):
    '''Round up timestamp by 30 minutes'''
    return dt - (dt - datetime.datetime.min) % datetime.timedelta(minutes=30)


def ot_and_day(timeIn, timeOut, shift):
    '''Calculate day and overtime base on time in and time out of the week'''
    if shift == 'DS':
        seven_am = timeIn.replace(hour=7, minute=0, second=0, microsecond=0)
        four_pm = timeOut.replace(hour=16, minute=0, second=0, microsecond=0)
        eleven_am = timeOut.replace(hour=11, minute=0, second=0, microsecond=0)
        rounded_timeIn = ceil_dt(timeIn)
        rounded_timeOut = floor_dt(timeOut)

        if rounded_timeIn <= seven_am:
            rounded_timeIn = seven_am

        if rounded_timeOut >= four_pm:
            difference = four_pm - rounded_timeIn
            day_seconds = difference.total_seconds()
            day_hours = int(day_seconds // 3600)
            day_minutes = int((day_seconds % 3600) // 60)
            if day_minutes >= 30:
                day_minutes = 5
            else:
                day_minutes = 0
            hour_per_day = round((float(f'{day_hours}.{day_minutes}') - 1)/8, 2)
            ot = rounded_timeOut - four_pm
            ot_seconds = ot.total_seconds()
            ot_hours = int(ot_seconds // 3600)
            ot_minutes = int((ot_seconds % 3600) // 60)
            if ot_minutes >= 30:
                ot_minutes = 5
            else:
                ot_minutes = 0
            ot_per_day = round(float(f'{ot_hours}.{ot_minutes}'), 2)
            if ot_per_day > 3.5:
                ot_per_day = 3.5
        else:
            difference = rounded_timeOut - rounded_timeIn
            day_seconds = difference.total_seconds()
            day_hours = int(day_seconds // 3600)
            day_minutes = int((day_seconds % 3600) // 60)
            if day_minutes >= 30:
                day_minutes = 5
            else:
                day_minutes = 0
            hour_per_day = round((float(f'{day_hours}.{day_minutes}') - 1)/8, 2)
            ot_per_day = 0
    else:
        seven_pm = timeIn.replace(hour=19, minute=0, second=0, microsecond=0)
        four_am = timeOut.replace(hour=4, minute=0, second=0, microsecond=0)
        eleven_pm = timeOut.replace(hour=23, minute=0, second=0, microsecond=0)
        rounded_timeIn = ceil_dt(timeIn)
        rounded_timeOut = floor_dt(timeOut)

        if rounded_timeIn <= seven_pm:
            rounded_timeIn = seven_pm

        if rounded_timeOut >= four_am:
            difference = four_am - rounded_timeIn
            day_seconds = difference.total_seconds()
            day_hours = int(day_seconds // 3600)
            day_minutes = int((day_seconds % 3600) // 60)
            if day_minutes >= 30:
                day_minutes = 5
            else:
                day_minutes = 0
            hour_per_day = round((float(f'{day_hours}.{day_minutes}') - 1)/8, 2)
            ot = rounded_timeOut - four_am
            ot_seconds = ot.total_seconds()
            ot_hours = int(ot_seconds // 3600)
            ot_minutes = int((ot_seconds % 3600) // 60)
            if ot_minutes >= 30:
                ot_minutes = 5
            else:
                ot_minutes = 0
            ot_per_day = round(float(f'{ot_hours}.{ot_minutes}'), 2)
            if ot_per_day > 3.5:
                ot_per_day = 3.5
        else:
            difference = rounded_timeOut - rounded_timeIn
            day_seconds = difference.total_seconds()
            day_hours = int(day_seconds // 3600)
            day_minutes = int((day_seconds % 3600) // 60)
            if day_minutes >= 30:
                day_minutes = 5
            else:
                day_minutes = 0
            hour_per_day = round((float(f'{day_hours}.{day_minutes}') - 1)/8, 2)
            ot_per_day = 0
            
    return [hour_per_day, ot_per_day]


def week_record(start_day, current_user, shift):
    '''Table of transactions of Employee's per Week'''
    t = timezone.now().weekday()
    ts = timezone.now() + timezone.timedelta(days=-t)
    ts = ts + timezone.timedelta(days=start_day)

    petsa = {}
    query_str = ''
    for c in range(7):
        pet = ts + timezone.timedelta(days=c)
        petsa[c] = pet.date()
        if shift == 'DS':
            time_in = pet.date()
            time_out = pet.date()
        else:
            time_in = pet.date()
            time_out = (ts + timezone.timedelta(days=c+1)).date()
        query_str += (f"(SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = '{time_in}' AND transaction = 'I' AND face_id = olo.face_id AND shift ='{shift}') AS ti{c+1},\n" 
                      f"(SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = '{time_out}' AND transaction = 'O' AND face_id = olo.face_id AND shift ='{shift}') AS to{c+1},\n")

    query = employee.objects.raw(
        f'''SELECT DISTINCT face_id as id, {query_str}
        (SELECT CONCAT(lastname, ', ', firstname, ' ', LEFT(middlename , 10)) AS name FROM contractor_employee WHERE contractor_employee.face_id = olo.face_id) AS name
        FROM contractor_logbox AS olo WHERE olo.face_id in (SELECT face_id FROM contractor_employee WHERE company = '{current_user}') ORDER BY name;'''
    )
    
    final_listahan = []
    for q in query:
        listahan = [(q.ti1, q.to1), (q.ti2, q.to2), (q.ti3, q.to3), (q.ti4, q.to4), (q.ti5, q.to5), (q.ti6, q.to6), (q.ti7, q.to7)]
        holder_listahan = []
        day_holder = 0
        ot_holder = 0
        for ti, to in listahan:
            if ti != None and to != None:
                day, ot = ot_and_day(ti, to, shift)
                holder_listahan.append((day, ot))
            else:
                day, ot = 0, 0
                holder_listahan.append((day, ot))
        day_holder = sum([i[0] for i in holder_listahan])
        ot_holder = sum([i[1] for i in holder_listahan])
        final_listahan.append([day_holder, ot_holder])

    return query, petsa, final_listahan


