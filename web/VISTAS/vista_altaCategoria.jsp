<%-- 
    Document   : vista_altaCategoria
    Created on : 09-oct-2018, 21:28:57
    Author     : migue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="vista_head.jsp"/>

        <title>Panel de control - Alta categoría</title>
    </head>
    <body>
        <br/>
        <div class="row">
            <jsp:include page ="vista_navPanelControlVendedor.jsp"/>
            <div class="offset-md-1 col-md-5">
                <form method="post" accept-charset="utf-8" action="../servlet_altaCategoria">
                    <h3> Alta categoría </h3>
                    <br/>
                    <div class="form-group">
                        <label for="exampleFormControlInput1"> Nombre </label>
                        <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Articulo 1" name="nombreCat">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1"> Descripción </label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="2" name="descripcionCat"></textarea>
                    </div>
                    
                    <button class="btn btn-primary offset-md-4 col-md-4" type="submit"> Confirmar alta </button>
                </form>
            </div>
        </div>
    </body>
</html>
