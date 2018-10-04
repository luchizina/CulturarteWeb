<%-- 
    Document   : cerrSesErr
    Created on : 04/10/2018, 04:48:03 PM
    Author     : nambr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <jsp:include page="/template/head.jsp" />
        <title>Algo salió mal...</title>
    </head>
    <body>
         <jsp:include page="/template/header.jsp" />
      
         <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" type="text/css">
        <form id="msform" action="<%= request.getContextPath() %>/vistas/subIndex.jsp" method="post">
             
  <!-- fieldsets -->
  <fieldset>
      <legend id="legendErr">¡Upss! Esto es incómodo</legend>
    <h2 class="fs-title">Error al cerrar sesión</h2>
    <h3 class="fs-subtitle">No hay ninguna sesión abierta</h3>
<input type="submit" name="volver atrás" class="next action-button" value="Entendido">
  
  </fieldset>
</form>   
    </body>
</html>
