<%-- 
    Document   : inicSesion
    Created on : 11/09/2018, 10:52:03 AM
    Author     : nambr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@page session="true" %>





<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Iniciar sesión</title>
         <script type="text/javascript" src="../js/limpiar.js"></script>
    </head>
    <body>
        
        <link href="../css/style.css" rel="stylesheet" media="screen">
        <br><br><br><br><br><br><br>
        <form id="msform" action="../iniciarS" method="post">
            
  <!-- fieldsets -->
  <fieldset>
    <h2 class="fs-title">Inicia sesión</h2>
    <h3 class="fs-subtitle">Ingresa tu correo o nickname y contraseña</h3>
    <input type="text" name="nick" placeholder="Email o nickname" required="required"/>
   
    <input type="password" name="pass" placeholder="Contraseña" required="required" />
     <script type="text/javascript" src="/js/login.js"></script>
    <input type="submit" class="next action-button" value="Ingresar" />
  </fieldset>
</form>      
    </body>
</html>