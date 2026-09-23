# Copilot instructions for this repo

## Project Shape
**Los Menos Buscados** is a Django 5.1 prototype displaying humorous "wanted posters" for a gallery interface. The single app `Carteles_criminale` contains all logic.

- **Project root**: `Los_Menos_Buscados/` — run Django from here  
- **App location**: `Carteles_criminale/` — models, views, templates, static assets  
- **Key routing**: Project-level URLs in `Los_Menos_Buscados/urls.py` routes `''` to `views.display()`, which renders the gallery template  
- **Database**: SQLite (`db.sqlite3`) with `Cartel` model (fields: `nombre`, `descripcion`, `foto`)  
- **Current scope**: `Index.html` is a frontend mockup (gallery + modal popups); `views.py` only renders templates; `data/carteles.json` is unused and empty

## Critical Name & Path Conventions  
**Preserve these exactly or the app breaks:**

- **Template folder**: `Temaplates/` (misspelled with extra 'a') → `Carteles_criminales/Index.html` (note plural in folder)  
- **Static namespace**: Use `carteles_criminale` in template `{% static %}` tags, e.g., `{% static 'carteles_criminale/css/style.css' %}`  
- **App name in settings**: `INSTALLED_APPS` includes `'Carteles_criminale'` (underscore, not hyphen)  
- **URL routes**: Single root route in project `urls.py`; no app-level `urls.py` file exists

## Architecture & Data Flow

1. **Entry point**: User GETs `/` → `views.display()` → renders `Index.html`  
2. **Frontend**: HTML gallery with 8 hardcoded wanted posters + inline JS (`abrirVentana()`, `cerrarVentana()`) for modal popups  
3. **Static files**: CSS/JS/images in `Carteles_criminale/static/carteles_criminale/` — always reference via `{% static %}` template tags, never hardcoded paths  
4. **Data integration path** (not yet implemented): 
   - Django model `Cartel` is defined but unused; views could populate modal content from model instances via context
   - `data/carteles.json` was intended to seed data but remains empty and unwired  
   - `promp.txt` contains the canonical descriptions for 8 joke character profiles (source of truth if populating data)

## Content Guidelines  
- **Language**: All user-facing text is Spanish (`CARTELES DE SE BUSCA`, `INICIAR SESIÓN`, `REGISTRO`)  
- **Tone**: Humorous/satirical Western "wanted poster" theme with fictional, comedic character profiles  
- **Territory**: App is a prototype learning project, not a production system

## Developer Workflow
```bash
cd Los_Menos_Buscados
python manage.py check                    # Validate app registration & settings
python manage.py runserver                # Start dev server (localhost:8000)
python manage.py makemigrations           # After model changes
python manage.py migrate                  # Apply migrations to DB
```

## Critical Gotchas
1. **No migration history exists**: If you add `Cartel` records to the database, you must run `makemigrations` then `migrate`  
2. **Template path is hardcoded**: `TEMPLATES['DIRS']` in `settings.py` points to the misspelled `Temaplates` folder — renaming it breaks template loading  
3. **Static files require `{% static %}` tags**: The template correctly uses `{% load static %}` and the `carteles_criminale` namespace; do not hardcode `/static/` paths  
4. **Inline JS in template**: Modal interaction functions (`abrirVentana()`, `cerrarVentana()`) are defined in `Index.html` — if refactoring to external JS files, preserve DOM element IDs and function signatures  
5. **No tests or CI**: Treat as a learning/prototype project; no test suite is configured

## Django Admin Integration
- **Admin interface**: Model `Cartel` is registered in `admin.py` with `@admin.register` decorator  
- **Access admin**: Navigate to `/admin/` after creating a superuser (`python manage.py createsuperuser`)  
- **Admin display**: Shows `nombre`, `descripcion`, `foto` with search/filter capabilities  

## Forms & Views
- **Forms**: `forms.py` defines `CartelForm` (ModelForm) with styled widgets for HTML5 inputs  
- **Views**:
  - `display()` — renders gallery with all cartels from database
  - `crear_cartel()` — POST handler for new cartel creation (form page at `/cartel/crear/`)
  - `editar_cartel(pk)` — POST handler for editing existing cartel (form page at `/cartel/<id>/editar/`)
- **Form template**: `formulario_cartel.html` — shared template for create/edit with Spanish labels and error handling

## URL Routes
- `/` — Gallery display (name: `display`)  
- `/admin/` — Django admin panel  
- `/cartel/crear/` — Create new cartel form (name: `crear_cartel`)  
- `/cartel/<id>/editar/` — Edit cartel form (name: `editar_cartel`)

## When Extending or Modifying
- **Add models**: Define in `models.py`, run `makemigrations`/`migrate`, register in `admin.py`, create ModelForm in `forms.py`  
- **Add views/routes**: Register new paths in `Los_Menos_Buscados/urls.py`; create corresponding templates  
- **Modify templates**: Use Spanish labels; preserve the Western-themed aesthetic  
- **Add static assets**: Place in `Carteles_criminale/static/carteles_criminale/{css,js,imagenes}/` and reference with `{% static 'carteles_criminale/...' %}`  
- **Admin customization**: Edit `@admin.register` decorator in `admin.py` to add filters, actions, or custom layout
- **Refactor JS**: If moving inline `Index.html` functions to `ventanas.js`, update script src and ensure modal logic remains intact
