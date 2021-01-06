from rest_framework import serializers

from contractor.models import employee as con_employee
from contractor.models import logbox as con_logbox

class ContractorEmployeeSerializer(serializers.ModelSerializer):
    class Meta:
        model = con_employee
        fields = "__all__"
        

class ContractorLogboxSerializer(serializers.ModelSerializer):
    employee = serializers.StringRelatedField()
    class Meta:
        model = con_logbox
        fields = "__all__"
        # fields = ['employee', 'date_time', 'transaction', 'shift']