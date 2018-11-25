<%-- 
    Document   : vista_listadoCategorias
    Created on : 09-oct-2018, 21:59:36
    Author     : migue
--%>

<%@page import="java.util.ArrayList"%>
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
        <% ArrayList<Categoria> arrayCategorias = (ArrayList) session.getAttribute("arrayCategorias");%>
        <% ArrayList<Subcategoria> arraySubCategorias = (ArrayList) session.getAttribute("arraySubCategorias");%>
        <br/>
        <div class="row">
            <jsp:include page ="vista_navPanelControlVendedor.jsp"/>
            <div class="offset-md-1 col-md-3">
                <li class="list-group-item list-group-item-action active">
                    Listado Categorías
                </li>
                <br>
                <table class="table table-sm table-striped">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col"> Nombre </th>
                            <th scope="col"> Descripción</th>
                            <th> Editar </th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (int i = 0; i < arrayCategorias.size(); i++) {%>
                        <tr>
                            <th scope="row"> <%= arrayCategorias.get(i).getId()%> </th>
                            <td> <%= arrayCategorias.get(i).getNombreCat()%> </td>
                            <td> <%= arrayCategorias.get(i).getDescripcionCat()%> </td>
                            <td> <a href=" <%= "../servlet_preModCategoria?idCategoria=" + arrayCategorias.get(i).getId()%>" ><i class="fas fa-edit"></i></a> </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
            <div class="offset-md-1 col-md-3">
                <li class="list-group-item list-group-item-action active">
                    Listado Subcategorías
                </li>
                <br>
                <table class="table table-sm table-striped">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col"> Nombre </th>
                            <th scope="col"> Descripción</th>
                            <th> Editar </th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (int i = 0; i < arraySubCategorias.size(); i++) {%>
                        <tr>
                            <th scope="row"> <%= arraySubCategorias.get(i).getId()%> </th>
                            <td> <%= arraySubCategorias.get(i).getNombreSubcat()%> </td>
                            <td> <%= arraySubCategorias.get(i).getDescripcionSubcat()%> </td>
                            <td> <a href=" <%= "../servlet_preModSubcategoria?idSubcategoria=" + arraySubCategorias.get(i).getId()%>" ><i class="fas fa-edit"></i></a> </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
