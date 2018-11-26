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
        <% ArrayList<Pedido> arrayPedidosVivos = (ArrayList<Pedido>) session.getAttribute("arrayPedidosVivos");%>
        <br/>
        <div class="row">
            <jsp:include page ="vista_navPanelControlVendedor.jsp"/>
            <div class="offset-md-1 col-md-5">
                <li class="list-group-item list-group-item-action active">
                    Listado pedidos activos
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
                        <% for (int i = 0; i < arrayPedidosVivos.size(); i++) {%>
                        <tr>
                            <th scope="row"> <%= arrayPedidosVivos.get(i).getId()%> </th>
                            <td> <%= arrayPedidosVivos.get(i).getFechaPed()%> </td>
                            <td> <%= arrayPedidosVivos.get(i).getDireccion().getDireccion() %> (<%= arrayPedidosVivos.get(i).getDireccion().getPoblacion()%> )</td>
                            <td> <%= arrayPedidosVivos.get(i).getImporteTotal()%> €</td>
                            <td> <a href=" <%= "../servlet_detallePedido?idPedido=" + arrayPedidosVivos.get(i).getId()%>" ><i class="fas fa-folder-open"></i></a> </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
