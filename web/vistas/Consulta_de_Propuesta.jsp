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
        <title>Consultar Propuesta</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css">
    </head>
    <body>
    <center>
        <h1>Consulta Propuesta</h1>     
        <table>
            <tr> 
                <th>
                    Titulo
                </th> 
            </tr>
            <%
                List<DtPropuesta> x = (List<DtPropuesta>) request.getAttribute("propuestas");
                for (DtPropuesta cx : x) {
                String Titu = cx.getTitulo().replace(" ", "-");
            %>
            <tr>
                <td>
                    <a href=Consulta_de_propuesta_Servlet?T=<%=Titu%>>
                        <%= cx.getTitulo()%> 
                    </a>
                </td>
            </tr>
            <%}%>
        </table>
    </center>
</body>
</html>
