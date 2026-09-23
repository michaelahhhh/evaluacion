from django import forms
from .models import Cartel

class CartelForm(forms.ModelForm):
    """Formulario para crear y editar carteles de buscados"""
    
    class Meta:
        model = Cartel
        fields = ('nombre', 'descripcion', 'foto')
        widgets = {
            'nombre': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Nombre del buscado',
                'maxlength': '100'
            }),
            'descripcion': forms.Textarea(attrs={
                'class': 'form-control',
                'placeholder': 'Descripción del cartel',
                'rows': 4
            }),
            'foto': forms.FileInput(attrs={
                'class': 'form-control',
                'accept': 'image/*'
            })
        }
        labels = {
            'nombre': 'Nombre',
            'descripcion': 'Descripción',
            'foto': 'Foto'
        }
