from django.test import TestCase
from django.urls import reverse
from unittest.mock import patch


class ClimaApiTests(TestCase):
    def test_ciudad_vacia_devuelve_400(self):
        response = self.client.get(reverse("consultar_clima"))
        self.assertEqual(response.status_code, 400)
        self.assertIn("error", response.json())

    @patch("CriminalesApi.views.obtener_clima")
    def test_respuesta_exitosa(self, obtener_clima):
        obtener_clima.return_value = {
            "ciudad": "Santiago",
            "temperatura": 20,
        }
        response = self.client.get(reverse("consultar_clima"), {"ciudad": "Santiago"})
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json()["ciudad"], "Santiago")

    @patch("CriminalesApi.views.obtener_clima")
    def test_error_del_servicio_devuelve_502(self, obtener_clima):
        obtener_clima.return_value = {"error": "No fue posible obtener el clima."}
        response = self.client.get(reverse("consultar_clima"), {"ciudad": "Santiago"})
        self.assertEqual(response.status_code, 502)
        self.assertIn("error", response.json())
