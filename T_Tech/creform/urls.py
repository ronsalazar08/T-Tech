from django.contrib.auth.decorators import login_required
from django.urls import path, include
from . import views

urlpatterns = [
    path('', login_required(views.CreformView.as_view()), name='creform'),
    path('sales/', login_required(views.SaleListView.as_view()), name='creform_sales'),
    path('sales/<int:pk>/update/', login_required(views.SaleUpdateView.as_view()), name='creform_sales_update'),
]
