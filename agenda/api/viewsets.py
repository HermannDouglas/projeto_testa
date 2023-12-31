from rest_framework import viewsets
from django.contrib.auth.models import User, Group

from agenda.models import Local, Convidado, Compromisso
from agenda.api.serializers import UserSerializer, GroupSerializer, LocalSerializer, ConvidadoSerializer, \
    CompromissoSerializer


# Create your views here.
class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    # permission_classes = [permissions.IsAuthenticated]


class GroupViewSet(viewsets.ModelViewSet):
    queryset = Group.objects.all()
    serializer_class = GroupSerializer
    # permission_classes = [permissions.IsAuthenticated]


class LocalViewSet(viewsets.ModelViewSet):
    queryset = Local.objects.all()
    serializer_class = LocalSerializer
    # permission_classes = [permissions.IsAuthenticated]


class ConvidadoViewSet(viewsets.ModelViewSet):
    queryset = Convidado.objects.all()
    serializer_class = ConvidadoSerializer
    # permission_classes = [permissions.IsAuthenticated]


class CompromissoViewSet(viewsets.ModelViewSet):
    queryset = Compromisso.objects.filter()
    serializer_class = CompromissoSerializer
    filterset_fields = ['descricao', 'data_inicio']

    # permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        desc = self.request.query_params.get('descricao')
        queryset = Compromisso.objects.all()
        if desc is not None:
            queryset = queryset.filter(descricao=desc)
        return queryset

    # def get_queryset(self):
    #     usuario = self.request.user.username
    #     convidado = Convidado.objects.get(usuario__username=usuario)
    #     return Compromisso.objects.filter(convidados=convidado)
