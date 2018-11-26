<%-- 
    Document   : VistaHome
    Created on : 07-oct-2018, 8:56:17
    Author     : Julian
--%>

<%@page import="MODELO.ArticuloCantidad"%>
<%@page import="POJO.Usuario"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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
                <form action="../servlet_realizarPedido">
                    <div class="row">
                        <div class="container col-md-6">
                            <div class="well well-sm">
                                <fieldset>
                                    <legend class="text-center header">Datos Cliente</legend>

                                    <%
                                        HttpSession ArraySession = request.getSession();
                                        Usuario usuario = (Usuario) ArraySession.getAttribute("usuarioLogueado");
                                    %>
                                    <div class="form-group">
                                        <span class="col-md-1 col-md-offset-2 text-center"></span>
                                        <div class="col-md-12">
                                            <input id="nombre" name="nombre" type="text" value="<% out.print(usuario.getNombreUsr()); %>" class="form-control" disabled>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <span class="col-md-1 col-md-offset-2 text-center"></span>
                                        <div class="col-md-12">
                                            <input id="apellidos" name="apellidos" type="text" value="<% out.print(usuario.getApellidoUsr()); %>" class="form-control" disabled>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <span class="col-md-1 col-md-offset-2 text-center"></span>
                                        <div class="col-md-12">
                                            <input id="nif" name="nif" type="text" value="<% out.print(usuario.getNifUsr()); %>" class="form-control" disabled>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <span class="col-md-1 col-md-offset-2 text-center"></span>
                                        <div class="col-md-12">
                                            <input id="email" name="email" type="email" placeholder="Email" value="<% out.print(usuario.getEmailUsr()); %>" class="form-control" disabled>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <span class="col-md-1 col-md-offset-2 text-center"></span>
                                        <div class="col-md-12">
                                            <input id="domicilio" name="direccion" type="text" placeholder="Dirección" class="form-control" required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <span class="col-md-1 col-md-offset-2 text-center"></span>
                                        <div class="col-md-12">
                                            <input id="poblacion" name="poblacion" type="text" placeholder="Población" class="form-control" required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <span class="col-md-1 col-md-offset-2 text-center"></span>
                                        <div class="col-md-12">
                                            <input id="pais" name="pais" type="text" placeholder="País" class="form-control" required>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                        </div>

                        <div class="panel panel-default credit-card-div col-md-5" >
                            <div class="panel-heading">

                                <legend class="text-center header">Datos Tarjeta</legend>
                                <p>Se acepta: Visa, American Express, Master Card y Discover</p>
                                <div class="row">
                                    <div class="col-md-12">
                                        <input type="text" id="nTarjeta" name="nTarjeta" class="form-control" placeholder="Numero de la Tarjera de Crédito" pattern=".{16,16}" required title="Introduce 16 dígitos"/>
                                    </div>
                                </div>
                                <span class="col-md-1 col-md-offset-2 text-center"></span>
                                <div class="row ">
                                    <div class="col-md-3 col-sm-3 col-xs-3">
                                        <span class="help-block text-muted small-font" >  Mes Caducidad</span>
                                        <input type="number" id="mes" name="mes" class="form-control" placeholder="MM" min="1" max="12" required/>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-3">
                                        <span class="help-block text-muted small-font" >  Año Caducidad</span>
                                        <input type="number" id="anno" name="anno" class="form-control" placeholder="YY" min="18" max="99" required/>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-3">
                                        <span class="help-block text-muted small-font" >  CCV</span>
                                        <input type="text" id="cvv" name="cvv" class="form-control" placeholder="CCV" pattern=".{3,3}" required title="Introduce 3 dígitos"/>
                                    </div>
                                    <div class="col-md-2 col-sm-2 col-xs-2">
                                        <img src="images/icono_tarjeta.png" class="img-rounded img-fluid" />
                                    </div>
                                </div>
                                <div class="row ">
                                    <div class="col-8 offset-4">
                                        <%
                                            List<ArticuloCantidad> carrito = (List) ArraySession.getAttribute("carrito");

                                            float total = 0;
                                            Iterator iter = carrito.iterator();
                                            while (iter.hasNext()) {
                                                ArticuloCantidad articulo = (ArticuloCantidad) iter.next();
                                        %>
                                        <p><% out.print(articulo.getCantidad() + " " + articulo.getArticulo().getNombreArt() + "=" + articulo.getArticulo().getImporteArt() * articulo.getCantidad() + "€"); %></p>
                                        <%
                                                total += articulo.getArticulo().getImporteArt() * articulo.getCantidad();
                                            }
                                        %>
                                        <h4>Total: <% out.print(total + "€");%></h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row ">
                        <div class="col-md-5 col-sm-5 col-xs-5 offset-7 pad-adjust">
                            <input type="submit"  class="btn btn-primary btn-block" value="PAGAR" />
                        </div>
                    </div>
                </form>
            </section>
        </main>

        <footer class="footer">
            <div class="container">
                <span class="text-muted">Artisan Beer. Tu artesana en casa. &copy;Copyright 2018</span>
            </div>
        </footer>

    </body>
</html>
