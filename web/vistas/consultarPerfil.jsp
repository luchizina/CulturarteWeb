<%-- 
    Document   : consultarPerfil
    Created on : 17/09/2018, 07:00:53 PM
    Author     : nambr
--%>

<%@page import="Logica.DtUsuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar perfil</title>
        
    </head>
    <body>  
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" type="text/css">
        <h1>Hello World!</h1>
    <center>
        
   
           <table>
            <tr> 
                <th>
                    Titulo
                </th> 
            </tr>
            <%
                List<DtUsuario> usuarios = (List<DtUsuario>) request.getAttribute("usuarios");
                for (DtUsuario user : usuarios) {
                String Titu = user.getNick().replace(" ", "-");
            %>
            <tr>
                <td>
                    <a href=Consulta_de_propuesta_Servlet?T=<%=Titu%>>
                        <%= user.getNick()%> 
                    </a>
                </td>
            </tr>
            <%}%>
        </table>
         </center>
    </body>
</html>
