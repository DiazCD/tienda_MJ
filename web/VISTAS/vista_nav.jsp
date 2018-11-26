<%-- 
    Document   : vista_nav
    Created on : 06-nov-2018, 18:39:20
    Author     : Julian
--%>

<%@page import="POJO.Vendedor"%>
<%@page import="POJO.Usuario"%>
<nav class="navbar navbar-expand-md fixed-top navbar-dark">
    <%
        HttpSession ArraySession = request.getSession(true);
        Usuario usr = (Usuario) ArraySession.getAttribute("usuarioLogueado");
        Vendedor vend = (Vendedor) ArraySession.getAttribute("vendedorLogueado");
    %>
    <a class="navbar-brand ml-5" onclick="" href="#"><img id='logo'></img></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav ml-auto mr-5">
            <li class="nav-item">
                <a class="nav-link" href="vista_home.jsp">Inicio</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../servlet_catalogo">Catálogo</a>
            </li>
            <%
                if (usr.getNifUsr() == null && vend.getNifVend() == null) {
            %>
            <li class="nav-item">
                <a class="nav-link" id="login" href="../servlet_abrirLogin">Login/Registro</a>
            </li>
            <%  } else if (!(usr.getNifUsr() == null)) {
            %>
            <li class="nav-item dropdown" id="Usuario" value="0">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" href="#">Hola <% out.print(usr.getNombreUsr()); %></a>
                <div class="dropdown-menu" aria-labelledby="Usuario">
                    <a class="dropdown-item" href="#">Mis Datos</a>
                    <a class="dropdown-item" href="vista_carrito.jsp">Carrito</a>
                    <a class="dropdown-item" href="../servlet_listadoPedidosUsuario">Mis Pedidos</a>
                    <a class="dropdown-item" href="../servlet_abrirHome">Cerrar Sesión</a>
                </div>
            </li>
            <%
            } else {

            %>
            <li class="nav-item dropdown" id="Usuario" value="0">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" href="#">Hola <% out.print(vend.getNombreVend()); %></a>
                <div class="dropdown-menu" aria-labelledby="Usuario">
                    <a class="dropdown-item" href="../servlet_panelControlVendedor">Mi Panel de Control</a>
                    <a class="dropdown-item" href="#">Mis Articulos</a>
                    <a class="dropdown-item" href="../servlet_abrirHome">Cerrar Sesión</a>
                </div>
            </li>
            <%

                }
            %>
        </ul>
    </div>
</nav>
