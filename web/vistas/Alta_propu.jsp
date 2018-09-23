<%-- 
    Document   : inicSesion
    Created on : 11/09/2018, 10:52:03 AM
    Author     : Lucia
--%>

<%@page import="Logica.DtColaborador"%>
<%@page import="Servlets.inicSesion"%>
<%@page import="Logica.DtCategoria"%>
<%@page import="Logica.DtUsuario"%>
<%@page import="Servlets.alta_prop"%>
<%@page import="java.util.Collection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<html lang="en" >
<head>
   <jsp:include page="/template/head.jsp" />
    <meta charset="UTF-8">
  <title>Alta propuesta</title>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">  
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"> 

</head>
<body>
    
     <jsp:include page="/template/header.jsp" />
       
  <!-- multistep form -->
     <%
 DtUsuario userop=inicSesion.getUsuarioLogueado(request);
 String sesionAct=(String) session.getAttribute("sesionAct");
 if(sesionAct==null || userop instanceof DtColaborador) {
 
 }else{
 %>
  <form action="<%=request.getContextPath()%>/alta_prop" method="post" id="msform" enctype="multipart/form-data">
      <!-- progressbar -->
  <ul id="progressbar">
      
    <li class="active">Alta propuesta</li>
    <li>Datos generales</li>
    <li>Datos opcionales</li>
  </ul>
  <!-- fieldsets -->
   <fieldset>
    <h2 class="fs-title">Complete los siguientes campos</h2>
    <h3 class="fs-subtitle">Paso 1</h3> 
    <select name="cate" required ="required">
    <%
    if(request.getAttribute("categorias")!=null){
    Collection<DtCategoria> categorias=(Collection<DtCategoria>) request.getAttribute("categorias");
    for(DtCategoria cat: categorias){   
    int i=1;
    %>
    <option value="<%out.print(cat.getNombre());%>"> <%out.print(cat.getNombre());%>  </option>
  <%i++; }}%>
     </select>
    <input type="text" name="titulo" placeholder="Título" required ="required" />
    <input type="date" name="fecha" placeholder="fecha" required ="required" />
    <input type="button" name="next" class="next action-button" value="Siguiente" />
   </fieldset>
   <fieldset>
    <h2 class="fs-title">Datos generales</h2>
    <h3 class="fs-subtitle">Por favor no deje ningun espacio en blanco</h3>
    <input type="text" name="lugar" placeholder="Lugar" required ="required" />
     <input type="number" name="entrada" placeholder="Precio entrada" required ="required" />
      <input type="number" name="monto_tot" placeholder="monto total" required ="required" />
    <h3 class="fs-subtitle">Tipo de retorno:</h3>
     <select name="retorno" required ="required">
         <option value="1" >Entradas </option>
         <option value="2" >porcentaje </option>
         <option value="3" >ambas</option>  
     </select>
    <input type="button" name="previous" class="previous action-button" value="Anterior" />
    <input type="button" name="next" class="next action-button" value="Siguiente" />
  </fieldset>
  <fieldset>
    <h2 class="fs-title">Datos opcionales</h2>
    <h3 class="fs-subtitle">Si desea complete la siguiente información:</h3>
    <textarea name="descripcion" placeholder="Escriba una descripcion..."></textarea>
    <input type="file" class="btn btn-default" accept="image/*" id="imagen" name="imagen">
    <input type="button" name="previous" class="previous action-button" value="Anterior" />
     <button type="submit" class="btn action-button" id="botoncito">Aceptar</button>
  </fieldset>
  
</form>
      <%}%>
     <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script> 
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
<script  src="<%=request.getContextPath()%>/js/index.js"></script>
</body>
</html>
