from django.contrib.auth.decorators import login_required
from django.urls import path, include
from . import views

urlpatterns = [
    path('', login_required(views.OfficeView.as_view()), name='office'),
    path('employee/', login_required(views.OfficeEmployeeListView.as_view()), name='office_list'),
    path('employee/<int:pk>/update/', login_required(views.OfficeEmployeeUpdateView.as_view()), name='employee_update'),
    path('month/', login_required(views.MonthListView.as_view()), name='office_month'),
]
