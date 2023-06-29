from django.db import models
from apps.produtor.models import Pessoa

class Coletor(Pessoa):
    n_coletas = models.IntegerField(help_text='Número de Coletas')
