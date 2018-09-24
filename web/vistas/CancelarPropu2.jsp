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
        <form id="msform" action="<%= request.getContextPath() %>/borrar_prop?T="<%out.print((String) request.getAttribute("propuesta")); %> method="post">
            
  <!-- fieldsets -->
  <fieldset>
      <h3 class="fs-title">¿Desea eliminar la propuesta: <%out.print((String) request.getAttribute("propuesta")); %>? </h3>      
    <h3 class="fs-subtitle">Ojaio con lo que elegís...</h3>
<input type="button" onclick="history.back()"  name="volver atrás" class="next action-button" value="NO! No quiero">
  <input type="submit"  name="ok" class="next action-button" value="Ok,lo entiendo">
  
  </fieldset>
</form>    
    </body>
</html>
