<%-- 
    Document   : vista_masInformacion
    Created on : 25-nov-2018, 22:04:41
    Author     : Julian
--%>

<%@page import="POJO.Comentario"%>
<%@page import="POJO.Usuario"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="POJO.Articulo"%>
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
                    Articulo articulo = (Articulo) ArraySession.getAttribute("articuloInfo");
                    List<Comentario> listaComentarios = (List<Comentario>) ArraySession.getAttribute("comentariosInfo");
                %>
                <div>
                    <h2><% out.print(articulo.getNombreArt()); %></h2>
                </div>
                <div class="row">
                    <div class="col-3">
                        <img class="img-fluid rounded border border-warning" alt="Image" src="<% out.print(articulo.getImagenArt()); %>">
                    </div>
                    <div class="col-6">
                        <p><% out.print(articulo.getDescripcionArt()); %></p>
                    </div>
                    <div class="col-2">
                        <form action="../servlet_agregarArticuloCarrito" name="formularioCompra">
                            <h6>Precio: <% out.print(articulo.getImporteArt()); %>€/u</h6>
                            <br>
                            <h6 class="text-muted"><% out.print(articulo.getCantidadMaxArt()); %> unidades en stock</h6>
                            <br>
                            <div class="row">
                                <label class="col-5" for="cantidad">Cantidad: </label>
                                <input type="number" name="cantidad" min="1" max="<% out.print(articulo.getCantidadMaxArt()); %>" value="1" class="col-5 rounded border-warning offset-1">
                            </div>
                            <br>
                            <button type="submit" class="btn btn-warning" name="add" value="<% out.print(articulo.getId()); %>"
                                    <%
                                        Usuario usr = (Usuario) ArraySession.getAttribute("usuarioLogueado");
                                        if (usr.getId() == null) {

                                            out.print("disabled");
                                        }
                                    %>
                                    >Añadir a la cesta</button>
                        </form>
                    </div>
                </div>
                <div class="mt-5 pt-5">
                    <hr>
                    <div class="row">
                        <h3 class="col-4">Color</h3>
                        <h6 class="col-4 offset-4"><% out.print(articulo.getCategoria().getNombreCat()); %></h6>
                        <p class="col-4 offset-8"><% out.print(articulo.getCategoria().getDescripcionCat()); %></p>
                    </div>
                    <hr>
                    <div class="row">
                        <h3 class="col-4">Fermentación</h3>
                        <h6 class="col-4 offset-4"><% out.print(articulo.getSubcategoria().getNombreSubcat()); %></h6>
                    </div>
                    <hr>
                    <div class="row">
                        <h3 class="col-4">Vendedor</h3>
                        <h6 class="col-4 offset-4"><% out.print(articulo.getVendedor().getNombreVend());%></h6>
                    </div>
                </div>
                <hr>
                <div class="mt-5 pt-5"> 
                    <form action="../servlet_comentar">
                        <div class="row">
                            <textarea name="comentario" rows="5" class="form-control col-7" placeholder="Comentario" required></textarea>
                            <div class="form-group offset-1 col-2">
                                <select class="form-control" name="nota" required>
                                    <option value="" disabled selected>Valoración</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-warning col-1 offset-1 h-50"
                                    <%
                                        if (usr.getId() == null) {
                                            out.print("disabled");
                                        }
                                    %>
                                    >Comentar</button>
                        </div>
                    </form>
                    <br>
                    <br>
                    <br>
                </div>
                <h3>Comentarios</h3>
                <%
                    Iterator iter = listaComentarios.iterator();
                    while (iter.hasNext()) {
                        Comentario comentario = (Comentario) iter.next();
                %>
                <hr>
                <div class="row fila border border-warning rounded">
                    <div class="col-3">
                        <h6><% out.print(comentario.getUsuario().getNombreUsr() + " " + comentario.getUsuario().getApellidoUsr()); %></h6>
                        <p><% out.print("Valoración: " + comentario.getValoracionCom()); %></p>
                    </div>
                    <div class="col-9">
                        <p><% out.print(comentario.getDescripcionCom());%></p>
                    </div>
                </div>
                <%
                    }
                    if (listaComentarios.isEmpty()) {
                %>
                <br>
                <br>
                <p>No hay ningún comentario todavía. ¡Se el primero!</p>
                <br>
                <br>
                <%
                    }
                %>

                <hr>

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
