from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.Homepage, name='iboard_home'),
    path('reload/', views.Reload, name='reload'),
    path('display/<int:rfid>', views.Display, name='display'),
    path('bday/', views.Bday, name='bday'),
    path('sales_graph/', views.sales_graph, name='sales_graph'),
    path('hr_manpower/', views.hr_manpower, name='hr_manpower'),
    # path('dies_status/', views.dies_status, name='dies_status'),
]
