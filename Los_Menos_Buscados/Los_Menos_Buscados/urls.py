"""
URL configuration for Los_Menos_Buscados project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
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
# Los_Menos_Buscados/urls.py

from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from Carteles_criminale import views


urlpatterns = [
    path('admin/', admin.site.urls),

    path('', views.disclaimer, name='disclaimer'),
    path('login/', views.iniciar_sesion, name='login'),
    path('registro/', views.registrar_usuario, name='register'),
    path('logout/', views.cerrar_sesion, name='logout'),

    path('carteles/', views.display, name='display'),

    path('cartel/crear/', views.crear_cartel, name='crear_cartel'),
    path(
        'cartel/<int:pk>/editar/',
        views.editar_cartel,
        name='editar_cartel'
    ),
    path(
        'cartel/<int:pk>/eliminar/',
        views.eliminar_cartel,
        name='eliminar_cartel'
    ),
]


if settings.DEBUG:
    urlpatterns += static(
        settings.MEDIA_URL,
        document_root=settings.MEDIA_ROOT
    )