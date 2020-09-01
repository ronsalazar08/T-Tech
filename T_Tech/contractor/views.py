from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .models import *
from django.utils import timezone
import datetime

@login_required(login_url='/admin') 
def record_per_employee(request, tid):
    emp = employee.objects.get(id=tid)
    # record = logbox.objects.raw(
    #     f'''
    #     SELECT
    #         DISTINCT DATE(date_time) as petsa, 1 as id,
    #         TIME_FORMAT((SELECT TIME(date_time) FROM contractor_logbox WHERE face_id = '{emp.face_id}' AND transaction = 'I' AND DATE(date_time) = petsa), '%%h:%%i %%p') AS timeIn,
    #         IF(IFNULL((SELECT TIME(date_time) FROM contractor_logbox WHERE face_id = '{emp.face_id}' AND transaction = 'I' AND DATE(date_time) = petsa),1) = 1 AND SOD.shift = 'NS', NULL ,TIME_FORMAT((SELECT TIME(date_time) FROM contractor_logbox WHERE face_id = '{emp.face_id}' AND transaction = 'O' AND DATE(date_time) = petsa  + INTERVAL IF(SOD.shift = 'NS', 1, 0) DAY), '%%h:%%i %%p')) AS timeOut,
    #         shift
    #     FROM contractor_logbox AS SOD WHERE face_id = '{emp.face_id}' ORDER BY petsa;
    #     '''
    # )
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
    t = timezone.now().weekday()
    ts = timezone.now() + timezone.timedelta(days=-t)
    ts = ts + timezone.timedelta(days=-1)

    petsa = []
    petsa1 = []
    for c in range(7):
        pet = ts + timezone.timedelta(days=c)
        petsa.append(str(pet.date()))
        petsa1.append(pet.date())

    dictOfWords = {i: petsa1[i] for i in range(0, len(petsa1))}
    query = employee.objects.raw(
        '''SELECT DISTINCT face_id as id, 
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[0] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS') AS ti1,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[0] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS') AS to1,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[1] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS') AS ti2,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[1] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS') AS to2,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[2] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS') AS ti3,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[2] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS') AS to3,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[3] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS') AS ti4,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[3] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS') AS to4,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[4] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS') AS ti5,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[4] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS') AS to5,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[5] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS') AS ti6,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[5] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS') AS to6,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[6] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS') AS ti7,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[6] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS') AS to7,
        (SELECT CONCAT(lastname, ', ', firstname, ' ', LEFT(middlename , 10)) AS name FROM contractor_employee WHERE contractor_employee.face_id = olo.face_id) AS name
        FROM contractor_logbox AS olo WHERE olo.face_id in (SELECT face_id FROM contractor_employee WHERE company = \'''' + current_user + '''\') ORDER BY name;'''
    )

    def ceil_dt(dt):
        dt = dt.replace(second=0, microsecond=0)
        return dt + (datetime.datetime.min - dt) % datetime.timedelta(minutes=30)

    def floor_dt(dt):
        # dt = dt.replace(second=0, microsecond=0)
        return dt - (dt - datetime.datetime.min) % datetime.timedelta(minutes=30)

    def ot_and_day(timeIn, timeOut):
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
        return [hour_per_day, ot_per_day]
    
    final_listahan = []
    for q in query:
        listahan = [(q.ti1, q.to1), (q.ti2, q.to2), (q.ti3, q.to3), (q.ti4, q.to4), (q.ti5, q.to5), (q.ti6, q.to6), (q.ti7, q.to7)]
        holder_listahan = []
        day_holder = 0
        ot_holder = 0
        for ti, to in listahan:
            if ti != None and to != None:
                day, ot = ot_and_day(ti, to)
                holder_listahan.append((day, ot))
            else:
                day, ot = 0, 0
                holder_listahan.append((day, ot))
        day_holder = sum([i[0] for i in holder_listahan])
        ot_holder = sum([i[1] for i in holder_listahan])
        final_listahan.append([day_holder, ot_holder])

    context = {
        'query': query,
        'final_listahan' : final_listahan,
        'ts': dictOfWords,
        'shift': 'DAY SHIFT'
    }
    return render(request, 'contractor/week.html', context)

