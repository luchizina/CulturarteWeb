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
    </head>
    <body>
        <style>
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: #4CAF50;
    color: white;
}
    </style>
    <center>
        <h1>Consulta Propuesta</h1>
        <table>
            <tr> 
                <th>
                    Titulo
                </th> 
            </tr>
            <%
                Collection<DtPropuesta> x = (Collection<DtPropuesta>) request.getAttribute("propuestas");
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