<%-- 
    Document   : seguirUsuario
    Created on : 13/09/2018, 11:11:21 PM
    Author     : nambr
--%>
<%@page import="import Logica.DtUsuario"%>
<%@page import="import java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seguir usuario</title>
    </head>
    <body>
        
        <%
        List<DtUsuario> usuarios= (List<DtUsuario>) request.getAttribute("usuarios");
        for(DtUsuario user: usuarios){
            
       
        
        
        %>
        <h1>Hello World!<% user.getNick();  %></h1><br>
        
        
        <%  } %>
    </body>
</html>