@login_required
def CurrentWeekNS(request):
    current_user = str(request.user).upper()
    t = timezone.now().weekday()
    ts = timezone.now() + timezone.timedelta(days=-t)
    ts = ts + timezone.timedelta(days=-1)

    petsa = []
    petsa1 = []
    for c in range(8):
        pet = ts + timezone.timedelta(days=c)
        petsa.append(str(pet.date()))
        petsa1.append(pet.date())

    dictOfWords = {i: petsa1[i] for i in range(0, len(petsa1))}
    query = employee.objects.raw(
        '''SELECT DISTINCT face_id as id, 
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[0] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS') AS ti1,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[1] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS') AS to1,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[1] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS') AS ti2,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[2] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS') AS to2,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[2] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS') AS ti3,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[3] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS') AS to3,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[3] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS') AS ti4,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[4] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS') AS to4,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[4] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS') AS ti5,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[5] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS') AS to5,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[5] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS') AS ti6,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[6] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS') AS to6,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[6] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS') AS ti7,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[7] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS') AS to7,
        (SELECT CONCAT(lastname, ', ', firstname, ' ', LEFT(middlename , 10)) AS name FROM contractor_employee WHERE contractor_employee.face_id = olo.face_id) AS name
        FROM contractor_logbox AS olo WHERE olo.face_id in (SELECT face_id FROM contractor_employee WHERE company = \'''' + current_user + '''\') ORDER BY name;'''
    )

    def ceil_dt(dt):
        dt = dt.replace(second=0, microsecond=0)
        return dt + (datetime.datetime.min - dt) % datetime.timedelta(minutes=30)

    def floor_dt(dt):
        # dt = dt.replace(second=0, microsecond=0)
        return dt - (dt - datetime.datetime.min) % datetime.timedelta(minutes=30)

    def ot_and_day(timeIn, timeOut):
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
    
    final_listahan = []
    for q in query:
        listahan = [(q.ti1, q.to1), (q.ti2, q.to2), (q.ti3, q.to3), (q.ti4, q.to4), (q.ti5, q.to5), (q.ti6, q.to6), (q.ti7, q.to7)]
        holder_listahan = []
        day_holder = 0
        ot_holder = 0
        for ti, to in listahan:
            if ti != None and to != None:
                day, ot = ot_and_day(ti, to)
                holder_listahan.append((day, ot))
            else:
                day, ot = 0, 0
                holder_listahan.append((day, ot))
        day_holder = sum([i[0] for i in holder_listahan])
        ot_holder = sum([i[1] for i in holder_listahan])
        final_listahan.append([day_holder, ot_holder])
        print(holder_listahan)
    print(final_listahan)

    context = {
        'query': query,
        'final_listahan' : final_listahan,
        'ts': dictOfWords,
        'shift': 'NIGHT SHIFT'
    }
    return render(request, 'contractor/week.html', context)


@login_required
def LastWeek(request):
    current_user = str(request.user).upper()
    t = timezone.now().weekday()
    ts = timezone.now() + timezone.timedelta(days=-t)
    ts = ts + timezone.timedelta(days=-8)

    petsa = []
    petsa1 = []
    for c in range(7):
        pet = ts + timezone.timedelta(days=c)
        petsa.append(str(pet.date()))
        petsa1.append(pet.date())

    dictOfWords = {i: petsa1[i] for i in range(0, len(petsa1))}
    query = employee.objects.raw(
        '''SELECT DISTINCT face_id as id, 
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[0] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS') AS ti1,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[0] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS') AS to1,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[1] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS') AS ti2,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[1] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS') AS to2,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[2] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS') AS ti3,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[2] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS') AS to3,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[3] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS') AS ti4,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[3] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS') AS to4,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[4] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS') AS ti5,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[4] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS') AS to5,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[5] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS') AS ti6,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[5] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS') AS to6,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[6] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS') AS ti7,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[6] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS') AS to7,
        (SELECT CONCAT(lastname, ', ', firstname, ' ', LEFT(middlename , 10)) AS name FROM contractor_employee WHERE contractor_employee.face_id = olo.face_id) AS name
        FROM contractor_logbox AS olo WHERE olo.face_id in (SELECT face_id FROM contractor_employee WHERE company = \'''' + current_user + '''\') ORDER BY name;'''
    )

    def ceil_dt(dt):
        dt = dt.replace(second=0, microsecond=0)
        return dt + (datetime.datetime.min - dt) % datetime.timedelta(minutes=30)

    def floor_dt(dt):
        # dt = dt.replace(second=0, microsecond=0)
        return dt - (dt - datetime.datetime.min) % datetime.timedelta(minutes=30)

    def ot_and_day(timeIn, timeOut):
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
        return [hour_per_day, ot_per_day]
    
    final_listahan = []
    for q in query:
        listahan = [(q.ti1, q.to1), (q.ti2, q.to2), (q.ti3, q.to3), (q.ti4, q.to4), (q.ti5, q.to5), (q.ti6, q.to6), (q.ti7, q.to7)]
        holder_listahan = []
        day_holder = 0
        ot_holder = 0
        for ti, to in listahan:
            if ti != None and to != None:
                day, ot = ot_and_day(ti, to)
                holder_listahan.append((day, ot))
            else:
                day, ot = 0, 0
                holder_listahan.append((day, ot))
        day_holder = sum([i[0] for i in holder_listahan])
        ot_holder = sum([i[1] for i in holder_listahan])
        final_listahan.append([day_holder, ot_holder])
    #     print(holder_listahan)
    # print(final_listahan)

    context = {
        'query': query,
        'final_listahan' : final_listahan,
        'ts': dictOfWords,
        'shift': 'DAY SHIFT'
    }
    return render(request, 'contractor/week.html', context)




