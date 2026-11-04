from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.core.paginator import Paginator
from django.core.exceptions import PermissionDenied
from django.views.decorators.http import require_POST
from .models import Cartel
from .forms import CartelForm

def disclaimer(request):

    if request.method == 'POST':
        request.session['disclaimer_aceptado'] = True
        return redirect('display')

    return render(
        request,
        'Carteles_criminales/disclaimer.html'
    )
def iniciar_sesion(request):

    if not request.session.get('disclaimer_aceptado'):
        return redirect('disclaimer')

    if request.user.is_authenticated:
        return redirect('display')

    formulario = AuthenticationForm(
        request,
        data=request.POST or None
    )

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

            messages.error(
                request,
                'Usuario o contraseña incorrectos.'
            )

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

            messages.success(
                request,
                '¡Cuenta creada exitosamente!'
            )

            return redirect('display')

    return render(
        request,
        'Carteles_criminales/registro.html',
        {'formulario': formulario}
    )
@login_required(login_url='login')
@require_POST
def cerrar_sesion(request):

    logout(request)

    request.session.pop(
        'disclaimer_aceptado',
        None
    )

    return redirect('disclaimer')

def display(request):

    todos_los_carteles = Cartel.objects.all().order_by(
        'usuario_id', 'id'
    )

    paginador = Paginator(todos_los_carteles, 8)

    pagina = paginador.get_page(request.GET.get('page'))

    contexto = {
        'carteles': pagina.object_list,
        'pagina_actual': pagina.number,
        'total_paginas': paginador.num_pages,
    }

    return render(
        request,
        'Carteles_criminales/Index.html',
        contexto
    )

@login_required(login_url='login')
def crear_cartel(request):

    if request.method == 'POST':

        formulario = CartelForm(
            request.POST,
            request.FILES
        )

        if formulario.is_valid():

            cartel = formulario.save(commit=False)
            cartel.usuario = request.user

            cartel.save()

            messages.success(
                request,
                '¡Cartel creado exitosamente!'
            )

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
def tiene_permiso_cartel(usuario, cartel):


    if usuario.is_staff or usuario.is_superuser:
        return True

    return cartel.usuario_id == usuario.id
@login_required(login_url='login')
def editar_cartel(request, pk):

    cartel = get_object_or_404(
        Cartel,
        pk=pk
    )


    if not tiene_permiso_cartel(request.user, cartel):

        raise PermissionDenied(
            'No tienes permiso para editar este cartel.'
        )

    if request.method == 'POST':

        formulario = CartelForm(
            request.POST,
            request.FILES,
            instance=cartel
        )

        if formulario.is_valid():

            formulario.save()

            messages.success(
                request,
                '¡Cartel actualizado correctamente!'
            )

            return redirect('display')

    else:

        formulario = CartelForm(
            instance=cartel
        )

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

    cartel = get_object_or_404(
        Cartel,
        pk=pk
    )

    if not tiene_permiso_cartel(request.user, cartel):

        raise PermissionDenied(
            'No tienes permiso para eliminar este cartel.'
        )

    cartel.delete()

    messages.success(
        request,
        '¡Cartel eliminado correctamente!'
    )

    return redirect('display')