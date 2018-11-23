<%-- 
    Document   : vista_error
    Created on : 23-nov-2018, 0:29:13
    Author     : migue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String error = (String) session.getAttribute("error");%>
        <h1>Error</h1>
        
        <p> Se ha producido un error: <%=error %> </p>
    </body>
</html>
