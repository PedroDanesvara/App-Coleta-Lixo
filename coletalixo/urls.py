from django.contrib import admin
from django.urls import path, include
from rest_framework.authtoken.views import obtain_auth_token

from rest_framework.authtoken.views import obtain_auth_token

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api-auth/', include('rest_framework.urls')),
    path('ofertas/', include('apps.oferta.urls')),
    path('obtain-token/', obtain_auth_token),
    path("", include("apps.usuario.urls")),
]
