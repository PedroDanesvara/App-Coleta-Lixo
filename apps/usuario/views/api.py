from rest_framework.response import Response
from rest_framework import status

from rest_framework.viewsets import ModelViewSet
from django.shortcuts import get_object_or_404

from django.contrib.auth.models import User
from apps.usuario.serializers import UserSerializer
from apps.usuario.serializers import PerfilSerializer
from apps.usuario.models import Profile

class UserAPIv2ViewSet(ModelViewSet):
    queryset = User.objects.all()

    serializer_class = UserSerializer
    pagination_class = None
    permission_classes = []
    http_method_names = ['get', 'options', 'head', 'patch', 'post', 'delete']

    def get_serializer_class(self):
        return super().get_serializer_class()

    def get_serializer(self, *args, **kwargs):
        return super().get_serializer(*args, **kwargs)

    def get_object(self):
        pk = self.kwargs.get('pk', '')
        obj = get_object_or_404(
            self.get_queryset(),
            pk=pk,
        )

        self.check_object_permissions(self.request, obj)

        return obj
    
    def update(self, request, *args, **kwargs):
        perfil = self.get_object()
        serializer = UserSerializer(
            instance=perfil,
            data=request.data,
            many=False,
            context={'request': request},
            partial=True,
        )
        serializer.is_valid(raise_exception=True)
        serializer.save()
        headers = self.get_success_headers(serializer.data)
        return Response(
            request.data,
            status=status.HTTP_201_CREATED,
            headers=headers
        )
    
    def list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)
    
    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        headers = self.get_success_headers(serializer.data)
        return Response(
            request.data,
            status=status.HTTP_201_CREATED,
            headers=headers
        )
    
    def destroy(self, request, *args, **kwargs):
        return super().destroy(request, *args, **kwargs)



class PerfilAPIv2ViewSet(ModelViewSet):
    queryset = Profile.objects.all()

    serializer_class = PerfilSerializer
    pagination_class = None
    permission_classes = []
    http_method_names = ['get', 'options', 'head', 'patch', 'post', 'delete']

    def get_serializer_class(self):
        return super().get_serializer_class()

    def get_serializer(self, *args, **kwargs):
        return super().get_serializer(*args, **kwargs)

    def get_object(self):
        pk = self.kwargs.get('id', '')
        obj = get_object_or_404(
            self.get_queryset(),
            pk=pk,
        )

        self.check_object_permissions(self.request, obj)

        return obj
    
    def retrieve(self, request, username, *args, **kwargs):
        try:
            user = User.objects.get(username=username)

            # Serializa tanto o usuário quanto o perfil
            perfil_data = PerfilSerializer(user.profile).data  # Supondo que o perfil esteja relacionado ao usuário

            return Response(perfil_data, status=status.HTTP_200_OK)
        except User.DoesNotExist:
            return Response({'detail': 'Usuário não encontrado.'}, status=status.HTTP_404_NOT_FOUND)
    
    def update(self, request, username, *args, **kwargs):
        try:
            user = User.objects.get(username=username)

            # Atualize os campos do usuário com base nos dados da solicitação
            user.username = request.data.get('username', user.username)
            user.first_name = request.data.get('first_name', user.first_name)
            user.last_name = request.data.get('last_name', user.last_name)
            user.email = request.data.get('email', user.email)

            # Atualize a senha se for fornecida na solicitação
            password = request.data.get('password')
            if password:
                user.set_password(password)

            user.save()

            # Atualize os campos do perfil se eles estiverem presentes na solicitação
            try:
                profile = user.profile
                profile.cpf = request.data.get('cpf', profile.cpf)
                profile.dt_nascimento = request.data.get('dt_nascimento', profile.dt_nascimento)
                profile.endereco = request.data.get('endereco', profile.endereco)
                profile.n_coletas = request.data.get('n_coletas', profile.n_coletas)
                profile.perfil = request.data.get('perfil', profile.perfil)
                profile.user_types = request.data.get('user_types', profile.user_types)
                profile.save()
            except Profile.DoesNotExist:
                return Response({'detail': 'Usuário não existe'})

            perfil_profile_serializer = PerfilSerializer(profile)

            return Response(perfil_profile_serializer.data, status=status.HTTP_200_OK)
        except User.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)
    
    def list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)
    
    def create(self, request, *args, **kwargs):
        # Serialize os dados do perfil
        perfil_profile_serializer = PerfilSerializer(data=request.data)
        perfil_profile_serializer.is_valid(raise_exception=True)

        # Serialize os dados do usuário
        user_data = request.data.get('user', {})
        password = user_data.get('password')

        user_serializer = UserSerializer(data=user_data)
        user_serializer.is_valid(raise_exception=True)

        # Salve o usuário
        user = user_serializer.save()

        # Salve a senha usando set_password
        user.set_password(password)
        user.save()

        # Associe o usuário ao perfil
        perfil_profile_serializer.save(user=user)

        return Response(perfil_profile_serializer.data, status=status.HTTP_201_CREATED)

    
    def destroy(self, request, username, *args, **kwargs):
        try:
            user = User.objects.get(username=username)
            user.delete()
            return Response({'detail': 'Usuário deletado com sucesso'}, status=status.HTTP_200_OK)
        except User.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)