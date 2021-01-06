from django.contrib.auth.decorators import login_required
from django.urls import path, include
from . import views

urlpatterns = [
    path('record/<int:tid>', views.record_per_employee, name='record'),
    path('', login_required(views.ContractorView.as_view()), name='contractor'),
    path('employee/', login_required(views.ContractorEmployeeListView.as_view()), name='contractor_list'),
    path('employee/create/', login_required(views.ContractorEmployeeCreateView.as_view()), name='contractor_add'),
    path('employee/<int:pk>/update/', login_required(views.ContractorEmployeeUpdateView.as_view()), name='contractor_update'),
    path('employee/<int:pk>/delete/', login_required(views.ContractorEmployeeDeleteView.as_view()), name='contractor_delete'),
    path('logbox/', login_required(views.ContractorLogboxListView.as_view()), name='contractor_logbox'),
    path('schedule', login_required(views.ScheduleView.as_view()), name='contractor_schedule'),
]