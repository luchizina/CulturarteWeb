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
           <table>
            <tr> 
                <th>
                    Titulo
                </th> 
            </tr>
            <%
                List<DtUsuario> x = (List<DtUsuario>) request.getAttribute("propuestas");
                for (DtUsuario cx : x) {
                String Titu = cx.getNick().replace(" ", "-");
            %>
            <tr>
                <td>
                    <a href=Consulta_de_propuesta_Servlet?T=<%=Titu%>>
                        <%= cx.getNick()%> 
                    </a>
                </td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
