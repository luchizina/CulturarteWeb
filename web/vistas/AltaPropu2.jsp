<%-- 
    Document   : inicSesErr
    Created on : 16/09/2018, 03:05:54 PM
    Author     : nambr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/template/head.jsp" />
        <meta http-equiv="default_style" content=URL=/CulturarteWeb/vistas/inicSesErr.jsp">
        <title>Alta propuesta</title>
    </head>
    <body>
        <jsp:include page="/template/header.jsp" />
         <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" type="text/css">
        <br><br><br><br><br><br><br>
        <form id="msform" action="<%= request.getContextPath() %>/vistas/subIndex.jsp" method="post">
            
  <!-- fieldsets -->
  <fieldset>
    <h2 class="fs-title">¡Propuesta dada de alta!</h2>
    <h3 class="fs-subtitle">La propuesta ha sido ingresada correctamente</h3>
<input type="submit" name="volver atrás" class="btn action-button" value="¡Lo entiendo!">
  </fieldset>
</form>    
    </body>
</html>
