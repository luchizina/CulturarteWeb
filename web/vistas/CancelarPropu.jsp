<%-- 
    Document   : consultarPerfil
    Created on : 17/09/2018, 07:00:53 PM
    Author     : nambr
--%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
       <script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <!-- Material Design icon font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar perfil</title>
        <jsp:include page="/template/head.jsp" />
    </head>
    <body>  
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" type="text/css">
       <jsp:include page="/template/header.jsp" />
  
    <form id="msform">       
        <fieldset>
     <legend id="legendErr">Perfil de propuesta</legend><br>
     <nav>
 <ul class="demo-list-icon mdl-list">
        <%  List<DtPropuesta> prop = (List<DtPropuesta>) request.getAttribute("propuestas");
                for (DtPropuesta p : prop) {
                String Titu = p.getTitulo().replace(" ", "+");
        %>
  <li class="mdl-list__item">
    <span class="mdl-list__item-primary-content">
    <i class="material-icons mdl-list__item-icon">person</i>
  <a href=borrar_prop?T=<%=Titu%>> <%=Titu%>  </a>
</span>
  </li>
  <% } %>
     </fieldset>
</ul>
     </nav>
</form>
    </body>
</html>
