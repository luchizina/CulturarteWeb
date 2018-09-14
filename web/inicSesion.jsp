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
    </head>
    <body>
        <%
            String nombre = (String)session.getAttribute("sesionAct");
           String tipo= (String) session.getAttribute("tipo");
            if(nombre==null){
                
            
        %>
        
        <h1>Iniciar sesión</h1> 
        <form action="iniciarS" method="post">
             
             <div class="form-group">
                <label class="control-label col-sm-2" for="nick">Nickname o correo electrónico:</label>
                <div class="col-sm-4"> 
                    <input type="text" class="form-control" id="nick" name="nick" required="required">
                        <%
                  if(session.getAttribute("error")!=null){   
                   String errcorreo= (String) session.getAttribute("error");
                  %>
                  <label for="error"><% out.print(errcorreo);%></label>           
             <% } %>  
                </div>
            </div>
               
     
         
		 <div class="form-group">
                <label class="control-label col-sm-2" for="pass">Password:</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" id="pwd" name="pass" required="required">
                </div>
            </div>
                  <br>
            <input type="submit" value="Iniciar sesión" />
            <input type="reset" value="Vaciar campos" name="botonLimpiar" />
          		
		
            
            
        </form>
                 
                
         <%
             
             
             }else{

 String login = (String)session.getAttribute("mensaje");
            String parent=" (";
            String parent1=")";
            String login1=login.concat(parent);
            String login2=login1.concat(nombre);
            String login3=login2.concat(parent1);
             
             
             %>
             <h3>Ya hay una sesión activa, el nombre de usuario es: <% out.print(login3); %> ¿desea cerrarla?</h3><br>
             
             <% 
                 if(tipo!=null){
                     
                 
             if(tipo.equalsIgnoreCase("proponente")){
                 
             
             %>
             <h3>Sos proponente</h3><br>
             <% 
             }else{


             %>
             <h3>Sos colaborador</h3><br>
             <% }} %>
         
          <a href="cerrarSesion"><button>Cerrar sesión</button></a> 
          
          
          
             <%
                 }
                 %>
                 
                     
            
             
    </body>
</html>
