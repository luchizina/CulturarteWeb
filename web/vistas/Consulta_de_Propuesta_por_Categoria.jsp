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
                <tr> 
                <th>
                    <b>
                        Nombre 
                    </b>
                </th> 
                <th>
                    <b>
                        Consultar 
                    </b>
                </th> 
            </tr>
            </tr>
            <%
                Collection<DtCategoria> x = (Collection<DtCategoria>) request.getAttribute("categorias");
                for (DtCategoria cx : x) {
            %>
            <tr>
                <td>
                    <%=cx.getNombre()%>
                </td>
                <td>
                    <form action="Consulta_de_Propuesta_por_Categoria" method="post">
                    <input type="hidden" name="C" value="<%=cx.getNombre()%>">
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
