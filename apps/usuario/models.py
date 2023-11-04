from django.db import models
from django.contrib.auth.models import User
from django.contrib.postgres.fields import ArrayField


# Create your models here.

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)    
    cpf = models.CharField(max_length=500, help_text='CPF', blank=True, null=True)
    dt_nascimento = models.DateField(help_text="Data de Nascimento", blank=True, null=True)
    endereco = models.CharField(max_length=500, help_text='Endereço', blank=True, null=True)
    n_coletas = models.IntegerField(help_text='Número de Coletas', blank=True, null=True)
    perfil = models.CharField(max_length=150, help_text="Tipo de Produtor", blank=True, null=True)
    telefone = models.CharField(max_length=500, help_text='Telefone')
    USER_TYPES = [
        ('produtor', 'Produtor'),
        ('coletor', 'Coletor'),
        ('sucataria', 'Sucataria'),
    ]

    user_types = ArrayField(models.CharField(max_length=20, choices=USER_TYPES))
    
    def __str__(self):
        return self.user.username