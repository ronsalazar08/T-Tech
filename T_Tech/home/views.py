from django.contrib.auth import logout
from django.shortcuts import render, redirect
from django.contrib.auth.models import Permission
from django.contrib.auth.decorators import login_required
from django.utils import timezone
from office.models import employee as office_employee
from contractor.models import employee as contractor_employee

def Logout(request):
    logout(request)
    return redirect('login')

@login_required
def home(request):
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
    if len(blairwin) > 0:
        blairwin_percentage = (blairwin.filter(status='P').count() / blairwin.count()) * 100
    else:
        blairwin_percentage = 0
    ngb = con_emp.filter(company='NGB')
    if len(ngb) > 0:
        ngb_percentage = (ngb.filter(status='P').count() / ngb.count()) * 100
    else:
        ngb_percentage = 0
    context = {
        'lista' : lista,
        'emps' : emps,
        'bday_list' : birthday_list,
        'contractor' : {'blairwin': "{:.2f}".format(blairwin_percentage), 'ngb': "{:.2f}".format(ngb_percentage),}
    }
    return render(request, 'home/dashboard.html', context)