from django.db import models
from apps.produtor.models import Produtor

class Oferta(models.Model):
    tipo_material = models.CharField(max_length=50, help_text='Tipo de Material')
    estado = models.CharField(max_length=50, help_text='Condições do Produto')
    peso = models.FloatField(max_length=20, help_text='Peso do produto')
    valor = models.DecimalField(decimal_places=2, max_digits=10, help_text='Valor calculado pelo app')
    produtor = models.ForeignKey(Produtor, on_delete=models.CASCADE, help_text="Nome do Ofertante", related_name='ofertas')
    gps_coord = models.CharField(max_length=500, help_text="Coordenada gps da coleta")

    class Meta:
        verbose_name = "Oferta"
        verbose_name_plural = "Ofertas"
        
    def __str__(self):
        return f"{self.tipo_material} - {self.estado} - {self.produtor}"