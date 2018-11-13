<%-- 
    Document   : seguirUsuario
    Created on : 13/09/2018, 11:11:21 PM
    Author     : nambr
--%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seguir usuario</title>
    </head>
    <body>
         <select>
        <%
                String control = (String) request.getAttribute("paso");
                if(control == null){
                    %>
                    <jsp:forward page="ErrorJSP.jsp"/>
                    <% }%>
                <%
            if(request.getAttribute("usuarios")!=null){
                
           
        Collection<servicios.DtUsuario> usuarios= (Collection<servicios.DtUsuario>) request.getAttribute("usuarios");
        for(servicios.DtUsuario user: usuarios){
            int i=1;
            
       
        
        
        %>
        <option value="<%out.print(i);%>">  <% out.print(user.getNick()); %></option>
        <%  i++;} } %>
         </select>
    </body>
</html>
