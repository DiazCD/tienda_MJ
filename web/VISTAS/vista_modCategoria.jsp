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
        <jsp:include page="vista_head.jsp"/>

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
