<%-- 
    Document   : vista_registroVendedor
    Created on : 26-nov-2018, 18:11:13
    Author     : Julian
--%>

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
                <div class="text-center col-6 offset-3">
                    <h1>Registro como Vendedor</h1>
                    <hr>
                </div>
                <div class="col-6 offset-3">
                    <div class="text-center">
                        <form action="../servlet_registroVendedor">
                            <h5>Nombre del Vendedor</h5>
                            <input type="text" class="form-control col-8 offset-2" name="nombreRegistro" required="">
                            <br>
                            <h5>NIF</h5>
                            <input type="text" class="form-control col-8 offset-2" name="nifRegistro" required="">
                            <br>
                            <h5>País</h5>
                            <input type="text" class="form-control col-8 offset-2" name="paisRegistro" required="">
                            <br>
                            <h5>Poblacion</h5>
                            <input type="text" class="form-control col-8 offset-2" name="poblacionRegistro" required="">
                            <br>
                            <h5>Dirección</h5>
                            <input type="text" class="form-control col-8 offset-2" name="direccionRegistro" required="">
                            <br>
                            <h5>Email</h5>
                            <input type="email" class="form-control col-8 offset-2" name="correoRegistro" required="">
                            <br>
                            <h5>Contraseña</h5>
                            <input type="password" class="form-control col-8 offset-2" name="claveRegistro" required="">
                            <br>
                            <button type="submit" class="btn btn-primary">Registro</button>
                            <br>
                            <br>
                        </form>
                    </div>
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

