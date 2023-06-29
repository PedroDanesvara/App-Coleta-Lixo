from django.urls import path

from apps.coleta.views import listar

urlpatterns = [
    path('listar', listar, name='listar'),
]
