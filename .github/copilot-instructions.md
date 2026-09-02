# Copilot instructions for this repo

## Project shape
- This is a Django project named `Los_Menos_Buscados` with a single app named `Carteles_criminale`.
- The app is organized under `Los_Menos_Buscados/Carteles_criminale/`; key files are `models.py`, `views.py`, `apps.py`, `static/`, and `Temaplates/`.
- The app is still a prototype: `views.py` is mostly a stub, `models.py` defines a `Cartel` model, and `data/carteles.json` exists but is empty.
- If you add features, check both the Django project layer (`Los_Menos_Buscados/settings.py`, `Los_Menos_Buscados/urls.py`) and the app layer before changing behavior.

## Important patterns and quirks
- The template folder is spelled `Temaplates` (with an extra `a`) and is nested as `Carteles_criminale/Temaplates/Carteles_criminales/Index.html`.
- Static assets live under `Carteles_criminale/static/carteles_criminale/`, but the HTML currently references `carteles/...` paths and a CSS file named `styles.css`; the actual file is `css/style.css`.
- The app name and static namespace are inconsistent (`Carteles_criminale` vs `carteles`), so preserve the existing convention when touching templates or static references.
- The page in `Index.html` is a front-end mockup: login form, gallery of wanted posters, and modal “ventana” popups driven by inline JavaScript.
- The codebase does not yet follow a clean MVC pattern for the gallery; it mixes static HTML, CSS, and JS directly in the template.

## Workflow
- Run the project from `Los_Menos_Buscados/`: `cd Los_Menos_Buscados && python manage.py runserver`.
- For Django changes, validate with `python manage.py check` and, if you add models, use `python manage.py makemigrations` / `python manage.py migrate`.
- There are no tests or migration files in the app yet; treat this as a lightweight learning project unless the user asks for a full app build-out.

## Existing conventions to follow
- Keep template names and directory casing consistent with the current project even when they are misspelled; changing them blindly may break the app.
- Prefer small, direct edits in the existing Django app structure rather than introducing a new app or framework.
- The HTML uses Spanish labels (`INICIAR SESIÓN`, `REGISTRO`, `CARTELES DE SE BUSCA`) and a Western-themed UI; preserve that tone if you extend the interface.
- Example model usage: `Cartel(nombre, descripcion, foto)` in `models.py` is the intended data shape for future catalog entries.

## Gotchas
- `settings.py` currently has a missing comma in `INSTALLED_APPS` (`'Carteles_criminale'` followed by `'django.contrib.admin'`), so verify app registration before assuming Django can load the app.
- `Index.html` includes inline JS for `iniciarSesion`, `registrarse`, `abrirVentana`, and `cerrarVentana`; if you refactor to JS files, keep the existing DOM IDs and modal behavior.
- `data/carteles.json` is empty and not wired into views yet; avoid assuming the app loads poster data from JSON unless you explicitly implement that flow.
