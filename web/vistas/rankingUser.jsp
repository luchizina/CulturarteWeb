<%-- 
    Document   : rankingUser
    Created on : 13/10/2018, 04:02:38 PM
    Author     : nambr
--%>

<%@page import="servicios.DtUsuario"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <script src="<%= request.getContextPath()%>/js/material.min.js"></script>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/material.indigo-pink.min.css">
        <!-- Material Design icon font -->
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/iconos.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ranking de usuarios</title>
        <jsp:include page="/template/head.jsp" />
    </head>
    <body>  
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css" type="text/css">
        <jsp:include page="/template/header.jsp" />
        <form id="msform" action="/CulturarteWeb/buscador" method="POST">
            <fieldset>
                <legend id="legendErr">ranking de usuarios</legend><br>
                    <input type="Search"  placeholder="   nick, correo" id="Buscador" name="buscaU">
                <nav>
                    
                    <ul class="demo-list-icon mdl-list">
                        <%  List<servicios.DtUsuario> usuariosU = (List<servicios.DtUsuario>) request.getAttribute("ranking");
                          if(usuariosU.size()>0){
                            for (servicios.DtUsuario user : usuariosU) {
                                String Titu = user.getNick().replace(" ", "-");
                                String completo = user.getNombre() + " " + user.getApellido() + " (" + user.getNick() + ")";

                        %>

                        <li class="mdl-list__item">
                            <span class="mdl-list__item-primary-content">
                                <i class="material-icons mdl-list__item-icon">person</i>
                                <a href=consultarPerfil?T=<%=Titu%>>
                                    <%= completo%> 
                                </a>
                            </span>
                        </li>
                        <%  }
                          } else {%>
                           <li class="mdl-list__item">
                            <span class="mdl-list__item-primary-content">
                                <i class="material-icons" >mood_bad</i>
                                <label> No hay ninguna coincidencia </label>
                            </span>
                        </li>
                           <%  }%>
                       
                    </ul>
                </nav>
     </fieldset>                  
   </form>
    </body>
</html>

