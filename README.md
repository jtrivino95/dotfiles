# Mis Dotfiles

Este repositorio contiene mis configuraciones personales (dotfiles) para varios programas, gestionado para ser fácilmente portable a nuevas instalaciones.

## Contenido

Actualmente, el repositorio incluye:

### Arandr

*   **Ubicación en el repo:** `/.screenlayout/` y `/.local/share/applications/`
*   **Descripción:** Contiene scripts para diferentes configuraciones de pantalla generadas con Arandr y los ficheros `.desktop` para lanzarlas cómodamente desde un menú de aplicaciones.
*   **Perfiles disponibles:**
    *   `laptop-only`: Solo la pantalla del portátil.
    *   `2-screen`: Configuración de dos monitores.
    *   `3-screen`: Configuración de tres monitores.
    *   `main-screen`: Pantalla principal externa.

## Instalación

Para instalar estas configuraciones en un nuevo sistema, sigue estos pasos.

1.  **Clona el repositorio en tu home:**
    ```bash
    git clone https://github.com/jtrivino95/dotfiles.git ~/dotfiles
    ```

2.  **Crea los enlaces simbólicos:**
    El siguiente comando enlazará los archivos de configuración del repositorio a las ubicaciones donde los programas esperan encontrarlos.

    ```bash
    # Crear directorios de destino si no existen
    mkdir -p ~/.screenlayout
    mkdir -p ~/.local/share/applications

    # Enlazar scripts de Arandr
    ln -s ~/dotfiles/.screenlayout/*.sh ~/.screenlayout/

    # Enlazar accesos directos
    ln -s ~/dotfiles/.local/share/applications/*.desktop ~/.local/share/applications/
    ```

## Uso

Una vez instalados, los perfiles de pantalla deberían aparecer en el menú de aplicaciones de tu entorno de escritorio gracias a los archivos `.desktop`, permitiendo un cambio rápido de configuración.
