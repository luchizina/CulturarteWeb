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
        <title>Alta propuesta</title>
    </head>
    <body>
         <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" type="text/css">
        <br><br><br><br><br><br><br>
        <form id="msform" action="../iniciarS" method="post">
            
  <!-- fieldsets -->
  <fieldset>
    <h2 class="fs-title">¡Propuesta dada de alta!</h2>
    <h3 class="fs-subtitle">La propuesta ha sido ingresada correctamente, ¿Qué desea hacer?</h3>
<input type="button" href="../vistas/subIndex.jsp" name="volver atrás" class="next action-button" value="Nada">
  
  </fieldset>
</form>    
    </body>
</html>
