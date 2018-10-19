<%-- 
    Document   : vista_altaCategoria
    Created on : 09-oct-2018, 21:28:57
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
            <nav class="navbar navbar-expand-md fixed-top navbar-dark">
                <a class="navbar-brand ml-5" onclick="" href="#"><img id='logo'></img></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav ml-auto mr-5">
                        <li class="nav-item">
                            <a class="nav-link" onclick="" href="#">Inicio</a>
                        </li>
                        <li class="nav-item dropdown" id="parentDrop" value="0">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Catálogo</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="login" href="#" onclick="">Login/Registro</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="carrito" href="#" onclick="">Carrito 0</a>
                        </li>
                    </ul>
                </div>
            </nav>
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
                <div class="offset-md-1 col-md-5">
                    <form>
                        <h3> Alta categoría </h3>
                        <br/>
                        <div class="form-group">
                            <label for="exampleFormControlInput1"> Nombre </label>
                            <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="Articulo 1">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1"> Descripción </label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="2"></textarea>
                        </div>

                        <button class="btn btn-primary offset-md-4 col-md-4" type="submit"> Confirmar alta </button>
                    </form>
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
