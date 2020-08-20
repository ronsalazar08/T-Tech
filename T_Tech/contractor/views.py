from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .models import *
from django.utils import timezone

@login_required(login_url='/admin') 
def record_per_employee(request, tid):
    emp = employee.objects.get(id=tid)
    record = logbox.objects.raw(
        f'''
        SELECT
            DISTINCT DATE(date_time) as petsa, 1 as id,
            TIME_FORMAT((SELECT TIME(date_time) FROM contractor_logbox WHERE face_id = '{emp.face_id}' AND transaction = 'I' AND DATE(date_time) = petsa), '%%h:%%i %%p') AS timeIn,
            IF(IFNULL((SELECT TIME(date_time) FROM contractor_logbox WHERE face_id = '{emp.face_id}' AND transaction = 'I' AND DATE(date_time) = petsa),1) = 1 AND SOD.shift = 'NS', NULL ,TIME_FORMAT((SELECT TIME(date_time) FROM contractor_logbox WHERE face_id = '{emp.face_id}' AND transaction = 'O' AND DATE(date_time) = petsa  + INTERVAL IF(SOD.shift = 'NS', 1, 0) DAY), '%%h:%%i %%p')) AS timeOut,
            shift
        FROM contractor_logbox AS SOD WHERE face_id = '{emp.face_id}' ORDER BY petsa;
        '''
    )
    context = {
        'emp': emp,
        'record': record,
        
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
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[0] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS ti1,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[0] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS to1,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[1] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS ti2,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[1] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS to2,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[2] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS ti3,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[2] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS to3,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[3] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS ti4,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[3] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS to4,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[4] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS ti5,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[4] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS to5,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[5] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS ti6,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[5] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS to6,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[6] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS ti7,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[6] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS to7,
        (SELECT CONCAT(lastname, ', ', firstname, ' ', LEFT(middlename , 10)) AS name FROM contractor_employee WHERE contractor_employee.face_id = olo.face_id) AS name
        FROM contractor_logbox AS olo WHERE olo.face_id in (SELECT face_id FROM contractor_employee WHERE company = \'''' + current_user + '''\') ORDER BY name;'''
    )

    query1 = logbox.objects.raw('''select face_id as id,
        (select user_id from contractor_employee where contractor_employee.face_id = contractor_logbox.face_id ) as userID,
        date_format(date_time, "%%Y%%m%%d") as DateLog,
        time_format(date_time, "%%H%%i") as TimeLog,
        transaction as event from contractor_logbox where date(date_time) >= \'''' + petsa[0] + '''\' and date(date_time) <= \'''' + petsa[6] + '''\' ;'''
                                )

    context = {
        'query': query,
        'query1': query1,
        'ts': dictOfWords
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
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[0] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS ti1,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[1] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS to1,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[1] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS ti2,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[2] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS to2,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[2] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS ti3,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[3] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS to3,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[3] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS ti4,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[4] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS to4,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[4] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS ti5,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[5] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS to5,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[5] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS ti6,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[6] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS to6,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[6] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS ti7,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[7] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS to7,
        (SELECT CONCAT(lastname, ', ', firstname, ' ', LEFT(middlename , 10)) AS name FROM contractor_employee WHERE contractor_employee.face_id = olo.face_id) AS name
        FROM contractor_logbox AS olo WHERE olo.face_id in (SELECT face_id FROM contractor_employee WHERE company = \'''' + current_user + '''\') ORDER BY name;'''
    )

    query1 = logbox.objects.raw('''select face_id as id,
        (select user_id from contractor_employee where contractor_employee.face_id = contractor_logbox.face_id ) as userID,
        date_format(date_time, "%%Y%%m%%d") as DateLog,
        time_format(date_time, "%%H%%i") as TimeLog,
        transaction as event from contractor_logbox where date(date_time) >= \'''' + petsa[0] + '''\' and date(date_time) <= \'''' + petsa[6] + '''\' ;'''
                                )

    context = {
        'query': query,
        'query1': query1,
        'ts': dictOfWords
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
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[0] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS ti1,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[0] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS to1,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[1] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS ti2,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[1] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS to2,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[2] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS ti3,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[2] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS to3,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[3] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS ti4,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[3] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS to4,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[4] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS ti5,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[4] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS to5,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[5] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS ti6,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[5] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS to6,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[6] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS ti7,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[6] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='DS'), '%%h:%%i %%p') AS to7,
        (SELECT CONCAT(lastname, ', ', firstname, ' ', LEFT(middlename , 10)) AS name FROM contractor_employee WHERE contractor_employee.face_id = olo.face_id) AS name
        FROM contractor_logbox AS olo WHERE olo.face_id in (SELECT face_id FROM contractor_employee WHERE company = \'''' + current_user + '''\') ORDER BY name;'''
    )

    query1 = logbox.objects.raw('''select face_id as id,
        (select user_id from contractor_employee where contractor_employee.face_id = contractor_logbox.face_id ) as userID,
        date_format(date_time, "%%Y%%m%%d") as DateLog,
        time_format(date_time, "%%H%%i") as TimeLog,
        transaction as event from contractor_logbox where date(date_time) >= \'''' + petsa[0] + '''\' and date(date_time) <= \'''' + petsa[6] + '''\' ;'''
                                )

    context = {
        'query': query,
        'query1': query1,
        'ts': dictOfWords,
        'user': current_user,
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
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[0] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS ti1,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[1] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS to1,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[1] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS ti2,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[2] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS to2,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[2] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS ti3,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[3] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS to3,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[3] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS ti4,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[4] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS to4,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[4] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS ti5,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[5] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS to5,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[5] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS ti6,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[6] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS to6,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[6] + '''\' AND transaction = 'I' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS ti7,
        TIME_FORMAT((SELECT date_time FROM contractor_logbox WHERE DATE(date_time) = \'''' + petsa[7] + '''\' AND transaction = 'O' AND face_id = olo.face_id AND shift ='NS'), '%%h:%%i %%p') AS to7,
        (SELECT CONCAT(lastname, ', ', firstname, ' ', LEFT(middlename , 10)) AS name FROM contractor_employee WHERE contractor_employee.face_id = olo.face_id) AS name
        FROM contractor_logbox AS olo WHERE olo.face_id in (SELECT face_id FROM contractor_employee WHERE company = \'''' + current_user + '''\') ORDER BY name;'''
    )

    query1 = logbox.objects.raw('''select face_id as id,
        (select user_id from contractor_employee where contractor_employee.face_id = contractor_logbox.face_id ) as userID,
        date_format(date_time, "%%Y%%m%%d") as DateLog,
        time_format(date_time, "%%H%%i") as TimeLog,
        transaction as event from contractor_logbox where date(date_time) >= \'''' + petsa[0] + '''\' and date(date_time) <= \'''' + petsa[6] + '''\' ;'''
                                )

    context = {
        'query': query,
        'query1': query1,
        'ts': dictOfWords,
        'user': current_user,
    }
    return render(request, 'contractor/week.html', context)
