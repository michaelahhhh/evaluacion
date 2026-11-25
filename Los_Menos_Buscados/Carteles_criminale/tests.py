from django.contrib.auth.models import User
from django.test import TestCase
from django.urls import reverse

from .models import Cartel
from .views import tiene_permiso_cartel


class CartelTests(TestCase):

    def setUp(self):
        self.propietario = User.objects.create_user("propietario", password="ClaveSegura123!")
        self.otro_usuario = User.objects.create_user("otro_usuario", password="ClaveSegura123!")
        self.cartel = Cartel.objects.create(
            nombre="Cartel de prueba",
            descripcion="Descripción de prueba",
            foto="carteles/prueba.jpg",
            usuario=self.propietario,
        )

    def test_propietario_tiene_permiso(self):
        self.assertTrue(tiene_permiso_cartel(self.propietario, self.cartel))

    def test_otro_usuario_no_tiene_permiso(self):
        self.assertFalse(tiene_permiso_cartel(self.otro_usuario, self.cartel))

    def test_staff_tiene_permiso(self):
        staff = User.objects.create_user("staff", password="ClaveSegura123!", is_staff=True)
        self.assertTrue(tiene_permiso_cartel(staff, self.cartel))

    def test_eliminar_solo_admite_post(self):
        self.client.force_login(self.propietario)
        response = self.client.get(reverse("eliminar_cartel", args=[self.cartel.pk]))
        self.assertEqual(response.status_code, 405)

    def test_otro_usuario_recibe_permiso_denegado(self):
        self.client.force_login(self.otro_usuario)
        response = self.client.post(reverse("eliminar_cartel", args=[self.cartel.pk]))
        self.assertEqual(response.status_code, 403)

# Create your tests here.
