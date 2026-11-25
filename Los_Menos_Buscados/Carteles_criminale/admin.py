from django.contrib import admin
from .models import Cartel


@admin.register(Cartel)
class CartelAdmin(admin.ModelAdmin):

    list_display = (
        "nombre",
        "usuario",
        "descripcion",
        "foto",
    )

    search_fields = (
        "nombre",
        "descripcion",
        "usuario__username",
    )

    list_filter = (
        "usuario",
    )

    fields = (
        "nombre",
        "descripcion",
        "foto",
        "usuario",
    )