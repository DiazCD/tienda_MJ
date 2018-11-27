<%-- 
    Document   : vista_panelControlVendedor
    Created on : 02-oct-2018, 23:23:34
    Author     : migue
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="POJO.Articulo"%>
<%@page import="POJO.Categoria"%>
<%@page import="POJO.Subcategoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="vista_head.jsp"/>

        <title>Panel de control - Vendedor</title>
    </head>
    <body>
        <header>
            <jsp:include page="vista_nav.jsp"/>
        </header>
        <% ArrayList<Articulo> arrayArticulos = (ArrayList<Articulo>) session.getAttribute("arrayArticulos");%>
        <br/><br/><br/>
        <div class="row">
            <jsp:include page ="vista_navPanelControlVendedor.jsp"/>
            <div class="offset-md-1 col-md-6">
                <li class="list-group-item list-group-item-action active">
                    Listado artículos
                </li>
                <br>
                <table class="table table-sm table-striped">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col"> Nombre </th>
                            <th scope="col"> Descripción </th>
                            <th scope="col"> Categoría </th>
                            <th scope="col"> Subategoría </th>
                            <th scope="col"> Importe </th>
                            <th> Editar </th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (int i = 0; i < arrayArticulos.size(); i++) {%>
                        <tr>
                            <th scope="row"> <%= arrayArticulos.get(i).getId()%> </th>
                            <td> <%= arrayArticulos.get(i).getNombreArt()%> </td>
                            <td> <%= arrayArticulos.get(i).getDescripcionArt()%> </td>
                            <td> <%= arrayArticulos.get(i).getCategoria().getNombreCat()%> </td>
                            <td> <%= arrayArticulos.get(i).getSubcategoria().getNombreSubcat()%></td>
                            <td> <%= arrayArticulos.get(i).getImporteArt()%> </td>
                            <td> <a href=" <%= "../servlet_preModArticulo?idArticulo=" + arrayArticulos.get(i).getId()%>" ><i class="fas fa-edit"></i></a> </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>
        <footer class="footer">
            <div class="container">
                <span class="text-muted">Artisan Beer. Tu artesana en casa. &copy;Copyright 2018</span>
            </div>
        </footer>
    </body>
</html>
