<%-- 
    Document   : Consulta_de_Propuesta_por_Categoria
    Created on : 16/09/2018, 23:55:26
    Author     : matheo
--%>

<%@page import="java.util.Collection"%>
<%@page import="Logica.DtCategoria"%>

<%@page import="java.util.List"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/template/head.jsp" />
        <title>Consultar Propuesta</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    </head>
    <body>
        <jsp:include page="/template/header.jsp" />
    <center>
 <form id="msform">   
    <fieldset>
    <legend id="legendErr">Consulta de Propuestas</legend><br>
    <nav>
    <ul class="demo-list-icon mdl-list">
        <%
                Collection<DtCategoria> x = (Collection<DtCategoria>) request.getAttribute("categorias");
                for (DtCategoria cx : x) {
                    String h = cx.getNombre().replace(" ", "+");
            %>
    <li class="mdl-list__item">
    <span class="mdl-list__item-primary-content">
    <i class="material-icons mdl-list__item-icon">event</i>
    <a href= Consulta_de_Propuesta_por_Categoria?C=<%=h%> >
    <%=cx.getNombre()%> </a>
    </span>
    </li>
    <% } %>
    </ul>
    </nav>
    </fieldset>
 </form>
</center>
</body>
</html>
