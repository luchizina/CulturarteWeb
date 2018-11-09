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
                String control = (String) request.getAttribute("paso");
                if(control == null){
                    %>
                    <jsp:forward page="ErrorIP.jsp"/>
                    <% }%>
                <%
            String ruta = (String) request.getAttribute("ruta");
            servicios.DataReporte data = (servicios.DataReporte) request.getAttribute("reporte");

        %>
        <% if (data.getNum() != null) {%>
        <div style="position: absolute; top: 50px; left: 50px; color:green">
            <div id="divTablas" class="datagrid">
                <right>
                    <table class="datagrid">
                        <th>Pago de la Colaboracion</th>
                        <tr><td>Fecha de emision: <%= data.getEmision()%></td></tr>
                    </table>
                </right>
            </div>
        </div>
        <div style="position: absolute; top: 150px; left: 350px; color:green">
            <div id="divTablas" class="datagrid">
                <right>
                    <table class="datagrid">
                        <th>Datos del usuario:</th> 
                        <tr><td>Nick del colaborador: <%= data.getNick()%></td></tr>
                        <tr><td>Nombre de colaborador: <%= data.getNombre()%></td></tr>
                        <tr><td>Apellido de colaborador: <%= data.getApellido()%></td></tr>
                        <tr><td>Correo: <%= data.getCorreo()%></td></tr>
                        <tr><td>Fecha de Nacimiento: <%= data.getFechaNac()%></td></tr>
                    </table>
                </right>
            </div>
        </div> 
        <div style="position: absolute; top: 150px; left: 620px; color:green">
            <div id="divTablas" class="datagrid">
                <right>
                    <table class="datagrid">
                        <th>Datos de la colaboracion:</th> 
                        <tr><td>Propuesta: <%= data.getPropuesta()%></td></tr>
                        <tr><td>Fecha: <%= data.getFecha()%></td></tr>
                        <tr><td>Hora: <%= data.getHora()%></td></tr>
                        <tr><td>Monto: <%= data.getMonto()%></td></tr>
                        <tr><td>Retorno elegido: <%= data.getRetorno()%></td></tr>
                    </table>
                </right>
            </div>
        </div> 
        <div style="position: absolute; top: 150px; left: 850px; color:green">
            <div id="divTablas" class="datagrid">
                <right>
                    <table class="datagrid">
                        <th>Datos del pago:</th> 
                        <tr><td>Numero: <%= data.getNum()%></td></tr>
                        <% if (data.getBanco() != null) {%>
                        <tr><td>Banco: <%= data.getBanco()%></td></tr>
                        <%}%>
                        <%if (data.getTipoT() != null) {%>
                        <tr><td>Tarjeta: <%= data.getTipoT()%></td></tr>
                        <tr><td>CVC: <%= data.getCvc()%></td></tr>
                        <tr><td>Fecha de vencimiento: <%= data.getVenc()%></td></tr>
                        <%}%>
                    </table>
                </right>
            </div>
        </div> 

        <div style="position: absolute; top: 450px; left: 600px; color:green">
            <div id="divTablas" class="datagrid">
                <right>
                    <table class="datagrid">
                        <th>Link de descarga del documento PDF:</th> 
                        <tr><td><a href="/CulturarteWeb/descarga?usu=<%= data.getNick()%>&prop=<%= data.getPropuesta()%>" download>
                                    Descargar pdf emision
                                </a></td></tr>
                    </table>
                </right>
            </div>
        </div> 
        <%} else {%>

        <div style="position: absolute; top: 150px; left: 550px; color:green">
            <div id="divTablas" class="datagrid">
                <right>
                    <table class="datagrid">
                        <th>Informacion del pago:</th> 
                        <tr><td>
                                <i class="material-icons" >mood_bad</i>
                                <label> Usted no ha pagado esta colaboracion </label></td></tr>
                    </table>
                </right>
            </div>
        </div> 
        <%}%>
    </body>
</html>
