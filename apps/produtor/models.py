from django.db import models

class Pessoa(models.Model):
    nome = models.CharField(max_length=200, help_text='Nome')    
    cpf = models.CharField(max_length=500, help_text='CPF')
    email = models.CharField(max_length=500, help_text='Email')
    dt_nascimento = models.DateField(help_text="Data de Nascimento")
    endereco = models.CharField(max_length=500, help_text='Endereço')

    class Meta:
        abstract = True

    def __str__(self):
        return str(self.nome) + ' - ' + str(self.cpf)
    
class Produtor(Pessoa):
    perfil = models.CharField(max_length=150, help_text="Tipo de Produtor")
    