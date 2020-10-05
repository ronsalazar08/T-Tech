from django.contrib.auth.decorators import login_required
from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('office/', login_required(views.OfficeView.as_view()), name='office'),
    path('office/employee', login_required(views.OfficeEmployeeListView.as_view()), name='office_list'),
    path('office/employee/<int:pk>/update', login_required(views.OfficeEmployeeUpdateView.as_view()), name='employee_update'),

]