@login_required
def LastWeekNS(request):
    current_user = str(request.user).upper()
    t = timezone.now().weekday()
    ts = timezone.now() + timezone.timedelta(days=-t)
    ts = ts + timezone.timedelta(days=-8)

    petsa = []
    petsa1 = []
    for c in range(8):
        pet = ts + timezone.timedelta(days=c)
        petsa.append(str(pet.date()))
        petsa1.append(pet.date())

    dictOfWords = {i: petsa1[i] for i in range(0, len(petsa1))}
    query = employee.objects.raw(
        '''SELECT DISTINCT face_id as id, 
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[0] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS') AS ti1,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[1] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS') AS to1,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[1] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS') AS ti2,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[2] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS') AS to2,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[2] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS') AS ti3,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[3] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS') AS to3,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[3] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS') AS ti4,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[4] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS') AS to4,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[4] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS') AS ti5,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[5] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS') AS to5,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[5] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS') AS ti6,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[6] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS') AS to6,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[6] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS') AS ti7,
        (SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[7] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS') AS to7,
        (SELECT CONCAT(lastname, ', ', firstname, ' ', LEFT(middlename , 10)) AS name FROM contractor_employee WHERE contractor_employee.face_id = olo.face_id) AS name
        FROM contractor_logbox AS olo WHERE olo.face_id in (SELECT face_id FROM contractor_employee WHERE company = \'''' + current_user + '''\') ORDER BY name;'''
    )

    def ceil_dt(dt):
        dt = dt.replace(second=0, microsecond=0)
        return dt + (datetime.datetime.min - dt) % datetime.timedelta(minutes=30)

    def floor_dt(dt):
        # dt = dt.replace(second=0, microsecond=0)
        return dt - (dt - datetime.datetime.min) % datetime.timedelta(minutes=30)

    def ot_and_day(timeIn, timeOut):
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
    
    final_listahan = []
    for q in query:
        listahan = [(q.ti1, q.to1), (q.ti2, q.to2), (q.ti3, q.to3), (q.ti4, q.to4), (q.ti5, q.to5), (q.ti6, q.to6), (q.ti7, q.to7)]
        holder_listahan = []
        day_holder = 0
        ot_holder = 0
        for ti, to in listahan:
            if ti != None and to != None:
                day, ot = ot_and_day(ti, to)
                holder_listahan.append((day, ot))
            else:
                day, ot = 0, 0
                holder_listahan.append((day, ot))
        day_holder = sum([i[0] for i in holder_listahan])
        ot_holder = sum([i[1] for i in holder_listahan])
        final_listahan.append([day_holder, ot_holder])
        print(holder_listahan)
    print(final_listahan)

    context = {
        'query': query,
        'final_listahan' : final_listahan,
        'ts': dictOfWords,
        'shift': 'NIGHT SHIFT'
    }
    return render(request, 'contractor/week.html', context)
