<%-- 
    Document   : Alta_Colaboracion
    Created on : Sep 22, 2018, 3:06:49 PM
    Author     : Aeliner
--%>

<%@page import="Servlets.inicSesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <jsp:include page="/template/head.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          
        <title>Registrar Colaboración a Propuesta</title>
         <script type="text/javascript" src="../js/limpiar.js"></script>
         <link href="<%= request.getContextPath()%>/css/style.css" rel="stylesheet" media="screen">
    </head>
    <body>
         <jsp:include page="/template/header.jsp" />
            <%
                String control = (String) request.getAttribute("paso");
                if(control == null){
                    %>
                    <jsp:forward page="ErrorIP.jsp"/>
                    <% }%>
                <%
 servicios.DtUsuario userop=inicSesion.getUsuarioLogueado(request);
 String sesionAct=(String) session.getAttribute("sesionAct");
 String titulo = request.getParameter("T");
if(userop == null || sesionAct==null || userop instanceof servicios.DtProponente || titulo == null  )  { %>
 <form id="msform" action="<%= request.getContextPath() %>/vistas/subIndex.jsp" method="post">      
  <!-- fieldsets -->
  <fieldset>
    <legend id="legendErr">¡UPSS! Esto es incómodo.. :( </legend>      
    <h3 class="fs-subtitle">Página no encontrada, o no tienes acceso a ella</h3>
    <input type="submit" name="volver atrás" class="btn action-button" value="¡Lo entiendo!">
  </fieldset>
</form>   
  <%
 
 }else{
 %>
        <link href="../css/style.css" rel="stylesheet" media="screen">
        <br><br><br><br><br><br><br>
        <%if( ((String) request.getAttribute("tipoR")).equalsIgnoreCase("porcentaje")) { %>
        <form id="msform" action="Colaboracion" method="post" onSubmit="alert('Colaboracion agregada');">
            
  <!-- fieldsets -->
  <fieldset>
    <h2 class="fs-title">Registra Colaboración</h2>
    <h3 class="fs-subtitle">Selecciona el tipo de retorno y el monto</h3>
    
    <label class="control-label col-sm-2" disabled for="entradas">Entradas Gratis</label>
                            <input type="radio" name="tipoRetorno"  value="entradas" id="entradas" disabled onchange="javascript:showContent()" >
                            <label class="control-label col-sm-2"  for="porcentaje">Porcentaje de Ganancias</label>
                        <input type="radio" name="tipoRetorno" value="porcentaje" id="porcentaje" onchange="javascript:showContent()" checked="checked">
    <input type="text" name="monto" pattern="[0-9]*" placeholder="Monto" required="required" />
    <input type="hidden" name="Titulo" value="<%=request.getParameter("T")%>">
    <input type="submit" class="next action-button" onSubmit="alert('Has colaborado en esta propuesta de manera satisfactoria')" value="Colaborar" />
  </fieldset>
</form>
        <% } %>
        
        <%if( ((String) request.getAttribute("tipoR")).equalsIgnoreCase("entrada")) { %>
        <form  id="msform" action="Colaboracion" method="post" onSubmit="alert('Colaboracion agregada');">
            
  <!-- fieldsets -->
  <fieldset>
    <h2 class="fs-title">Registra Colaboración</h2>
    <h3 class="fs-subtitle">Selecciona el tipo de retorno y el monto</h3>
    
    <label class="control-label col-sm-2" disabled for="entradas">Entradas Gratis</label>
                            <input type="radio" name="tipoRetorno"  value="entradas" id="entradas" onchange="javascript:showContent()"checked="checked">
                            <label class="control-label col-sm-2" disabled for="porcentaje">Porcentaje de Ganancias</label>
                        <input type="radio" name="tipoRetorno" value="porcentaje" id="porcentaje" disabled onchange="javascript:showContent()">
    <input type="text" name="monto" pattern="[0-9]*" placeholder="Monto" required="required" />
    <input type="hidden" name="Titulo" value="<%=request.getParameter("T")%>">
    <input type="submit" class="next action-button" onSubmit="alert('Has colaborado en esta propuesta de manera satisfactoria')" value="Colaborar" />
  </fieldset>
</form>
        <% } %>
        
<%if( ((String) request.getAttribute("tipoR")).equalsIgnoreCase("entrada, porcentaje")) { %>
        <form class="modal-content animate" id="msform" action="Colaboracion" method="post" onSubmit="alert('Colaboracion agregada');">
            
  <!-- fieldsets -->
  <fieldset>
    <h2 class="fs-title">Registra Colaboración</h2>
    <h3 class="fs-subtitle">Selecciona el tipo de retorno y el monto</h3>
    
    <label  disabled for="entradas">Entradas Gratis</label>
                            <input type="radio" name="tipoRetorno"  value="entradas" id="entradas" onchange="javascript:showContent()"checked="checked">
                            <label class="control-label col-sm-2"  for="porcentaje">Porcentaje de Ganancias</label>
                        <input type="radio" name="tipoRetorno" value="porcentaje" id="porcentaje" onchange="javascript:showContent()">
    <input type="text" name="monto" pattern="[0-9]*" placeholder="Monto" required="required" />
    <input type="hidden" name="Titulo" value="<%=request.getParameter("T")%>">
    <input type="submit" class="next action-button" onSubmit="alert('Has colaborado en esta propuesta de manera satisfactoria')" value="Colaborar" />
  </fieldset>
</form>
<% } %>
<% }%>
    </body>
</html>