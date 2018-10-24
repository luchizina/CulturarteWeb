<%-- 
    Document   : Consulta_de_Propuesta
    Created on : 13/09/2018, 02:22:46
    Author     : matheo
--%>

<%@page import="java.util.Collection"%>
<%@page import="Logica.DtPropuesta"%>
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
        <%   List<servicios.DtPropuesta> x = (List<servicios.DtPropuesta>) request.getAttribute("propuestas");
        if(x.size()>0){
                for (servicios.DtPropuesta cx : x) {
                    String h = cx.getTitulo().replace(" ", "+");
        %>
    <li class="mdl-list__item">
    <span class="mdl-list__item-primary-content">
    <i class="material-icons mdl-list__item-icon">event</i>
    <a href=Consulta_de_propuesta_Servlet?T=<%=h%> >
    <%=cx.getTitulo()%> </a>
    </span>
    </li>
    <% }
        } else{ %>
        <li class="mdl-list__item">
    <span class="mdl-list__item-primary-content">
    <i class="material-icons">error_outline </i>
    <label> No se encontró propuestas </label>
    <% } %>
    </span>
    </li>
    </ul>
    
    </nav>
    </fieldset>
 </form>
</center>
</body>
</html>
