from django.shortcuts import render
from rest_framework import viewsets

from apps.oferta.models import Oferta
from apps.oferta.serializers import OfertaSerializer

from rest_framework.permissions import IsAuthenticatedOrReadOnly


class OfertaViewSet(viewsets.ModelViewSet):
    queryset = Oferta.objects.all()
    serializer_class = OfertaSerializer
    permission_classes = (IsAuthenticatedOrReadOnly, )
