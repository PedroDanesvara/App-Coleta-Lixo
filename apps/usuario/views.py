from django.shortcuts import render
from rest_framework import viewsets

from apps.usuario.models import Profile
from apps.usuario.serializers import PerfilSerializer

from rest_framework.permissions import IsAuthenticatedOrReadOnly


class OfertaViewSet(viewsets.ModelViewSet):
    queryset = Profile.objects.all()
    serializer_class = PerfilSerializer
    permission_classes = (IsAuthenticatedOrReadOnly, )
