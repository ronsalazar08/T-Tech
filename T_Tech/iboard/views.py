
import json
from django.apps import apps
from datetime import datetime
from django.db.models import Q
from django.utils import timezone
from django.urls import reverse_lazy
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.contrib.auth.models import Permission
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.decorators import login_required
from django.contrib.messages.views import SuccessMessageMixin
from django.views.generic import TemplateView, ListView, UpdateView

import hr.models as hr
import rbf.models as rbf
import office.models as office
import creform.models as creform
import contractor.models as contractor
import fabrication.models as fabrication


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


def Homepage(request):
    m31 = ['january', 'march', 'may', 'july', 'august', 'october', 'december']
    m30 = ['april', 'june', 'september', 'november']
    m29 = ['february']
    mon = timezone.now().strftime("%B").lower()
    monsq = office.employee.objects.raw(f"""select 1 as id, no,
                                    concat(firstname, ' ', lastname) as name,
                                    office_{mon}.* FROM office_employee inner join office_{mon} 
                                    on office_employee.id = office_{mon}.rfid_id ORDER BY no;""")
    if mon in m31:
        count = 31
    elif mon in m30:
        count = 30
    elif mon in m29:
        count = 29
    emp = office.employee.objects.all().order_by('no')
    context = {
        'emps': emp,
        'mons': monsq,
        'count': range(count),
        'cnt': count,
    }
    return render(request, 'iboard/home.html', context)


def Display(request, rfid):
    try:
        emp = employee.objects.get(rfid=rfid)
        urlb = emp.picture.url
        if emp.status == None:
            try:
                urla = emp.name_sound.url
            except:
                urla = ""
            elevenam = datetime.strptime("14:00:00",  '%H:%M:%S')
            if datetime.now().time() < elevenam.time():
                emp.status = 'P'
                emp.save()
        else:
            urla = ""

    except:
        emp = ""
        urla = ""
        urlb = ""

    context = {
        'emp':   emp,
        'urla': urla,
        'urlb': urlb,
    }
    return render(request, 'iboard/display.html', context)


@csrf_exempt  # or comment crsf in setting middleware
def Reload(request):
    if request.method == "POST":
        olo = pagestat.objects.get(id=1)
        oras = timezone.now().strftime("%H:%M:%S")
        emp = office.employee.objects.exclude(status=None)
        if oras > "16:00:00" and oras < "16:30:00" and emp.count() > 0:
            mon = timezone.now().strftime("%B").lower()
            model = apps.get_model('office', mon)
            field_name = 'd' + str(timezone.now().day)
            field_name_icontains = field_name + '__icontains'
            model.objects.filter(**{field_name: ''}).update(**{field_name: 'A'})
            model.objects.filter(**{field_name: None}).update(**{field_name: 'A'})
            office.employee.objects.all().update(status=None)
            contractor.employee.objects.filter(shift='DS').update(status='-')
            olo.stat = 'True'
        if olo.stat == 'True':
            olo.stat = 'False'
            olo.save()
            data = 'reload'
            return HttpResponse(json.dumps(data), content_type="application/json")
        else:
            return HttpResponse('')
    else:
        return HttpResponse('<h1>Server Error (500)</h1>')


def Bday(request):
    m = timezone.now().strftime("%m")
    empi = office.employee.objects.filter(
        birthday__contains=f'-{m}-').order_by('birthday')
    emp = office.employee.objects.raw(
        f"select * from office_employee where birthday LIKE '%%-{m}-%%' order by IF(MONTH(birthday) < MONTH(NOW()), MONTH(birthday) + 12, MONTH(birthday)),  DAY(birthday)")

    context = {
        'empb': emp,
        'empbc': empi.count() * 670,
        'count': empi.count() * 10,
    }

    return render(request, 'iboard/bday.html', context)


def sales_graph(request):
    fabrication_sales = fabrication.sale.objects.all()
    fabrication_rfpgs = fabrication.rfpg.objects.all()

    creform_sales = creform.sale.objects.all()
    creform_rfpgs = creform.rfpg.objects.all()

    rbf_sales = rbf.sale.objects.all()
    rbf_rfpgs = rbf.rfpg.objects.all()
    context = {
        'fabrication_sales': fabrication_sales,
        'fabrication_rfpgs': fabrication_rfpgs,
        'creform_sales': creform_sales,
        'creform_rfpgs': creform_rfpgs,
        'rbf_sales': rbf_sales,
        'rbf_rfpgs': rbf_rfpgs,
    }
    return render(request, 'iboard/sales_graph.html', context)


def hr_manpower(request):
    ttech = hr.TTECH.objects.all()
    thc = hr.THC.objects.all()
    ytmi = hr.YTMI.objects.all()
    date_modified = hr.AS_OF.objects.first()
    context = {
        'ttechs': ttech,
        'thcs': thc,
        'ytmis': ytmi,
        'asofs': date_modified,
    }
    return render(request, 'iboard/hr_manpower.html', context)



@login_required
def dashboard(request):
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
    emp = office.employee.objects.all()
    emps = {'total': emp.count(),
            'present': emp.filter(status='P'),
            'percentage': "{:.2f}".format((emp.filter(status='P').count() / emp.count()) * 100),}

    #employee count with birthday this month
    m = timezone.now().strftime("%m")
    birthday_list = emp.filter(birthday__contains=f'-{m}-').order_by('firstname')

    #contractor data
    con_emp = contractor.employee.objects.all()
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
    thc_data = hr.THC.objects.all()
    ttech_data = hr.TTECH.objects.all()
    ytmi_data = hr.YTMI.objects.all()
    date_as_of = hr.AS_OF.objects.first()
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
        'graph' : sales_rfpgs_graph,
        'hr'    : {'data':[thc_total, ttech_total, ytmi_total],
                   'date': date_as_of.date_modified.strftime("%b %d, %Y"),
                   'total': thc_total + ttech_total + ytmi_total },

    }
    return render(request, 'iboard/dashboard.html', context)
































# =============================================================================scratch
# def dies_status(request):
#     summary = SuperMarket.objects.raw(
#         '''
#         SELECT DISTINCT mfg_div AS MFG_DIV, 1 as id,
#             (SELECT COUNT(status_id) FROM crimping_dies_supermarket WHERE mfg_div = SM.MFG_DIV AND status_id = true) AS in_stock,
#             (SELECT COUNT(status_id) FROM crimping_dies_supermarket WHERE mfg_div = SM.MFG_DIV AND status_id = false) AS un_stock,
#             (SELECT COUNT(status_id) FROM crimping_dies_supermarket WHERE mfg_div = SM.MFG_DIV) as total_stock
#         FROM crimping_dies_supermarket as SM order by MFG_DIV
#         '''
#     )
#     summary_total = SuperMarket.objects.raw(
#         '''
#         SELECT 1 as id,
#             SUM((SELECT COUNT(status_id) FROM crimping_dies_supermarket WHERE status_id = true))  AS in_stock, 
#             SUM((SELECT COUNT(status_id) FROM crimping_dies_supermarket WHERE status_id = false)) AS un_stock,
#             SUM((SELECT COUNT(status_id) FROM crimping_dies_supermarket)) as total_stock
#         '''
#     )
#     context = {
#         'summary': summary,
#         'summary_total': summary_total
#     }
#     return render(request, 'iboard/dies_status.html', context)