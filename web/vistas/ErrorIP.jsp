<%-- 
    Document   : ErrorIP
    Created on : Nov 9, 2018, 2:10:40 PM
    Author     : Aeliner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="default_style" content=URL=/CulturarteWeb/vistas/ErrorIP.jsp">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error IP</title>
    </head>
    <body>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" type="text/css">
        <form id="msform" action="<%= request.getContextPath() %>/cerrarSesion" method="post">      
  <!-- fieldsets -->
  <fieldset>
    <legend id="legendErr">¡UPSS! Esto es incómodo.. :( </legend>      
    <h3 class="fs-subtitle">Hubo un problema accediendo al servidor central.</h3>
    <input type="submit" name="volver atrás" class="btn action-button" value="¡Lo entiendo!">
  </fieldset>
</form>   
    </body>
</html>
