<%-- 
    Document   : VistaHome
    Created on : 07-oct-2018, 8:56:17
    Author     : Julian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
                <div class="carousel slide" id="carouselExampleControls" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block img-fluid rounded w-100 h-50" src="images/car1.jpg" alt="First slide">
                            <div class="carousel-caption d-none d-md-block bg-secondary rounded fondoTranslucido">
                                <h5>Bienvenido a ArtisanBeer</h5>
                                <p>ArtisanBeer es tu web de compra de cervezas artesanales. Ya seas un bebedor de cerveza o un productor, este es tu sitio</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="d-block img-fluid rounded w-100 h-50" src="images/car2.jpg" alt="Second slide">
                            <div class="carousel-caption d-none d-md-block bg-secondary rounded fondoTranslucido">
                                <h5>¿Qué ofrecemos?</h5>
                                <p>ArtisanBeer ofrece la mayor variedad de cervezas artesanas al mejor precio</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="d-block img-fluid rounded w-100 h-50" src="images/car3.jpg" alt="Third slide">
                            <div class="carousel-caption d-none d-md-block bg-secondary rounded fondoTranslucido">
                                <h5>Con quien quieras, donde quieras</h5>
                                <p>ArtisanBeer ofrece servicio de entrega a domicilio para que no tengas que preocuparte en que lugar disfrutar de tu artesana</p>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <div class="row col-12 mt-5 pt-5">
                    <div class="col-4">
                        <a href="#">
                            <img class="img-fluid rounded" alt="Image Enlace 1" src="images/catalogo.jpg" onclick="" id="0">
                        </a>
                        <p class="font-weight-bold text-center">Catálogo</p>
                    </div>
                    <div class="col-4">
                        <a href="#">
                            <img class="img-fluid rounded" alt="Image Enlace 1" src="images/categorias.jpg" onclick="">
                        </a>
                        <p class="font-weight-bold text-center">Categorías</p>
                    </div>
                    <div class="col-4">
                        <a href="#">
                            <img class="img-fluid rounded" alt="Image Enlace 1" src="images/sobreNosotros.jpg" onclick="" id="1">
                        </a>
                        <p class="font-weight-bold text-center">Sobre Nosotros</p>
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
