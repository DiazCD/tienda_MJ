<%-- 
    Document   : vista_nav
    Created on : 06-nov-2018, 18:39:20
    Author     : Julian
--%>

<nav class="navbar navbar-expand-md fixed-top navbar-dark">
    <a class="navbar-brand ml-5" onclick="" href="#"><img id='logo'></img></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav ml-auto mr-5">
            <li class="nav-item">
                <a class="nav-link" href="../servlet_abrirHome">Inicio</a>
            </li>
            <li class="nav-item dropdown" id="parentDrop" value="0">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Catálogo</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="login" href="../servlet_abrirLogin">Login/Registro</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="carrito" href="#">Carrito 0</a>
            </li>
        </ul>
    </div>
</nav>
