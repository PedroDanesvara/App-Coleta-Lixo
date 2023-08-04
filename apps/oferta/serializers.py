from rest_framework import serializers
from apps.oferta.models import Oferta

class OfertaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Oferta
        fields = ["id","tipo_material", "estado", "peso", "valor", "produtor", "gps_coord"]