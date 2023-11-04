from django.urls import path, include
from .views import api 
from apps.usuario import views

app_name = "usuario"

from django.views.generic import TemplateView

urlpatterns = [
    path("api/user/detail/<str:username>/", views.PerfilAPIv2ViewSet.as_view({"get": "retrieve", "patch": "update"}), name="api_user_detail"),
    path("api/user/list/", views.PerfilAPIv2ViewSet.as_view({"get": "list"}), name="api_user_list"),
    path("api/user/add/", views.PerfilAPIv2ViewSet.as_view({"post": "create"}), name="api_user_add"),
    path("api/user/delete/<str:username>/", views.PerfilAPIv2ViewSet.as_view({"delete": "destroy"}), name="api_user_delete"),
    path("api/userperfil/detail/<int:pk>/", views.UserAPIv2ViewSet.as_view({"get": "retrieve", "patch": "update"}), name="api_user_detail"),
    path("api/userperfil/list/", views.UserAPIv2ViewSet.as_view({"get": "list"}), name="api_user_list"),
    path("api/userperfil/add/", views.UserAPIv2ViewSet.as_view({"post": "create"}), name="api_user_add"),
    path("api/userperfil/delete/<int:pk>/", views.UserAPIv2ViewSet.as_view({"delete": "destroy"}), name="api_user_delete"),
    # path("api/user/edit/<int:pk>/", views.DetalhesAPIv2ViewSet.as_view({"patch": "partial_update"}), name="api_user_edit"),
]