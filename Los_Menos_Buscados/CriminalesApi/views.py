from django.shortcuts import render
from CriminalesApp.models import Criminal
from django.http import JsonResponse


def CriminalesApi(request):
    Criminales = Criminal.objects.all
    data = {
         
    }
