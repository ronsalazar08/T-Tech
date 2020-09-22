from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .models import *
from django.utils import timezone
import datetime

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