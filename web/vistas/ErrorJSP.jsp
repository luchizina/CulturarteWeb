<%-- 
    Document   : ErrorJSP
    Created on : 13/11/2018, 07:17:37 PM
    Author     : Nazareno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="default_style" content=URL=/CulturarteWeb/vistas/ErrorIP.jsp">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error JSP</title>
    </head>
    <body>
        <jsp:include page="/template/header.jsp" />
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" type="text/css">
        <form id="msform" action="<%= request.getContextPath() %>/vistas/subIndex.jsp" method="post">      
  <!-- fieldsets -->
  <fieldset>
    <legend id="legendErr">¡UPSS! Esto es incómodo.. :( </legend>      
    <h3 class="fs-subtitle">Hubo un problema accediendo al sitio deseado.</h3>
    <input type="submit" name="volver atrás" class="btn action-button" value="¡Lo entiendo!">
  </fieldset>
</form>   
    </body>
</html>

