from django.contrib.auth.decorators import login_required
from django.urls import path, include
from . import views


urlpatterns = [
    path('', login_required(views.HrView.as_view()), name='hr'),
    path('thc/', login_required(views.ThcListView.as_view()), name='thc_list'),
    path('ttech/', login_required(views.TtechListView.as_view()), name='ttech_list'),
    path('ytmi/', login_required(views.YtmiListView.as_view()), name='ytmi_list'),
]