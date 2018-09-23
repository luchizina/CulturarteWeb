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
        <form id="msform" action="../iniciarS" method="post">
            
  <!-- fieldsets -->
  <fieldset>
      <legend id="legendErr">¡UPSS! Esto es incómodo.. :( </legend>      
    <h3 class="fs-subtitle">Los datos que ha ingresado son incorrectos, o bien, ese título ya está en uso... Por favor revise.</h3>
<input type="button" onclick="history.back()"  name="volver atrás" class="next action-button" value="Ok,lo entiendo">
  
  </fieldset>
</form>    
    </body>
</html>
