<%-- 
    Document   : vista_altaSubcategoria
    Created on : 09-oct-2018, 21:39:09
    Author     : migue
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="POJO.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="vista_head.jsp"/>

        <title>Panel de control - Alta subcategoría </title>
    </head>
    <body>
        <header>
            <jsp:include page="vista_nav.jsp"/>
        </header>
        <% ArrayList<Categoria> arrayCategorias = (ArrayList) session.getAttribute("arrayCategorias"); %>
        <br/><br/><br/>
        <div class="row">
            <jsp:include page ="vista_navPanelControlVendedor.jsp"/>
            <div class="offset-md-1 col-md-5">
                <form method="post" accept-charset="utf-8" action="../servlet_altaSubCategoria">
                    <h3> Alta subcategoría </h3>
                    <br/>
                    <div class="form-group">
                        <label for="exampleFormControlInput1"> Nombre </label>
                        <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Articulo 1" name="nombreSubcat">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1"> Descripción </label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="2" name="descripcionSubcat"></textarea>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4"> Categoría padre </label>
                            <select class="form-control" name="categoriaPadre">
                                <% for (int i = 0; i < arrayCategorias.size(); i++) {%>
                                <option value="<%= arrayCategorias.get(i).getId()%>"> <%= arrayCategorias.get(i).getNombreCat()%></option>
                                <% }%>
                            </select>
                        </div>
                    </div>
                    <button class="btn btn-primary offset-md-4 col-md-4" type="submit"> Confirmar alta </button>
                </form>
            </div>
        </div>
        <br><br><br><br>
        <footer class="footer">
            <div class="container">
                <span class="text-muted">Artisan Beer. Tu artesana en casa. &copy;Copyright 2018</span>
            </div>
        </footer>
    </body>
</html>
