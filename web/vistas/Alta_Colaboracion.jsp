<%-- 
    Document   : Alta_Colaboracion
    Created on : Sep 22, 2018, 3:06:49 PM
    Author     : Aeliner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Registrar Colaboración a Propuesta</title>
         <script type="text/javascript" src="../js/limpiar.js"></script>
    </head>
    <body>
        <%out.println( (String) request.getParameter("F"));%>
        <link href="../css/style.css" rel="stylesheet" media="screen">
        <br><br><br><br><br><br><br>
        <form id="msform" action=".." method="post">
            
  <!-- fieldsets -->
  <fieldset>
    <h2 class="fs-title">Registra Colaboración</h2>
    <h3 class="fs-subtitle">Selecciona el tipo de retorno y el monto</h3>
    <label class="control-label col-sm-2" for="entradas">Entradas Gratis</label>
                            <input type="radio" name="tipoRetorno" value="entradas" id="entradas" onchange="javascript:showContent()" >
                            <label class="control-label col-sm-2" for="porcentaje">Porcentaje de Ganancias</label>
                        <input type="radio" name="tipoRetorno" value="porcentaje" id="porcentaje" onchange="javascript:showContent()" checked="checked">
    <input type="text" name="monto" pattern="[0-9]*" placeholder="Monto" required="required" />
    <input type="submit" class="next action-button" value="Colaborar" />
  </fieldset>
</form>      
    </body>
</html>