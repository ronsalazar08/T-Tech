from django.urls import path
from rest_framework import routers

from .views import ContractorEmployeeViewSet, ContractorLogboxViewSet

router = routers.DefaultRouter()
router.register('contractor_employee', ContractorEmployeeViewSet)
router.register('contractor_logbox', ContractorLogboxViewSet)

urlpatterns = router.urls
