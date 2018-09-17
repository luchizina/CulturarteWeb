<%-- 
    Document   : Consulta_de_Propuesta_por_Categoria
    Created on : 16/09/2018, 23:55:26
    Author     : matheo
--%>

<%@page import="java.util.Collection"%>
<%@page import="Logica.DtCategoria"%>

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
                Collection<DtCategoria> x = (Collection<DtCategoria>) request.getAttribute("categorias");
                for (DtCategoria cx : x) {
                String Titu = cx.getNombre().replace(" ","-");
            %>
            <tr>
                <td>
                    <a href=Consulta_de_Propuesta_por_Categoria?C=<%=Titu%>>
                        <%= cx.getNombre()%> 
                    </a>
                </td>
            </tr>
            <%}%>
        </table>
    </center>
</body>
</html>
