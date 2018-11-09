<%-- 
    Document   : Consulta_de_Propuesta_por_Categoria
    Created on : 16/09/2018, 23:55:26
    Author     : matheo
--%>

<%@page import="java.util.Collection"%>

<%@page import="java.util.List"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/template/head.jsp" />
        <title>Consultar Propuesta</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/iconos.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/material.indigo-pink.min.css">
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
                String control = (String) request.getAttribute("paso");
                if(control == null){
                    %>
                    <jsp:forward page="ErrorIP.jsp"/>
                    <% }%>
                <%
                Collection<servicios.DtCategoria> x = (Collection<servicios.DtCategoria>) request.getAttribute("categorias");
                if(x.size() > 0)
                {
                for (servicios.DtCategoria cx : x) {
                    String h = cx.getNombre().replace(" ", "+");
            %>
    <li class="mdl-list__item">
    <span class="mdl-list__item-primary-content">
    <i class="material-icons mdl-list__item-icon">event</i>
    <a href= Consulta_de_Propuesta_por_Categoria?C=<%=h%> >
    <%=cx.getNombre()%> </a>
    </span>
    </li>
    <% }
       }%>
    </ul>
    </nav>
    </fieldset>
 </form>
</center>
</body>
</html>
