<%-- 
    Document   : inicSesErr
    Created on : 16/09/2018, 03:05:54 PM
    Author     : nambr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="default_style" content=URL=/CulturarteWeb/vistas/inicSesErr.jsp">
        <title>Pagina incorrecta</title>
    </head>
    <body>
         <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" type="text/css">
        <br><br><br><br><br><br><br>
        <form id="msform" action="<%= request.getContextPath() %>/index.html" method="post">      
  <!-- fieldsets -->
  <fieldset>
    <legend id="legendErr">¡UPSS! Esto es incómodo.. :( </legend>      
    <h3 class="fs-subtitle">Página no encontrada, o no tienes acceso a ella</h3>
    <input type="submit" name="volver atrás" class="btn action-button" value="¡Lo entiendo!">
  </fieldset>
</form>    
    </body>
</html>
