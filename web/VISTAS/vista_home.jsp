<%-- 
    Document   : VistaHome
    Created on : 07-oct-2018, 8:56:17
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
