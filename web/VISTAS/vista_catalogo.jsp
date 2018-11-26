<%-- 
    Document   : vista_catalogo
    Created on : 23-nov-2018, 0:02:14
    Author     : Julian
--%>

<%@page import="POJO.Categoria"%>
<%@page import="java.util.Iterator"%>
<%@page import="POJO.Articulo"%>
<%@page import="java.util.List"%>
<%@page import="POJO.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
                <h1 class="text-center">Catálogo Completo</h1>
                <hr>
                <%
                    HttpSession ArraySession = request.getSession(true);
                    List<Articulo> listaArticulos = (List) ArraySession.getAttribute("listaArticulosCatalogo");
                %>
                <div id="divCatalogo">
                    <%
                        Iterator iter = listaArticulos.iterator();
                        while (iter.hasNext()) {
                            Articulo articulo = (Articulo) iter.next();
                    %>
                    <div class="row col-12 mt-3 pt-3 fila border border-warning rounded">
                        <div class="col-3">
                            <img class="img-fluid" alt="Image" src="<% out.print(articulo.getImagenArt()); %>">
                            <br>
                            <br>
                        </div>
                        <div class="col-6">
                            <div class="row">
                                <h5><% out.print(articulo.getNombreArt()); %></h5>
                            </div>
                            <div>
                                <p><% out.print(articulo.getDescripcionArt()); %></p>
                            </div>
                        </div>
                        <div class="my-auto col-3">
                            <form action="../servlet_masInformacion">
                                <button type="submit" class="btn btn-warning col-12" name="inf" value="<% out.print(articulo.getId()); %>">Más Información</button>
                            </form>
                            <br>
                            <br>
                            <input type="hidden" id="cantidad" value="1">
                            <form action="../servlet_agregarArticuloCarrito">
                                <input type="hidden" name="cantidad" value="1">
                                <button type="submit" class="btn btn-warning col-12" name="add" value="<% out.print(articulo.getId()); %>">Añadir a la cesta</button>
                            </form>
                        </div>
                    </div>
                    <% }
                    %>

                </div>
            </section>
        </main>

        <footer class="footer">
            <div class="container">
                <span class="text-muted">Artisan Beer. Tu artesana en casa. ©Copyright 2018</span>
            </div>
        </footer>


    </body>
</html>
