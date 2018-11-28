<%-- 
    Document   : vista_navPanelControlVendedor
    Created on : 11-nov-2018, 18:36:39
    Author     : migue
--%>

<%@page import="POJO.Usuario"%>
<%@page import="POJO.Vendedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="offset-md-1 col-md-2">
    <div class="card" style="width: 18rem;">
        <img class="card-img-top" src="./images/img_vendedor.png" alt="Card image cap">
        <% Vendedor vendedor = (Vendedor) session.getAttribute("vendedorLogueado"); %>
        <% Usuario usuario = (Usuario) session.getAttribute("usuarioLogueado"); %>
        <div class="list-group">
            
            <!-- Si se logea un usuario -->
            <% if (vendedor != null && vendedor.getId() != null) { %>
            
            <li href="#" class="list-group-item list-group-item-action active">
                Gestión artículos
            </li>
            <a href="../servlet_cargaCategorias?jspDestino=altaArticulo" class="list-group-item list-group-item-action"> Alta artículo </a>
            <a href="../servlet_panelControlVendedor" class="list-group-item list-group-item-action"> Listado / Modificación artículos </a>
            
            <li href="#" class="list-group-item list-group-item-action active">
                Gestión categorías
            </li>
            <a href="./vista_altaCategoria.jsp" class="list-group-item list-group-item-action"> Alta categoría </a>
            <a href="../servlet_cargaCategorias?jspDestino=altaSubcategoria" class="list-group-item list-group-item-action"> Alta subcategoría </a>
            <a href="../servlet_listadoCategorias" class="list-group-item list-group-item-action"> Listado / Modificación categorías </a>
            
            <% } %>

            <!-- Si se logea un usuario -->
            <% if (usuario != null && usuario.getId() != null) { %>

            <li href="#" class="list-group-item list-group-item-action active">
                Gestión pedidos
            </li>
            <a href="../servlet_listadoPedidosVivos?estado=0" class="list-group-item list-group-item-action"> Pedidos activos </a>
            <a href="../servlet_listadoPedidosVivos?estado=1" class="list-group-item list-group-item-action"> Historial de pedidos </a>

            <% }%>
        </div>
    </div>
</div>

