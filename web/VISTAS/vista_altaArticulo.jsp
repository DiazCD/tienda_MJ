<%-- 
    Document   : vista_altaArticulo
    Created on : 09-oct-2018, 20:31:22
    Author     : migue
--%>

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
        <% ArrayList<Categoria> arrayCategorias = (ArrayList) session.getAttribute("arrayCategorias"); %>
        <% ArrayList<Subcategoria> arraySubcategorias = (ArrayList) session.getAttribute("arraySubcategorias"); %>
        <br/>
        <div class="row">
            <jsp:include page ="vista_navPanelControlVendedor.jsp"/>
            <div class="offset-md-1 col-md-5">
                <form method="post" accept-charset="utf-8" action="../servlet_altaArticulo">
                    <h3> Alta artículo </h3>
                    <br/>
                    <div class="form-group">
                        <label for="exampleFormControlInput1"> Nombre </label>
                        <input type="text" class="form-control" name="nombreArt" placeholder="Articulo 1">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1"> Descripción </label>
                        <textarea type="text" class="form-control" name="descripcionArt" rows="2"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlFile1"> Selecionar imagen</label>
                        <input type="file" class="form-control-file" name="imgArt">
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4"> Categoría </label>
                            <select class="form-control" name="categoriaArt">
                                <% for (int i = 0; i < arrayCategorias.size(); i++) {%>
                                <option value="<%= arrayCategorias.get(i).getId()%>"> <%= arrayCategorias.get(i).getNombreCat()%></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputEmail4"> Subcategoría </label>
                            <select class="form-control" name="subcategoriaArt">
                                <% for (int i = 0; i < arraySubcategorias.size(); i++) {%>
                                <option value="<%= arraySubcategorias.get(i).getId()%>"> <%= arraySubcategorias.get(i).getNombreSubcat()%></option>
                                <% }%>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-3">
                            <label for="inputZip"> Importe </label>
                            <input type="text" class="form-control" placeholder="0.00€" name="importeArt">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="inputZip"> Importe a recibir </label>
                            <input type="text" class="form-control" placeholder="0.00€" id="importeRec" readonly>
                        </div>
                        <div class="form-group offset-md-3 col-md-3">
                            <label for="inputZip"> Cantidad </label>
                            <input type="text" class="form-control" name="cantidadArt">
                        </div>
                    </div>
                    <button class="btn btn-primary offset-md-4 col-md-4" type="submit"> Confirmar alta </button>
                </form>
            </div>
        </div>
    </body>
</html>
