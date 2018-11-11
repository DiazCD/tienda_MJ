<%-- 
    Document   : vista_altaCategoria
    Created on : 09-oct-2018, 21:28:57
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
        <title>Panel de control - Alta categoría</title>
    </head>
    <body>
        <jsp:include page ="vista_navPanelControlVendedor.jsp"/>
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
                <form method="post" accept-charset="utf-8" action="../servlet_altaCategoria">
                    <h3> Alta categoría </h3>
                    <br/>
                    <div class="form-group">
                        <label for="exampleFormControlInput1"> Nombre </label>
                        <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Articulo 1" name="nombreCat">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1"> Descripción </label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="2" name="descripcionCat"></textarea>
                    </div>
                    
                    <button class="btn btn-primary offset-md-4 col-md-4" type="submit"> Confirmar alta </button>
                </form>
            </div>
        </div>
    </body>
</html>
