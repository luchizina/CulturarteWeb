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
    <% //out.println(request.getSession().getAttribute("sesionAct")+"usuario"); %>
    <%  String Nombre_Usuario = (String) request.getSession().getAttribute("sesionAct");     %>
    <%  String tipo = (String) session.getAttribute("tipo");                    %>
    <% //out.println(Nombre_Usuario);                                           %>
    <% //out.println(tipo);                                                     %>
    <%  boolean Propuso_a_propu = false;                                        %>
    <%  boolean Colaboro_a_propu = false;                                       %>
    <%  boolean Puede_colaborar_a_propu = false;                                %>
    <% if (Nombre_Usuario.equals(propu.getPropo())) {                           %>
    <%    Propuso_a_propu = true;                                               %>
    <%                                             }                            %>
    <% if (tipo.equals("colaborador")) {                                        %>
    <%      if (propu.getColabs().containsKey(Nombre_Usuario)) {                %>
    <%    Colaboro_a_propu = true;                                              %>
    <%    }else {                                                               %>
    <%                                                                          %>
    <%   Puede_colaborar_a_propu = true;                                        %>
    <%   }                                                                      %>
    <%   }                                                                      %> 

    
    
    <head>
        <title>Consultar Propuesta: <%propu.getTitulo();%> </title>
    </head>
    <body>
        <table border=10 >
            <tr>
                <td><b> Titulo </b></td>
                <td><b> Lugar </b></td>
                <td><b> Monto </b></td>
                <td><b> Monto Recaudado </b></td>
                <td><b> Fecha </b></td>
                <td><b> Estado </b></td>
                <td><b> Propuesto por </b></td>
                <td><b> Precio </b></td>
                <td><b> Categoria </b></td>
                <td><b> Retorno </b></td>
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
                <td><b> Descripcion </b></td>
            </tr>
            <tr>
                <td><b><%= propu.getDescripcion()%></b></td>
            </tr>    
        </table>
        <br>
        <br>
        <table border=10><tr><td><b> Colaboradores </b></td></tr>
            <% if(colaboradores){                                               %>
            <% for (String cx : x) {                                            %>
            <tr><td><%= cx%></td></tr>
            <%}%>
            <%}%>
        </tr>
        </table>  
        
        <% if(Puede_colaborar_a_propu ) {                                    %>
        <form 	action="#" method="get">
	<input type="submit" value="Colaborar">
        </form>
        <% } %>
        
        <% if(Colaboro_a_propu){                                                %>
        <form 	action="#" method="get">
	<input type="submit" value="Comentar">
        </form>
        <%}%>
        
        <% if(Propuso_a_propu){                                                %>
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

