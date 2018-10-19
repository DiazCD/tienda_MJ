<%-- 
    Document   : vista_login
    Created on : 19-oct-2018, 9:21:20
    Author     : Julian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"><head>
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
        <script src="js/function.js"></script>

        <title>Artisan Beer</title>
    </head>
    <body>

        <header>
            <nav class="navbar navbar-expand-md fixed-top navbar-dark">
                <a class="navbar-brand ml-5" onclick="" href="#"><img id='logo'></img></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav ml-auto mr-5">
                        <li class="nav-item">
                            <a class="nav-link" onclick="" href="#">Inicio</a>
                        </li>
                        <li class="nav-item dropdown" id="parentDrop" value="0">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Catálogo</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="login" href="#" onclick="">Login/Registro</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="carrito" href="#" onclick="">Carrito 0</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <main role="main" class="container mt-5 pt-5" id="cuerpo">	
            <section id="subCuerpo">
                <div class="text-center col-6 offset-3">
                    <h1>Identificación</h1>
                </div>
                <br>
                <ul class="nav nav-pills nav-fill">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="mostrarRegistro()">Registro</a>
                    </li>
                </ul>
                <br>
                <div>
                    <div class="col-6 offset-3">
                        <div class="text-center">
                            <br>
                            <br>
                            <br>
                            <h5>DNI</h5>
                            <input type="text" class="form-control col-8 offset-2" id="dniIdentificacion">
                            <br>
                            <br>
                            <br>
                            <h5>Clave</h5>
                            <input type="password" class="form-control col-8 offset-2" id="claveIdentificacion">
                            <br>
                            <br>
                            <br>
                            <button type="button" class="btn btn-warning" onclick="buscarUsuario()">Identifícate</button>
                        </div>
                    </div>
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
