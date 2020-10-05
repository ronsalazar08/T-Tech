from django.urls import path, include
from . import views

urlpatterns = [
    path('iboard/', views.Homepage, name='iboard_home'),
    path('iboard/reload/', views.Reload, name='reload'),
    path('iboard/display/<slug:rfid>', views.Display, name='display'),
    path('iboard/bday/', views.Bday, name='bday'),
    path('iboard/sales_graph/', views.sales_graph, name='sales_graph'),
    path('iboard/hr_manpower/', views.hr_manpower, name='hr_manpower'),
    path('dashboard/', views.dashboard, name='home'),
]
