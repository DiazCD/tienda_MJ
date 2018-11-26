<%-- 
    Document   : vista_errorDni
    Created on : 26-nov-2018, 18:42:12
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
                <h2 class="text-center">El DNI que has introducido no es valido</h2>
                <br>
                <br>
                <br>
                <div class="text-center">
                        <a href="vista_login.jsp">
                            <h6>Ir a Login/Registro</h6>
                        </a>
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
