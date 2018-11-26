<%-- 
    Document   : vista_detallePedido
    Created on : 26-nov-2018, 23:49:37
    Author     : migue
--%>

<%@page import="POJO.PedidoLin"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="vista_head.jsp"/>

        <title>Panel de control - Vendedor</title>
    </head>
    <body>
        <% ArrayList<PedidoLin> arrayPedidoLin = (ArrayList<PedidoLin>) session.getAttribute("arrayPedidoLin");%>
        <br/>
        <div class="row">
            <jsp:include page ="vista_navPanelControlVendedor.jsp"/>
            <div class="offset-md-1 col-md-5">
                <li class="list-group-item list-group-item-action active">
                    Detalle del pedido <%=arrayPedidoLin.get(0).getPedido().getId() %>
                </li>
                <br>
                <table class="table table-sm table-striped">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col"> Articulo </th>
                            <th scope="col"> Cantidad </th>
                            <th scope="col"> Importe </th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (int i = 0; i < arrayPedidoLin.size(); i++) {%>
                        <tr>
                            <th scope="row"> <%= arrayPedidoLin.get(i).getId()%> </th>
                            <td> <%= arrayPedidoLin.get(i).getArticulo().getNombreArt() %> </td>
                            <td> <%= arrayPedidoLin.get(i).getCantidadLin()%> </td>
                            <td> <%= arrayPedidoLin.get(i).getImporteLin()%> €</td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
