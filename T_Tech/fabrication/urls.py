from django.contrib.auth.decorators import login_required
from django.urls import path, include
from . import views

urlpatterns = [
    path('', login_required(views.FabricationView.as_view()), name='fabrication'),
    path('sales/', login_required(views.SaleListView.as_view()), name='fabrication_sales'),
    path('sales/<int:pk>/update/', login_required(views.SaleUpdateView.as_view()), name='fabrication_sales_update'),
    path('rfpgs/', login_required(views.RfpgListView.as_view()), name='fabrication_rfpgs'),
    path('rfpgs/<int:pk>/update/', login_required(views.RfpgUpdateView.as_view()), name='fabrication_rfpgs_update'),
]
