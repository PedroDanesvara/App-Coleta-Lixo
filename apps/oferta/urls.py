from django.urls import path
from django.views.generic import TemplateView

from apps.oferta import views

urlpatterns = [
    path('api/', views.apiOverview, name='api-oferta-overview'),
    path('api/ofertalist/', views.ofertaList, name='api-oferta-list'),
    path('api/ofertadetail/<str:pk>/', views.ofertaDetail, name='api-oferta-detail'),
    path('api/ofertacreate/', views.ofertaCreate, name='api-oferta-create'),
    path('api/ofertaupdate/<str:pk>/', views.ofertaUpdate, name='api-oferta-update'),
    path('api/ofertadelete/<str:pk>/', views.ofertaDelete, name='api-oferta-delete'),
]
