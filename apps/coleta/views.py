from django.shortcuts import render
from apps.coleta.models import Oferta

def listar(request):
    ofertas = Oferta.objects.all()

    context = {'ofertas': ofertas}

    return render(request, 'home.html', context=context)
