<%-- 
    Document   : vista_altaArticulo
    Created on : 09-oct-2018, 20:31:22
    Author     : migue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Panel de control - Alta articulo</title>
    </head>
    <body>
        <div class="row">
            <div class="col-md-12">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <a class="navbar-brand" href="#">Panel de control - Vendedor</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Link</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Dropdown
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled" href="#">Disabled</a>
                            </li>
                        </ul>
                        <form class="form-inline my-2 my-lg-0">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                        </form>
                    </div>
                </nav>
            </div>
        </div>
        <br/>
        <div class="row">
            <div class="offset-md-1 col-md-2">
                <div class="card" style="width: 18rem;">
                    <img class="card-img-top" src="./images/img_vendedor.png" alt="Card image cap">
                    <div class="list-group">
                        <li href="#" class="list-group-item list-group-item-action active">
                            Gestión artículos
                        </li>
                        <a href="./vista_altaArticulo.jsp" class="list-group-item list-group-item-action"> Alta artículo </a>
                        <a href="#" class="list-group-item list-group-item-action"> Baja artículo </a>
                        <a href="../servlet_panelControlVendedor" class="list-group-item list-group-item-action"> Listado / Modificación artículos </a>

                        <li href="#" class="list-group-item list-group-item-action active">
                            Gestión categorías
                        </li>
                        <a href="./vista_altaCategoria.jsp" class="list-group-item list-group-item-action"> Alta categoría </a>
                        <a href="../servlet_cargaCategorias" class="list-group-item list-group-item-action"> Alta subcategoría </a>
                        <a href="../servlet_listadoCategorias" class="list-group-item list-group-item-action"> Listado / Modificación categorías </a>
                    </div>
                </div>
            </div>
            <div class="offset-md-1 col-md-5">
                <form>
                    <h3> Alta artículo </h3>
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
                            <label for="inputEmail4"> Categoría </label>
                            <select class="form-control">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputEmail4"> Subcategoría </label>
                            <select class="form-control">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-3">
                            <label for="inputZip"> Importe </label>
                            <input type="text" class="form-control" placeholder="0.00€">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="inputZip"> Importe a recibir </label>
                            <input type="text" class="form-control" placeholder="0.00€">
                        </div>
                        <div class="form-group offset-md-3 col-md-3">
                            <label for="inputZip"> Cantidad </label>
                            <input type="text" class="form-control">
                        </div>
                    </div>
                    <button class="btn btn-primary offset-md-4 col-md-4" type="submit"> Confirmar alta </button>
                </form>
            </div>
        </div>
    </body>
</html>
