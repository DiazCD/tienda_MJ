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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Panel de control - Alta articulo</title>
    </head>
    <body>
        <% Articulo articulo = (Articulo)session.getAttribute("articulo"); %>
        <% ArrayList<Categoria> arrayCategorias = (ArrayList) session.getAttribute("arrayCategorias"); %>
        <% ArrayList<Subcategoria> arraySubcategorias = (ArrayList) session.getAttribute("arraySubcategorias"); %>
        <br/>
        <div class="row">
            <jsp:include page ="vista_navPanelControlVendedor.jsp"/>
            <div class="offset-md-1 col-md-5">
                <form method="post" accept-charset="utf-8" action="../servlet_modArticulo">
                    <h3> Modificación artículo </h3>
                    <br/>
                    <div class="form-group">
                        <label for="exampleFormControlInput1"> Identtificador </label>
                        <input type="text" class="form-control" name="idArt" value="<%= articulo.getId() %>" readonly="true">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlInput1"> Nombre </label>
                        <input type="text" class="form-control" name="nombreArt" value="<%= articulo.getNombreArt() %>">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1"> Descripción </label>
                        <textarea type="text" class="form-control" name="descripcionArt" rows="2"><%= articulo.getDescripcionArt()%></textarea>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4"> Categoría </label>
                            <select class="form-control" name="categoriaArt">
                                <option value="<%= articulo.getCategoria().getId() %>" selected="selected">* Actual *</option>
                                <% for (int i=0 ; i<arrayCategorias.size() ; i++) {%>
                                <option value="<%= arrayCategorias.get(i).getId() %>"> <%= arrayCategorias.get(i).getNombreCat() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputEmail4"> Subcategoría </label>
                            <select class="form-control" name="subcategoriaArt">
                                <option value="<%= articulo.getSubcategoria().getId() %>" selected="selected">* Actual *</option>
                                <% for (int i=0 ; i<arraySubcategorias.size() ; i++) {%>
                                <option value="<%= arraySubcategorias.get(i).getId() %>"> <%= arraySubcategorias.get(i).getNombreSubcat() %></option>
                                <% } %>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-3">
                            <label for="inputZip"> Importe </label>
                            <input type="text" class="form-control" value="<%= articulo.getImporteArt() %>" name="importeArt">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="inputZip"> Importe a recibir </label>
                            <input type="text" class="form-control" placeholder="0.00€" id="importeRec" readonly>
                        </div>
                        <div class="form-group offset-md-3 col-md-3">
                            <label for="inputZip"> Cantidad </label>
                            <input type="text" class="form-control" name="cantidadArt" value="<%= articulo.getCantidadMaxArt() %>">
                        </div>
                    </div>
                    <button class="btn btn-primary offset-md-4 col-md-2" type="submit"> Actualizar </button>
                    <a href=" <%= "../servlet_borrarArticulo?idArticulo=" + articulo.getId()%>" class="btn btn-danger col-md-2" type="submit"> Eliminar </a>
                </form>
            </div>
        </div>
    </body>
</html>
