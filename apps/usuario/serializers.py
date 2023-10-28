from rest_framework import serializers
from apps.usuario.models import Profile
from django.contrib.auth.models import User

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'first_name', 'last_name', 'email', 'password']

class PerfilSerializer(serializers.ModelSerializer):
    user = UserSerializer()

    class Meta:
        model = Profile
        fields = ['user', 'cpf', 'dt_nascimento', 'endereco', 'n_coletas', 'perfil', 'telefone', 'user_types']