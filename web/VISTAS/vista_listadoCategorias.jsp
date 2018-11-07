<%-- 
    Document   : vista_listadoCategorias
    Created on : 09-oct-2018, 21:59:36
    Author     : migue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" crossorigin="anonymous">

        <!-- All CSS -->
        <link href="css/style.css" rel="stylesheet">

        <!-- Optional JavaScript -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" crossorigin="anonymous"></script>

        <!--Funciones para DOM-->

        <title>Artisan Beer</title>
    </head>
    <body>
        <header>
            <jsp:include page="vista_nav.jsp"/>
        </header>

        <main role="main" class="container mt-5 pt-5" id="cuerpo">
            <div class="row">
                <div class="offset-md-1 col-md-3">
                    <div class="card" style="width: 18rem;">
                        <img class="card-img-top" src="./images/img_vendedor.png" alt="Card image cap">
                        <div class="list-group">
                            <li href="#" class="list-group-item list-group-item-action active">
                                Gestión artículos
                            </li>
                            <a href="./vista_altaArticulo.jsp" class="list-group-item list-group-item-action"> Alta artículo </a>
                            <a href="#" class="list-group-item list-group-item-action"> Baja artículo </a>
                            <a href="./vista_panelControlVendedor.jsp" class="list-group-item list-group-item-action"> Listado / Modificación artículos </a>

                            <li href="#" class="list-group-item list-group-item-action active">
                                Gestión categorías
                            </li>
                            <a href="./vista_altaCategoria.jsp" class="list-group-item list-group-item-action"> Alta categoría </a>
                            <a href="./vista_altaSubcategoria.jsp" class="list-group-item list-group-item-action"> Alta subcategoría </a>
                            <a href="./vista_listadoCategorias.jsp" class="list-group-item list-group-item-action"> Listado / Modificación categorías </a>
                        </div>
                    </div>
                </div>
                <div class="offset-md-1 col-md-7">
                    <div class="card" style="width: 50rem;">
                        <div class="list-group">
                            <li href="#" class="list-group-item list-group-item-action active">
                                Listado categorías
                            </li>
                            <a href="#" class="list-group-item list-group-item-action"> #01# Categoría 1 - Descripcion </a>
                            <a href="#" class="list-group-item list-group-item-action"> #02# Categoría 2 - Descripcion </a>
                            <a href="#" class="list-group-item list-group-item-action"> #02# Categoría 3 - Descripcion  </a>
                        </div>
                    </div>
                    <br/>
                    <div class="card" style="width: 50rem;">      
                        <div class="list-group">
                            <li href="#" class="list-group-item list-group-item-action active">
                                Listado subcategorías
                            </li>
                            <a href="#" class="list-group-item list-group-item-action"> #01# Subcategoría 1 - Descripcion </a>
                            <a href="#" class="list-group-item list-group-item-action"> #02# Subcategoría 2 - Descripcion </a>
                            <a href="#" class="list-group-item list-group-item-action"> #02# Subcategoría 3 - Descripcion  </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <footer class="footer">
        <div class="container">
            <span class="text-muted">Artisan Beer. Tu artesana en casa. &copy;Copyright 2018</span>
        </div>
    </footer>
</body>
</html>
