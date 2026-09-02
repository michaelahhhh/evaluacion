from django.shortcuts import render

def display(request):
    return render(request, 'Carteles_criminales/Index.html')