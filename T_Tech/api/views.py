from rest_framework.viewsets import ModelViewSet
from contractor.models import employee as con_employee
from contractor.models import logbox as con_logbox

from .serializers import ContractorEmployeeSerializer, ContractorLogboxSerializer

class ContractorEmployeeViewSet(ModelViewSet):
    queryset = con_employee.objects.all()
    serializer_class = ContractorEmployeeSerializer
    # lookup_field='lastname'


class ContractorLogboxViewSet(ModelViewSet):
    queryset = con_logbox.objects.all()
    serializer_class = ContractorLogboxSerializer