import json
import time
from urllib.request import urlopen
from urllib.parse import urlencode
from urllib.error import URLError, HTTPError


def consultar_api(url, parametros):
    direccion = f"{url}?{urlencode(parametros)}"

    ultimo_error = None

    for intento in range(3):
        try:
            with urlopen(direccion, timeout=10) as respuesta:
                return json.loads(respuesta.read().decode("utf-8"))
        except (URLError, HTTPError, TimeoutError) as error:
            ultimo_error = error

            if intento < 2:
                time.sleep(1)

    raise ultimo_error


def obtener_clima(ciudad):
    try:
        ubicacion = consultar_api(
            "https://geocoding-api.open-meteo.com/v1/search",
            {
                "name": ciudad,
                "count": 1,
                "language": "es",
                "format": "json"
            }
        )

        resultados = ubicacion.get("results", [])

        if not resultados:
            return {
                "error": "No se encontró la ciudad indicada."
            }

        lugar = resultados[0]

        clima = consultar_api(
            "https://api.open-meteo.com/v1/forecast",
            {
                "latitude": lugar["latitude"],
                "longitude": lugar["longitude"],
                "current": "temperature_2m,relative_humidity_2m,apparent_temperature,is_day,precipitation,weather_code,wind_speed_10m",
                "timezone": "auto"
            }
        )

        datos = clima["current"]

        estados = {
            0: "Despejado",
            1: "Mayormente despejado",
            2: "Parcialmente nublado",
            3: "Nublado",
            45: "Niebla",
            48: "Niebla con escarcha",
            51: "Llovizna ligera",
            53: "Llovizna moderada",
            55: "Llovizna intensa",
            61: "Lluvia ligera",
            63: "Lluvia moderada",
            65: "Lluvia intensa",
            71: "Nieve ligera",
            73: "Nieve moderada",
            75: "Nieve intensa",
            80: "Chubascos ligeros",
            81: "Chubascos moderados",
            82: "Chubascos intensos",
            95: "Tormenta eléctrica"
        }

        codigo = datos["weather_code"]

        return {
            "ciudad": lugar["name"],
            "pais": lugar.get("country", ""),
            "temperatura": datos["temperature_2m"],
            "sensacion_termica": datos["apparent_temperature"],
            "humedad": datos["relative_humidity_2m"],
            "viento": datos["wind_speed_10m"],
            "precipitacion": datos["precipitation"],
            "estado": estados.get(codigo, "Condición meteorológica variable"),
            "codigo_clima": codigo,
            "es_dia": datos["is_day"] == 1,
            "actualizado": datos["time"],
            "unidad_temperatura": clima["current_units"]["temperature_2m"],
            "unidad_viento": clima["current_units"]["wind_speed_10m"]
        }

    except (URLError, HTTPError, TimeoutError, KeyError, ValueError, IndexError):
        return {
            "error": "No fue posible obtener la información del clima."
        }
