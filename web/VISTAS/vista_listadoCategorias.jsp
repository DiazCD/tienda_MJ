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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                        </tr>
                    </thead>
                    <tbody>
                        <% for (int i = 0; i < arrayCategorias.size(); i++) {%>
                        <tr>
                            <th scope="row"> <%= arrayCategorias.get(i).getId()%> </th>
                            <td> <%= arrayCategorias.get(i).getNombreCat()%> </td>
                            <td> <%= arrayCategorias.get(i).getDescripcionCat()%> </td>
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
                        </tr>
                    </thead>
                    <tbody>
                        <% for (int i = 0; i < arraySubCategorias.size(); i++) {%>
                        <tr>
                            <th scope="row"> <%= arraySubCategorias.get(i).getId()%> </th>
                            <td> <%= arraySubCategorias.get(i).getNombreSubcat()%> </td>
                            <td> <%= arraySubCategorias.get(i).getDescripcionSubcat()%> </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
