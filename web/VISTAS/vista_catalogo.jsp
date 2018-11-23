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
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" crossorigin="anonymous">

        <!-- All CSS -->
        <link href="css/style.css" rel="stylesheet">

        <!-- Optional JavaScript -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" crossorigin="anonymous"></script>

        <!--Funciones para DOM-->

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
                    HttpSession arraySession = request.getSession(true);
                    List<Articulo> listaArticulos = (List) arraySession.getAttribute("listaArticulosCatalogo");
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
                            <button type="button" class="btn btn-warning col-12" id="0" onclick="#">Más Información</button>
                            <br>
                            <br>
                            <input type="hidden" id="cantidad" value="1">
                            <button type="button" class="btn btn-warning col-12" id="0" onclick="#">Añadir a la cesta</button>
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
