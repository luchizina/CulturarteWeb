<%-- 
    Document   : consultarPerfil
    Created on : 17/09/2018, 07:00:53 PM
    Author     : nambr
--%>

<%@page import="java.util.Collections"%>
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
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css" type="text/css">
        <jsp:include page="/template/header.jsp" />
        
         <div style="float:right">                                
            <form id="pa" class="msform" action="<%=request.getContextPath()%>/rankingUser" method="post">
                <fieldset>
                    <button type="submit" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                        <i class="material-icons">star</i>
                    </button>  
                    <button type="submit" class="mdl-button mdl-js-button mdl-button--accent">
                       Ranking de usuarios
                    </button>  
                </fieldset>
            </form>

            <form id="msform" style="clear: both">


            </form>
        </div>  
        
        
        
        
        
        <form id="msform" action="/CulturarteWeb/buscador" method="POST">
            <fieldset>
                <legend id="legendErr">Perfil de usuarios</legend><br>
                    <input type="Search"  placeholder="   nick, correo" id="Buscador" name="buscaU">
                <nav>
                    
                    <ul class="demo-list-icon mdl-list">
                        <%  List<servicios.DtUsuario> usuariosU = (List<servicios.DtUsuario>) request.getAttribute("usuarios");
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
