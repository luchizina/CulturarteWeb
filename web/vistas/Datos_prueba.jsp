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
        <title>Cargar datos de prueba</title>
    </head>
    <body>
        <jsp:include page="/template/header.jsp" />
         <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" type="text/css">
        <br><br><br><br><br><br><br>
         <%
        boolean Usuario_Logeado = false;
        if (request.getSession().getAttribute("sesionAct") != null) {
            Usuario_Logeado = true;
        }
    %>
    <% if (Usuario_Logeado == false) {%>
    <form id="msform" action="Cargar_Datos_Web" method="post">      
        <!-- fieldsets -->
        <fieldset>
            <legend id="legendErr"> ¿Desea cargar los datos de prueba? </legend>  
           
            <button type="submit" class="btn action-button">Sí, quiero</button>
            <button type="button" onclick="location.href = '/CulturarteWeb/home'" class="btn action-button">No, gracias</button>
        </fieldset>
    </form>    
    <%} else {%>
      <form action="index.html" id="msform">
         <legend id="legendErr">¡UPSS! Esto es incómodo.. :( </legend> 
         <div style="background: floralwhite">
         <h3 class="fs-title">Debe cerrar sesión para poder utilizar esta funcionalidad</h3> 
        <button type="button" onclick="location.href = '/CulturarteWeb/home'" class="btn action-button">Lo entiendo</button>
        </div>
    </form>
    <%}%>

    </body>
</html>
