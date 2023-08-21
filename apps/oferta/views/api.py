from rest_framework.decorators import api_view
from rest_framework.response import Response

from apps.oferta.serializers import OfertaSerializer

from apps.oferta.models import Oferta

@api_view(["GET"])
def apiOverview(request):
    api_urls = {
        "List": "/ofertalist/",
        "Detail View": "/ofertadetail/<str:pk>/",
        "Create": "/ofertacreate/",
        "Update": "/ofertaupdate/<str:pk>/",
        "Delete": "/clientedelete/<str:pk>/"
    }

    return Response(api_urls)


@api_view(["GET"])
def ofertaList(request):
    ofertas = Oferta.objects.all()
    serializer = OfertaSerializer(ofertas, many=True)
    return Response(serializer.data)


@api_view(["GET"])
def ofertaDetail(request, pk):
    oferta = Oferta.objects.get(id=pk)
    serializer = OfertaSerializer(oferta, many=False)
    return Response(serializer.data)


@api_view(["POST"])
def ofertaCreate(request):
    serializer = OfertaSerializer(data=request.data)

    if serializer.is_valid():
        serializer.save()

    return Response(serializer.data)


@api_view(["PATCH"])
def ofertaUpdate(request, pk):
    oferta = Oferta.objects.get(id=pk)
    serializer = OfertaSerializer(instance=oferta, data=request.data)

    if serializer.is_valid():
        serializer.save()

    return Response(serializer.data)


@api_view(["DELETE"])
def ofertaDelete(request, pk):
    oferta = Oferta.objects.get(id=pk)
    oferta.delete()

    return Response("Item deletado com sucesso!")