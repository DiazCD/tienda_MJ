<%-- 
    Document   : vista_pedidosUsuario
    Created on : 26-nov-2018, 20:07:19
    Author     : Julian
--%>

<%@page import="POJO.Pedido"%>
<%@page import="POJO.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="vista_head.jsp"/>

        <title>Artisan Beer</title>
    </head>
    <body>
        <header>
            <jsp:include page="vista_nav.jsp"/>
        </header>

        <main role="main" class="container mt-5 pt-5" id="cuerpo">
            <section id="subCuerpo">
                <%
                    HttpSession ArraySession = request.getSession();
                    List<Pedido> listaPedidos = (List) ArraySession.getAttribute("listaPedidos");
                    Usuario usuario = (Usuario) ArraySession.getAttribute("usuarioLogueado");
                %>
                <h1 class="text-center">Pedidos de <% out.print(usuario.getNombreUsr()); %></h1>
                <hr>
                
                <div class="row col-12 mt-3 pt-3 fila border border-warning rounded">
                <%
                    Iterator iter = listaPedidos.iterator();
                    while (iter.hasNext()) {
                        Pedido pedido = (Pedido) iter.next();
                %>
                    <div class="col-4">
                        <div class="row">
                            <h5><% out.print(pedido.getId()); %></h5>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="row">
                            <p><% out.print("Realizado el " + pedido.getFechaPed()); %></p>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="row">
                            <p><% //out.print("Con tarjeta: " + pedido.getTarjeta().getNumeroTarj()); %></p>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </section>
        </main>

        <footer class="footer">
            <div class="container">
                <span class="text-muted">Artisan Beer. Tu artesana en casa. &copy;Copyright 2018</span>
            </div>
        </footer>

    </body>
</html>