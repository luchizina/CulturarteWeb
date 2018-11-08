<%-- 
    Document   : pagos
    Created on : 07/11/2018, 08:18:37 PM
    Author     : Nuevo
--%>

<%@page import="servicios.DataReporte"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/iconos.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/material.indigo-pink.min.css">
        <script defer src="<%= request.getContextPath()%>/js/material.min.js"></script>
        <jsp:include page="/template/head.jsp" />
    </head>
    <body>
        <jsp:include page="/template/header.jsp" />
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css" type="text/css">
        <%
            String ruta = (String) request.getAttribute("ruta");
            servicios.DataReporte data = (servicios.DataReporte) request.getAttribute("reporte");

        %>
        <div style="position: absolute; top: 150px; left: 550px; color:green">
            <div id="divTablas" class="datagrid">
                <legend id="legendPerf">Pago de Colaboracion</legend><br>
                <right>
                    <table class="datagrid">
                        <% if (data != null) {%>
                        <tr><td>Fecha de emision: <%= data.getEmision() %></td></tr>
                        <th>Datos del usuario:</th> 
                        <tr><td>Nick del colaborador: <%= data.getNick() %></td></tr>
                        <tr><td>Nombre de colaborador: <%= data.getNombre()%></td></tr>
                        <tr><td>Apellido de colaborador: <%= data.getApellido()%></td></tr>
                        <tr><td>Correo: <%= data.getCorreo() %></td></tr>
                        <tr><td>Fecha de Nacimiento: <%= data.getFechaNac() %></td></tr>
                        <tr><td> </td></tr>
                        <tr><td> </td></tr>
                        <th>Datos de la colaboracion:</th> 
                        <tr><td>Hora: <%= data.getHora() %></td></tr>
                        <tr><td><a href="/CulturarteWeb/descarga?usu=<%= data.getNick() %>&prop=<%= data.getPropuesta() %>" download>
                            Descargar pdf emision
                        </a></td></tr>
                        <%} else {%>
                        <tr><td>
                                <i class="material-icons" >mood_bad</i>
                                <label> Usted no ha pagado esta colaboracion </label></td></tr>
                                <%}%>
                    </table>
                </right>
            </div>
        </div> 
    </body>
</html>
