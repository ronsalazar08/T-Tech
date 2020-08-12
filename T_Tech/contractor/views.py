from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .models import *

@login_required(login_url='/admin') 
def record_per_employee(request, tid):
    emp = employee.objects.get(id=tid)
    record = logbox.objects.raw(
        f'''
        SELECT
            DISTINCT DATE(date_time) as petsa, 1 as id,
            TIME_FORMAT((SELECT TIME(date_time) FROM contractor_logbox WHERE face_id = '{emp.face_id}' AND transaction = 'I' AND DATE(date_time) = petsa), '%%h:%%i %%p') AS timeIn,
            TIME_FORMAT((SELECT TIME(date_time) FROM contractor_logbox WHERE face_id = '{emp.face_id}' AND transaction = 'O' AND DATE(date_time) = petsa), '%%h:%%i %%p') AS timeOut
        FROM contractor_logbox AS SOD WHERE face_id = '{emp.face_id}' ORDER BY petsa;
        '''
    )
    context = {
        'emp': emp,
        'record': record,
        
    }
    return render(request, 'contractor/record.html', context)
