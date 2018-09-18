<%-- 
    Document   : Datos_prueba
    Created on : 18/09/2018, 15:47:30
    Author     : matheo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
    boolean Usuario_Logeado = false;
    if (request.getSession().getAttribute("sesionAct") != null) {
        Usuario_Logeado = true;
    }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos de prueba</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css">
    </head>
    <center>
    <% if(Usuario_Logeado == false) {%>
    <h1>quiere cargar los datos de prueba?</h1>
    <br>
    <form action="/Cargar_Datos_Web" >
        <button type="submit">Aceptar</button>
    </form>
    <br>
    <form action="../index.html">
        <button type="submit">Cancelar</button>
    </form>
    <%} else {%>
    <h1>Debe de cerrar la sesión para continuar</h1>
    <%}%>
    </center>
    </body>
</html>
