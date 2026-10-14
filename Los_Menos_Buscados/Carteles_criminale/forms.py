from django import forms
from .models import Cartel
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm


class RegistroUsuarioForm(UserCreationForm):
    email = forms.EmailField(
        required=True,
        label='Correo electrónico'
    )

    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']

        labels = {
            'username': 'Nombre de usuario',
        }

    def clean_email(self):
        email = self.cleaned_data['email']

        if User.objects.filter(email__iexact=email).exists():
            raise forms.ValidationError(
                'Este correo electrónico ya está registrado.'
            )

        return email

    def save(self, commit=True):
        usuario = super().save(commit=False)
        usuario.email = self.cleaned_data['email']

        if commit:
            usuario.save()

        return usuario


class CartelForm(forms.ModelForm):

    class Meta:
        model = Cartel

        fields = (
            "nombre",
            "descripcion",
            "foto",
        )

        widgets = {
            "nombre": forms.TextInput(
                attrs={
                    "class": "form-control",
                    "placeholder": "Nombre del buscado",
                    "maxlength": "100",
                }
            ),

            "descripcion": forms.Textarea(
                attrs={
                    "class": "form-control",
                    "placeholder": "Descripción del cartel",
                    "rows": 4,
                }
            ),

            "foto": forms.FileInput(
                attrs={
                    "class": "form-control",
                    "accept": "image/*",
                }
            ),
        }

        labels = {
            "nombre": "Nombre",
            "descripcion": "Descripción",
            "foto": "Foto",
        }