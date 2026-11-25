from django.http import JsonResponse
from django.views.decorators.http import require_GET
from .services import obtener_clima

@require_GET
def clima(request):
    ciudad = request.GET.get("ciudad", "").strip()

    if not ciudad or len(ciudad) > 100:
        return JsonResponse(
            {"error": "Debes ingresar una ciudad válida."},
            status=400
        )

    datos = obtener_clima(ciudad)

    if "error" in datos:
        return JsonResponse(datos, status=502)

    return JsonResponse(datos)
