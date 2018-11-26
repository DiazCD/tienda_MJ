<%-- 
    Document   : vista_carrito
    Created on : 25-nov-2018, 11:34:33
    Author     : Julian
--%>

<%@page import="MODELO.ArticuloCantidad"%>
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

                <h1 class="text-center">Carrito</h1>
                <hr>

                <%
                    HttpSession ArraySession = request.getSession();
                    List<ArticuloCantidad> carrito = (List) ArraySession.getAttribute("carrito");

                    if (!carrito.isEmpty()) {

                        Iterator iter = carrito.iterator();
                        while (iter.hasNext()) {
                            ArticuloCantidad articulo = (ArticuloCantidad) iter.next();
                %>
                <div class="row col-12 mt-3 pt-3 fila border border-warning rounded">
                    <div class="col-1">
                        <img class="img-fluid" alt="Image" src="<% out.print(articulo.getArticulo().getImagenArt()); %>">
                        <br>
                        <br>
                    </div>
                    <div class="col-2">
                        <div class="row">
                            <h5><% out.print(articulo.getArticulo().getNombreArt()); %></h5>
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="row">
                            <p><% out.print("Precio/Unidad: " + articulo.getArticulo().getImporteArt()); %></p>
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="row">
                            <h6><% out.print("Total: " + articulo.getArticulo().getImporteArt() * articulo.getCantidad()); %></h6>
                        </div>
                    </div>
                    <div class="col-1 offset-1">
                        <div class="row">
                            <p><% out.print(articulo.getArticulo().getCantidadMaxArt() + " en stock"); %></p>
                        </div>
                    </div>
                    <div class="col-3">
                        <form action="../servlet_modificarCarrito">
                            <input type="hidden" name="idArticulo" value="<% out.print(articulo.getArticulo().getId()); %>">
                            <input type="number" name="cantidad" min="1" max="<% out.print(articulo.getArticulo().getCantidadMaxArt()); %>" class="form-control col-5" value="<% out.print(articulo.getCantidad()); %>" onchange="this.form.submit()"> 
                        </form>
                    </div>
                </div>
                <%
                    }
                %>
                <br>
                <br>
                <form action="vista_pago.jsp">
                    <button type="submit" class="btn btn-primary">Realizar el Pedido</button>
                </form>
                <%
                } else {
                %>
                <br>
                <br>
                <br>
                <h6 class="text-center">¡Todavía no has añadido ninguno de nuestros productos al carrito!</h6>
                <div class="text-center">
                        <a href="../servlet_catalogo">
                            <h6>Ir al Catálogo</h6>
                        </a>
                    </div>
                <%
                    }
                %>
            </section>
        </main>

        <footer class="footer">
            <div class="container">
                <span class="text-muted">Artisan Beer. Tu artesana en casa. &copy;Copyright 2018</span>
            </div>
        </footer>

    </body>
</html>
