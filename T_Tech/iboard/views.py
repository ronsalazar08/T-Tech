from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.views.decorators.csrf import csrf_exempt
from django.apps import apps
from datetime import datetime
from django.db.models import Q
import json
from office.models import *
import fabrication.models
import creform.models
import rbf.models
from hr.models import *
# from crimping_dies.models import *


def Homepage(request):
    m31 = ['january', 'march', 'may', 'july', 'august', 'october', 'december']
    m30 = ['april', 'june', 'september', 'november']
    m29 = ['february']
    mon = datetime.now().strftime("%B").lower()
    hour = datetime.now().strftime("%H")
    monsq = employee.objects.raw(f"""select 1 as id, no,
                                    concat(firstname, ' ', lastname) as name,
                                    office_{mon}.* FROM office_employee inner join office_{mon} 
                                    on office_employee.id = office_{mon}.rfid_id ORDER BY no;""")
    if mon in m31:
        count = 31
    elif mon in m30:
        count = 30
    elif mon in m29:
        count = 29
    emp = employee.objects.all().order_by('no')
    context = {
        'emps': emp,
        'counta': emp.count(),
        'mons': monsq,
        'month': mon.upper(),
        'count': range(count),
        'cnt': count,
        'hour': int(hour)
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
            sevenam = datetime.strptime("07:00:00",  '%H:%M:%S')
            elevenam = datetime.strptime("11:00:00",  '%H:%M:%S')
            sixpm = datetime.strptime("18:00:00",  '%H:%M:%S')
            if datetime.now().time() < elevenam.time():
                # employee.objects.filter(rfid=rfid).update(status='P') # update status of employee
                emp.status = 'P'
                emp.save()
            
            # if datetime.now().time() < sevenam.time():
            #     # employee.objects.filter(rfid=rfid).update(status='P') # update status of employee
            #     emp.status = 'P'
            #     emp.save()
            # elif datetime.now().time() > sevenam.time():
            #     # employee.objects.filter(rfid=rfid).update(status='L') # update status of employee
            #     emp.status = 'L'
            #     emp.save()
            
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
        oras = datetime.now().strftime("%H:%M:%S")
        emp = employee.objects.exclude(status=None)
        if oras > "16:00:00" and oras < "16:30:00" and emp.count() > 0:
            mon = datetime.now().strftime("%B").lower()
            model = apps.get_model('office', mon)
            field_name = 'd' + str(datetime.now().day)
            field_name_icontains = field_name + '__icontains'
            s = 'A'
            model.objects.filter(**{field_name: ''}).update(**{field_name: s})
            model.objects.filter(**{field_name: None}).update(**{field_name: s})
            employee.objects.all().update(status=None)
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
    m = datetime.now().strftime("%m")
    empi = employee.objects.filter(
        birthday__contains=f'-{m}-').order_by('birthday')
    emp = employee.objects.raw(
        f"select * from office_employee where birthday LIKE '%%-{m}-%%' order by IF(MONTH(birthday) < MONTH(NOW()), MONTH(birthday) + 12, MONTH(birthday)),  DAY(birthday)")

    context = {
        'empb': emp,
        'empbc': empi.count() * 670,
        'count': empi.count() * 10,
    }

    return render(request, 'iboard/bday.html', context)


def sales_graph(request):
    fabrication_sales = fabrication.models.sale.objects.all()
    fabrication_rfpgs = fabrication.models.rfpg.objects.all()

    creform_sales = creform.models.sale.objects.all()
    creform_rfpgs = creform.models.rfpg.objects.all()

    rbf_sales = rbf.models.sale.objects.all()
    rbf_rfpgs = rbf.models.rfpg.objects.all()
    context = {
        'fabrication_sales': fabrication_sales,
        'fabrication_rfpgs': fabrication_rfpgs,
        'creform_sales': creform_sales,
        'creform_rfpgs': creform_rfpgs,
        'rbf_sales': rbf_sales,
        'rbf_rfpgs': rbf_rfpgs,
    }
    return render(request, 'iboard/sales_graph.html', context)


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


def hr_manpower(request):
    ttech = TTECH.objects.all()
    thc = THC.objects.all()
    ytmi = YTMI.objects.all()
    date_modified = AS_OF.objects.first()
    context = {
        'ttechs': ttech,
        'thcs': thc,
        'ytmis': ytmi,
        'asofs': date_modified,
    }
    return render(request, 'iboard/hr_manpower.html', context)
