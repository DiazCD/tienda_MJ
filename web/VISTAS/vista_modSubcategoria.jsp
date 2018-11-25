<%-- 
    Document   : vista_modSubcategoria
    Created on : 24-nov-2018, 13:05:48
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

        <title>Panel de control - Modificación subcategoría </title>
    </head>
    <body>
        <% ArrayList<Articulo> arrayArticulos = (ArrayList<Articulo>) session.getAttribute("arrayArticulos");%>
        <% ArrayList<Categoria> arrayCategorias = (ArrayList<Categoria>) session.getAttribute("arrayCategorias"); %>
        <% Subcategoria subcategoria = (Subcategoria) session.getAttribute("subcategoria");%>
        <br/>
        <div class="row">
            <jsp:include page ="vista_navPanelControlVendedor.jsp"/>
            <div class="offset-md-1 col-md-5">
                <form method="post" accept-charset="utf-8" action="../servlet_modSubcategoria">
                    <h3> Modificación subcategoría </h3>
                    <br/>
                    <div class="form-group">
                        <label for="exampleFormControlInput1"> Identificador </label>
                        <input type="text" class="form-control" id="exampleFormControlInput1" value="<%= subcategoria.getId()%>" name="idSubcat" readonly="true">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlInput1"> Nombre </label>
                        <input type="text" class="form-control" id="exampleFormControlInput1" value="<%= subcategoria.getNombreSubcat()%>" name="nombreSubcat">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1"> Descripción </label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="2" name="descripcionSubcat"><%= subcategoria.getDescripcionSubcat()%></textarea>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4"> Categoría padre </label>
                            <select class="form-control" name="categoriaPadre">
                                <option selected="selected" value="<%= subcategoria.getCategoria().getId()%>"> 
                                    * Actual * 
                                </option>
                                <% for (int i = 0; i < arrayCategorias.size(); i++) {%>
                                <option value="<%= arrayCategorias.get(i).getId()%>"> 
                                    <%= arrayCategorias.get(i).getNombreCat()%>
                                </option>
                                <% } %>
                            </select>
                        </div>
                    </div>

                    <% if (arrayArticulos.size() > 0) { %>
                    <div class="alert alert-warning" role="alert">
                        <strong>Atencion!</strong> Si elimina la subcategoria, también lo harán los articulos relacionados con ella. 
                    </div>
                    <% }%>
                    
                    <button class="btn btn-primary offset-md-4 col-md-2" type="submit"> Actualizar </button>
                    <a href=" <%= "../servlet_borrarSubcategoria?idSubcategoria=" + subcategoria.getId()%>" class="btn btn-danger col-md-2" type="submit"> Eliminar </a>
                </form>
            </div>
        </div>
    </body>
</html>
