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
    <%
    boolean Usuario_Logeado = false;
    if (request.getSession().getAttribute("sesionAct") != null) {
        Usuario_Logeado = true;
    }
    %>
    <head>
        <jsp:include page="/template/head.jsp" />
        <title>Consultar Propuesta</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css">
    </head>
    <body>
        <jsp:include page="/template/header.jsp" />
    <center>
        <% if(Usuario_Logeado) {%>
        <h1>Consulta Propuesta</h1>     
        <table>
            <tr> 
                <th>
                    <b>
                        Título 
                    </b>
                </th> 
                <th>
                    <b>
                        Consultar 
                    </b>
                </th> 
            </tr>
            <%
                List<DtPropuesta> x = (List<DtPropuesta>) request.getAttribute("propuestas");
                for (DtPropuesta cx : x) {
            %>
            <tr>
                <td>
                    <%=cx.getTitulo()%>
                </td>
                <td>
                    <form action="Consulta_de_propuesta_Servlet" method="post">
                    <input type="hidden" name="T" value="<%=cx.getTitulo()%>">
                    <input type="submit" value="Ver"> 
                    </form>
                </td>
            </tr>
            <%}%>
        </table>
        <%}else {%>
        <h1>Debe de iniciar sesión para continuar</h1>
            <form action="index.html">
            <button type="submit">Cancelar</button>
            </form>
        <%}%>
    </center>
</body>
</html>
