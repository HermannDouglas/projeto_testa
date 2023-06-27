"""
URL configuration for projeto_testa project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from rest_framework import routers
from agenda.api.viewsets import UserViewSet, GroupViewSet, LocalViewSet, ConvidadoViewSet, CompromissoViewSet
from agenda.views import lista_locais

router = routers.DefaultRouter()
router.register('users', UserViewSet)
router.register('groups', GroupViewSet)
router.register('local', LocalViewSet)
router.register('convidado', ConvidadoViewSet)
router.register('compromisso', CompromissoViewSet)


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include(router.urls)),
    path('api-auth/', include('rest_framework.urls')),
    path('lista_locais', lista_locais, name='lista_locais'),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
