<%-- 
    Document   : vista_altaSubcategoria
    Created on : 09-oct-2018, 21:39:09
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
                <div class="offset-md-1 col-md-5">
                    <form>
                        <h3> Alta subcategoría </h3>
                        <br/>
                        <div class="form-group">
                            <label for="exampleFormControlInput1"> Nombre </label>
                            <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="Articulo 1">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1"> Descripción </label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="2"></textarea>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputEmail4"> Categoría padre </label>
                                <select class="form-control">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>
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
