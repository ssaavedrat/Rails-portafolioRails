# Rails - Portafolio Rails

Repositorio de proyecto portafolio Rails.

## Pasos

A continuación, se detalla un paso a paso para la creación de este proyecto.

1. Creación de proyecto

    ```bash
    rails new portafolioRails
    ```

2. Con el generador de rails, creamos un controlador **pages** para manejar las vistas del portafolio. Asignamos, además, una vista home

    ```bash
    rails g controller pages home
    ```

3. Comprobamos el funcionamiento ejecutando el servidor

    ```bash
    rails s
    ```

    y accediendo a `localhost:3000`

4. Definimos **home** como la ruta raíz (`/`), configurando el archivo `config/routes.rb`.

    ```Ruby
    Rails.application.routes.draw do
        get 'pages/home'
         # Define the root path route ("/")
        root "pages#home"
    end
    ```

    Ahora podemos entrar a `localhost:3000` y comprobar que **home** es la vista predeterminada.

5. Modificamos el archivo `app/views/layouts/application.html.erb` para importar bootstrap mediante CDN. Además envolvemos `yield` dentro de un `div.container`.

    Con esto, al recargar la página, se verá con la tipografía y estilos predeterminados de Bootstrap.

6. Agregamos un elemento **NavBar** al archivo `app/views/layouts/application.html.erb` y con la ayuda del helper `link_to` de Rails creamos un enlace a **home**.

    ```erb
    <%# Creamos un navbar con Bootstrap %>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
      <div class="container-fluid">
        <%# Helper Brand%>
        <%= link_to 'PortafolioRails', root_path, class:"navbar-brand"%>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <%# Helper a Home %>
              <%= link_to 'Home', root_path, class:"nav-link active"%>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="#">Link</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    ```

7. Creamos un archivo CSS en `app/assets/stylesheets/estilos.css` que automaticamente es llamado por `app/assets/stylesheets/application.css`,

    ```css
    *= require_tree .
    *= require_self
    ```

     a su vez, llamado por `app/views/layouts/application.html.erb`

    ```erb
        <%= stylesheet_link_tag "application", "data-turbo-track": "reload" %>
    ```

8. Agregar una imagen y una card a `home.html.erb`. Utilizamos bootstrap para agregar una card con una imagen apoyados del `asset_path` de Rails.

    ```erb
    <%# Agregamos una Card de Bootstrap%>
    <div class="card mb-3">
    <div class="row g-0">
        <div class="col-md-4">
        <%# Helper image_tag%>
        <%= image_tag 'me.jfif', class:"img-fluid rounded-start", alt:"Me"%>
        </div>
        <div class="col-md-8">
        <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
            <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
        </div>
        </div>
    </div>
    </div>
    ```

9. Agregar descripción a la card. Enlace a Github y LinkedIn.

10. Agregar las vistas `projects` y `contact` e insertar HTML básico.

11. En la vista `projects.html.erb` se agregan 3 proyectos anteriores. Para ello, se agregan las imágenes de dichos proyectos a la carpeta `app/assets/images` y se referencian con el helper `image_tag`. Los proyectos son presentados con tres cards de bootstrap a las que se les ha agregado un botón de *ver más*, estilizado con css agregado al archivo `app/assets/stylesheets/estilos.css`.

Extras:

* Se usa el partial `_navbar`. Los partials permiten reutilizar elementos comunes y simplificar la lectura de los layouts.
