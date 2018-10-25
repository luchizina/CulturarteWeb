<%-- 
    Document   : inicSesErr
    Created on : 16/09/2018, 03:05:54 PM
    Author     : nambr
--%>

<%@page import="Servlets.inicSesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/template/head.jsp" />
        <meta http-equiv="default_style" content=URL=/CulturarteWeb/vistas/inicSesErr.jsp">
        <title>Algo salió mal...</title>
    </head>
    <body>
  
 
 
 
        <jsp:include page="/template/header.jsp" />
      
         <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" type="text/css">
        <br><br><br><br><br><br><br>
 
        <form id="msform" action="<%= request.getContextPath() %>/vistas/subIndex.jsp" method="post">
             
  <!-- fieldsets -->
  <fieldset>
      <legend id="legendErr">¡Upss! Esto es incómodo</legend>
    <h2 class="fs-title">Error al iniciar sesión</h2>
    <h3 class="fs-subtitle">Las credenciales ingresadas son incorrectas, o ya hay una sesión abierta. Vuelva a chequear la información, o cierre la sesión y trate de iniciar sesión nuevamente</h3>
<input type="submit" name="volver atrás" class="next action-button" value="Entendido">
  
  </fieldset>
</form>    
    </body>
</html>
