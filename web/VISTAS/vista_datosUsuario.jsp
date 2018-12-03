<%-- 
    Document   : vista_datosUsuario
    Created on : 03-dic-2018, 19:03:47
    Author     : Julian
--%>

<%@page import="POJO.Usuario"%>
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
                <div class="text-center">
                    <h1>Datos de Usuario</h1>
                    <hr>
                </div>
                <%
                    HttpSession ArraySession = request.getSession();
                    Usuario usuario = (Usuario) ArraySession.getAttribute("usuarioLogueado");
                %>
                <div class="col-8 offset-2 row bg-white border border-warning rounded">
                    <br>
                    <br>
                    <div class="col-6">
                        <h5>Nombre: <% out.print(usuario.getNombreUsr()); %></h5>
                    </div>
                    <div class="col-6">
                        <h5> Apellidos: <% out.print(usuario.getApellidoUsr()); %></h5>
                    </div>
                    <br>
                    <br>
                    <br>
                    <div class="col-6">
                        <h5> Dni: <% out.print(usuario.getNifUsr()); %></h5>
                    </div>
                    <div class="col-6">
                        <h5>Fecha de Nacimiento: <% out.print(usuario.getFechaNacUsr()); %></h5>
                    </div>
                    <br>
                    <br>
                    <br>
                    <div class="col-6">
                        <h5> Fecha de Alta: <% out.print(usuario.getFechaAltaUsr()); %></h5>
                    </div>
                    <div class="col-6">
                        <h5> Email: <% out.print(usuario.getEmailUsr()); %></h5>
                    </div>
                    <br>
                    <br>
                    <br>
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

