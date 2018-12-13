<%-- 
    Document   : vista_listadoPedidosVivos
    Created on : 26-nov-2018, 22:55:42
    Author     : migue
--%>

<%@page import="POJO.Pedido"%>
<%@page import="java.util.ArrayList"%>
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
        <% ArrayList<Pedido> arrayPedidos = (ArrayList<Pedido>) session.getAttribute("arrayPedidos");%>
        <% String estado = (String) session.getAttribute("estado"); %>
        <br/><br/><br/>
        <div class="row">
            <jsp:include page ="vista_navPanelControlVendedor.jsp"/>
            <div class="offset-md-1 col-md-5">
                <li class="list-group-item list-group-item-action active">
                    <% if (estado.equals("0")) { %>
                    Listado pedidos activos
                    <% } else {%>
                    Listado pedidos completados
                    <% }%>
                </li>
                <br>
                <table class="table table-sm table-striped">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col"> Fecha pedido </th>
                            <th scope="col"> Dirección </th>
                            <th scope="col"> Importe total</th>
                            <th> Detalle </th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (int i = 0; i < arrayPedidos.size(); i++) {%>
                        <tr>
                            <th scope="row"> <%= arrayPedidos.get(i).getId()%> </th>
                            <td> <%= arrayPedidos.get(i).getFechaPed()%> </td>
                            <td> <%= arrayPedidos.get(i).getDireccion().getDireccion()%> (<%= arrayPedidos.get(i).getDireccion().getPoblacion()%> )</td>
                            <td> <%= arrayPedidos.get(i).getImporteTotal()%> €</td>
                            <td> <a href=" <%= "../servlet_detallePedido?idPedido=" + arrayPedidos.get(i).getId()%>" ><i class="fas fa-folder-open"></i></a> </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>
        <br><br><br><br>
        <footer class="footer">
            <div class="container">
                <span class="text-muted">Artisan Beer. Tu artesana en casa. &copy;Copyright 2018</span>
            </div>
        </footer>
    </body>
</html>
