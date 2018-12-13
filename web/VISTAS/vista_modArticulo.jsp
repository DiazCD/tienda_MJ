<%-- 
    Document   : vista_modArticulo
    Created on : 24-nov-2018, 19:13:12
    Author     : magm
--%>

<%@page import="POJO.Articulo"%>
<%@page import="POJO.Subcategoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="POJO.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="vista_head.jsp"/>

        <title>Panel de control - Alta articulo</title>
    </head>
    <body>
        <header>
            <jsp:include page="vista_nav.jsp"/>
        </header>
        <% Articulo articulo = (Articulo) session.getAttribute("articulo"); %>
        <% ArrayList<Categoria> arrayCategorias = (ArrayList) session.getAttribute("arrayCategorias"); %>
        <% ArrayList<Subcategoria> arraySubcategorias = (ArrayList) session.getAttribute("arraySubcategorias");%>
        <br/><br/><br/>
        <main role="main">
            <seccion>
                <div class="row">
                    <jsp:include page ="vista_navPanelControlVendedor.jsp"/>
                    <div class="offset-md-1 col-md-5">
                        <form method="post" accept-charset="utf-8" action="../servlet_modArticulo">
                            <h3> Modificación artículo </h3>
                            <br/>
                            <div class="form-group">
                                <label for="exampleFormControlInput1"> Identtificador </label>
                                <input type="text" class="form-control" name="idArt" value="<%= articulo.getId()%>" readonly="true">
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlInput1"> Nombre </label>
                                <input type="text" class="form-control" name="nombreArt" value="<%= articulo.getNombreArt()%>">
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlTextarea1"> Descripción </label>
                                <textarea type="text" class="form-control" name="descripcionArt" rows="2"><%= articulo.getDescripcionArt()%></textarea>
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlFile1"> Selecionar imagen</label>
                                <input type="file" class="form-control-file" name="imgArt" src="<%= articulo.getImagenArt()%>">
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4"> Categoría </label>
                                    <select class="form-control" name="categoriaArt">
                                        <option value="<%= articulo.getCategoria().getId()%>" selected="selected">* Actual *</option>
                                        <% for (int i = 0; i < arrayCategorias.size(); i++) {%>
                                        <option value="<%= arrayCategorias.get(i).getId()%>"> <%= arrayCategorias.get(i).getNombreCat()%></option>
                                        <% }%>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4"> Subcategoría </label>
                                    <select class="form-control" name="subcategoriaArt">
                                        <option value="<%= articulo.getSubcategoria().getId()%>" selected="selected">* Actual *</option>
                                        <% for (int i = 0; i < arraySubcategorias.size(); i++) {%>
                                        <option value="<%= arraySubcategorias.get(i).getId()%>"> <%= arraySubcategorias.get(i).getNombreSubcat()%></option>
                                        <% }%>
                                    </select>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label for="inputZip"> Importe </label>
                                    <input type="text" class="form-control" value="<%= articulo.getImporteArt()%>" name="importeArt">
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="inputZip"> Importe a recibir </label>
                                    <input type="text" class="form-control" placeholder="0.00€" id="importeRec" readonly>
                                </div>
                                <div class="form-group offset-md-3 col-md-3">
                                    <label for="inputZip"> Cantidad </label>
                                    <input type="text" class="form-control" name="cantidadArt" value="<%= articulo.getCantidadMaxArt()%>">
                                </div>
                            </div>
                            <button class="btn btn-primary offset-md-4 col-md-2" type="submit"> Actualizar </button>
                            <a href=" <%= "../servlet_borrarArticulo?idArticulo=" + articulo.getId()%>" class="btn btn-danger col-md-2" type="submit"> Eliminar </a>
                        </form>
                    </div>
                </div>
            </seccion>
        </main>
                        <br><br><br>
        <footer class="footer">
            <div class="container">
                <span class="text-muted">Artisan Beer. Tu artesana en casa. &copy;Copyright 2018</span>
            </div>
        </footer>
    </body>
</html>
