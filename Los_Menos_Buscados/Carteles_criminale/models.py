from django.db import models
from django.contrib.auth.models import User


class Cartel(models.Model):

    nombre = models.CharField(max_length=100)

    descripcion = models.TextField()

    foto = models.ImageField(
        upload_to="carteles/"
    )

    usuario = models.ForeignKey(
        User,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name='carteles'
    )

    def __str__(self):
        return self.nombre
