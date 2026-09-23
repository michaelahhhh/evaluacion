from django.contrib import admin
from .models import Cartel

@admin.register(Cartel)
class CartelAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'descripcion', 'foto')
    search_fields = ('nombre', 'descripcion')
    list_filter = ('nombre',)
    fields = ('nombre', 'descripcion', 'foto')
