
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.core.paginator import Paginator
from django.views.decorators.http import require_POST

from .models import Cartel
from .forms import CartelForm


def disclaimer(request):
    """Muestra el aviso antes de acceder al sitio."""

    if request.method == 'POST':
        request.session['disclaimer_aceptado'] = True
        return redirect('login')

    return render(request, 'Carteles_criminales/disclaimer.html')


def iniciar_sesion(request):
    """Permite iniciar sesión antes de acceder a los carteles."""

    if not request.session.get('disclaimer_aceptado'):
        return redirect('disclaimer')

    if request.user.is_authenticated:
        return redirect('display')

    formulario = AuthenticationForm(request, data=request.POST or None)

    if request.method == 'POST':
        if formulario.is_valid():
            nombre_usuario = formulario.cleaned_data['username']
            contrasena = formulario.cleaned_data['password']

            usuario = authenticate(
                request,
                username=nombre_usuario,
                password=contrasena
            )

            if usuario is not None:
                login(request, usuario)
                return redirect('display')

            messages.error(request, 'Usuario o contraseña incorrectos.')

    return render(
        request,
        'Carteles_criminales/login.html',
        {'formulario': formulario}
    )


def registrar_usuario(request):
    if not request.session.get('disclaimer_aceptado'):
        return redirect('disclaimer')

    if request.user.is_authenticated:
        return redirect('display')

    formulario = UserCreationForm(request.POST or None)

    if request.method == 'POST' and formulario.is_valid():
        nombre_usuario = formulario.cleaned_data['username']

        if len(nombre_usuario) < 4:
            formulario.add_error(
                'username',
                'El nombre de usuario debe tener al menos 4 caracteres.'
            )
        else:
            usuario = formulario.save()
            login(request, usuario)
            return redirect('display')

    return render(
        request,
        'Carteles_criminales/registro.html',
        {'formulario': formulario}
    )

@require_POST
def cerrar_sesion(request):
    """Cierra la sesión y vuelve a mostrar el disclaimer."""

    logout(request)
    request.session.pop('disclaimer_aceptado', None)

    return redirect('disclaimer')


@login_required(login_url='login')
def display(request):
    todos_los_carteles = Cartel.objects.all().order_by('-id')

    paginador = Paginator(todos_los_carteles, 8)

    total_carteles = todos_los_carteles.count()
    total_paginas = 1 + (total_carteles + 7) // 8

    try:
        pagina_solicitada = int(request.GET.get('page', 1))
    except (TypeError, ValueError):
        pagina_solicitada = 1

    pagina_actual = max(
        1,
        min(pagina_solicitada, total_paginas)
    )

    pagina_carteles = max(1, pagina_actual - 1)
    carteles = paginador.get_page(pagina_carteles)

    return render(
        request,
        'Carteles_criminales/Index.html',
        {
            'carteles': carteles,
            'pagina_actual': pagina_actual,
            'total_paginas': total_paginas,
        }
    )

@login_required(login_url='login')
def crear_cartel(request):
    """Permite crear un cartel nuevo."""

    if request.method == 'POST':
        formulario = CartelForm(request.POST, request.FILES)

        if formulario.is_valid():
            formulario.save()
            messages.success(request, '¡Cartel creado exitosamente!')
            return redirect('display')
    else:
        formulario = CartelForm()

    return render(
        request,
        'Carteles_criminales/formulario_cartel.html',
        {
            'formulario': formulario,
            'titulo': 'Crear nuevo cartel',
        }
    )


@login_required(login_url='login')
def editar_cartel(request, pk):
    """Permite editar un cartel existente."""

    cartel = get_object_or_404(Cartel, pk=pk)

    if request.method == 'POST':
        formulario = CartelForm(
            request.POST,
            request.FILES,
            instance=cartel
        )

        if formulario.is_valid():
            formulario.save()
            messages.success(request, '¡Cartel actualizado correctamente!')
            return redirect('display')
    else:
        formulario = CartelForm(instance=cartel)

    return render(
        request,
        'Carteles_criminales/formulario_cartel.html',
        {
            'formulario': formulario,
            'cartel': cartel,
            'titulo': 'Editar cartel',
        }
    )


@login_required(login_url='login')
@require_POST
def eliminar_cartel(request, pk):
    """Elimina un cartel mediante una solicitud POST."""

    cartel = get_object_or_404(Cartel, pk=pk)
    cartel.delete()

    messages.success(request, '¡Cartel eliminado correctamente!')
    return redirect('display')