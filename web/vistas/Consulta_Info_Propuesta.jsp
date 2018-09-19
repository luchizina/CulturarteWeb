 <%-- 
    Document   : Consulta_Info_Propuesta
    Created on : 14/09/2018, 10:16:05
    Author     : matheo
--%>

<%@page import="Logica.DtColaborador"%>
<%@page import="java.util.Collection"%>
<%@page import="Logica.DtPropuesta"%>
<%@page import="java.util.List"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <%  DtPropuesta propu = (DtPropuesta) request.getAttribute("propu");        %>
    <%  boolean colaboradores = false;                                          %>
    <%  List<String> x = (List<String>) request.getAttribute("col");            %>
    <%  if (x != null) {                                                        %>
    <%      colaboradores = true;                                               %>
    <%               }                                                          %>
    <%  boolean Propuso_a_propu = false;                                        %>
    <%  boolean Colaboro_a_propu = false;                                       %>
    <%  boolean Puede_colaborar_a_propu = false;                                %>
    <%  String Nombre_Usuario = "";                                             %>
    <%  String tipo = "";                                                       %>
    <% if(request.getSession().getAttribute("sesionAct") != null ) {            %>
    <% Nombre_Usuario = (String) request.getSession().getAttribute("sesionAct");%>
    <% tipo = (String) session.getAttribute("tipo");                            %>
    <% if (Nombre_Usuario.equals(propu.getPropo())) {                           %>
    <%    Propuso_a_propu = true;                                               %>
    <% }                                                                        %>
    <% if (tipo.equals("colaborador")) {                                        %>
    <%      if (propu.getColabs().containsKey(Nombre_Usuario)) {                %>
    <%    Colaboro_a_propu = true;                                              %>
    <%    }else {                                                               %>
    <%   Puede_colaborar_a_propu = true;                                        %>
    <%   }                                                                      %>
    <%   }                                                                      %> 
    <%   }                                                                      %> 
    <head>
        <title>Consultar Propuesta: <%propu.getTitulo();%> </title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css">
    </head>
    <body>
        <table border=10 >
            <tr>
                <th><b> Titulo </b></th>
                <th><b> Lugar </b></th>
                <th><b> Monto </b></th>
                <th><b> Monto Recaudado </b></th>
                <th><b> Fecha </b></th>
                <th><b> Estado </b></th>
                <th><b> Propuesto por </b></th>
                <th><b> Precio </b></th>
                <th><b> Categoria </b></th>
                <th><b> Retorno </b></th>
            </tr>
            <tr>
                <td><b>  <%= propu.getTitulo()%> </b></td>
                <td><b>  <%= propu.getLugar()%> </b></td>
                <td><b>  <%= propu.getMontototal()%> </b></td>
                <td><b>  <%= propu.getMontoActual()%> </b></td>
                <td><b>  <%= propu.getFecha()%> </b></td>
                <td><b>  <%= propu.getEstActual().getEstado().toString()%> </b></td>
                <td><b>  <%= propu.getPropo()%> </b></td>
                <td><b>  <%= propu.getPrecio()%> </b></td>
                <td><b>  <%= propu.getNombreCate()%></b></td>
                <td><b>  <%= propu.getTRetornos()%></b></td>
            </tr>
        </table>
        <br>
        <br>
        <table border=10>
            <tr>
                <th><b> Descripcion </b></th>
            </tr>
            <tr>
                <td><b><%= propu.getDescripcion()%></b></td>
            </tr>    
        </table>
        <br>
        <br>
        <table border=10><tr><th><b> Colaboradores </b></th></tr>
            <% if(colaboradores){                                               %>
            <% for (String cx : x) {                                            %>
            <tr><td><%= cx%></td></tr>
            <%}%>
            <%}%>
        </tr>
        </table>  
        
        <% if(Puede_colaborar_a_propu && !Nombre_Usuario.equals("")) {          %>
        <form 	action="#" method="get">
	<input type="submit" value="Colaborar">
        </form>
        <% } %>
        
        <% if(Colaboro_a_propu && !Nombre_Usuario.equals("")) {                 %>
        <form 	action="#" method="get">
	<input type="submit"  value="Comentar">
        </form>
        <%}%>
        
        <% if(Propuso_a_propu && !Nombre_Usuario.equals("")) {                  %>
        <form 	action="#" method="get">
	<input type="submit" value="Extender Tiempo">
        </form>
        <br>
        <form 	action="#" method="get">
	<input type="submit" value="Cancela Propuesta">
        </form>
        <%}%>
        
</body>
</html>

