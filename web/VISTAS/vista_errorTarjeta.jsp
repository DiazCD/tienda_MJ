<%-- 
    Document   : vista_errorTarjeta
    Created on : 26-nov-2018, 19:19:24
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
                <h2 class="text-center">La tarjeta introducida no es valida</h2>
                <br>
                <br>
                <br>
                <div class="text-center">
                        <a href="vista_pago.jsp">
                            <h6>Volver</h6>
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
