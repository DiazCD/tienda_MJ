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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">      
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Panel de control - Vendedor</title>
    </head>
    <body>
        <% ArrayList<Articulo> arrayArticulos = (ArrayList<Articulo>) session.getAttribute("arrayArticulos");%>
        <br/>
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
                            <td> <%= arrayArticulos.get(i).getCategoria().getNombreCat() %> </td>
                            <td> <%= arrayArticulos.get(i).getSubcategoria().getNombreSubcat() %></td>
                            <td> <%= arrayArticulos.get(i).getImporteArt() %> </td>
                            <td> <a href=" <%= "../servlet_preModArticulo?idArticulo=" + arrayArticulos.get(i).getId()%>" ><i class="fas fa-edit"></i></a> </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
