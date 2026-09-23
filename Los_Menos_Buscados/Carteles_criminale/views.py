from django.shortcuts import render, redirect
from django.contrib import messages
from .models import Cartel
from .forms import CartelForm

def display(request):
    """Vista principal que muestra la galería de carteles"""
    carteles = Cartel.objects.all()
    context = {
        'carteles': carteles,
    }
    return render(request, 'Carteles_criminales/Index.html', context)

def crear_cartel(request):
    """Vista para crear un nuevo cartel"""
    if request.method == 'POST':
        form = CartelForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            messages.success(request, '¡Cartel creado exitosamente!')
            return redirect('display')
    else:
        form = CartelForm()
    
    context = {
        'form': form,
        'titulo': 'Crear Nuevo Cartel',
    }
    return render(request, 'Carteles_criminales/formulario_cartel.html', context)

def editar_cartel(request, pk):
    """Vista para editar un cartel existente"""
    cartel = Cartel.objects.get(pk=pk)
    
    if request.method == 'POST':
        form = CartelForm(request.POST, request.FILES, instance=cartel)
        if form.is_valid():
            form.save()
            messages.success(request, '¡Cartel actualizado exitosamente!')
            return redirect('display')
    else:
        form = CartelForm(instance=cartel)
    
    context = {
        'form': form,
        'cartel': cartel,
        'titulo': f'Editar Cartel: {cartel.nombre}',
    }
    return render(request, 'Carteles_criminales/formulario_cartel.html', context)