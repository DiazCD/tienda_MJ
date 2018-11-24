<%-- 
    Document   : vista_modCategoria
    Created on : 22-nov-2018, 23:38:17
    Author     : migue
--%>

<%@page import="POJO.Articulo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="POJO.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Panel de control - Modificación categoría</title>
    </head>
    <body>
        <% Categoria categoria = (Categoria) session.getAttribute("categoria");%>
        <% ArrayList<Articulo> arrayArticulos = (ArrayList<Articulo>) session.getAttribute("arrayArticulos");%>
        <br/>
        <div class="row">
            <jsp:include page ="vista_navPanelControlVendedor.jsp"/>
            <div class="offset-md-1 col-md-5">
                <form method="post" accept-charset="utf-8" action="../servlet_modCategoria">
                    <h3> Modificación categoría </h3>
                    <br/>
                    <div class="form-group">
                        <label for="exampleFormControlInput1"> Identificador </label>
                        <input type="text" class="form-control" id="exampleFormControlInput1" name="idCat" value="<%=categoria.getId()%>" readonly="true">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlInput1"> Nombre </label>
                        <input type="text" class="form-control" id="exampleFormControlInput1" name="nombreCat" value="<%=categoria.getNombreCat()%>">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1"> Descripción </label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="2" name="descripcionCat"><%=categoria.getDescripcionCat()%></textarea>
                    </div>

                    <% if (arrayArticulos.size() > 0) { %>
                    <div class="alert alert-warning" role="alert">
                        <strong>Atencion!</strong> Si elimina la categoria, también lo harán los articulos relacionados con ella. 
                    </div>
                    <% }%>

                    <button class="btn btn-primary offset-md-4 col-md-2" type="submit"> Actualizar </button>
                    <a href=" <%= "../servlet_borrarCategoria?idCategoria=" + categoria.getId()%>" class="btn btn-danger col-md-2" type="submit"> Eliminar </a>
                </form>
            </div>
        </div>
    </body>
</html>
