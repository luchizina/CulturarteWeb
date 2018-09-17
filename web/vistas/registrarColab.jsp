<%-- 
    Document   : registrarColab
    Created on : 16/09/2018, 03:53:35 PM
    Author     : nambr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
               <link href="../css/style.css" rel="stylesheet" media="screen">
        <br><br><br><br><br><br><br>
        <form id="msform" action="../iniciarS" method="post">
            
  <!-- fieldsets -->
  <fieldset>

        <legend>Elegime un retorno pa</legend>

        <div>
            <input type="radio" id="huey" 
                   name="drone" value="Porcentaje era?" checked />
            <label for="huey">Porcentaje era?</label>
        </div>

        <div>
            <input type="radio" id="dewey" 
                   name="drone" value="y el otro?" />
            <label for="dewey">no se</label>
        </div>

    
  </fieldset>
</form> 
         <form id="msform" action="../iniciarS" method="post">
            
  <!-- fieldsets -->
  <fieldset>
    <h2 class="fs-title">Monto</h2>
  <input type="password" name="pass" placeholder="Monto" required="required" />
  <input type="submit" class="next action-button" value="Dale" />
  </fieldset>
</form>    
        
        
    </body>
</html>
