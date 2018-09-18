<%-- 
    Document   : consultarInfoPerfil
    Created on : 17/09/2018, 07:33:23 PM
    Author     : nambr
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Logica.DtColaborador"%>
<%@page import="Logica.DtProponente"%>
<%@page import="Logica.DtUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <script  src="../js/progress.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         
        <title>Información de usuario</title>
    
        <% 
        DtUsuario user=(DtUsuario) request.getAttribute("usuario");
        DtColaborador colab=null;
        DtProponente prop=null;
        if(user instanceof DtProponente){
            prop= (DtProponente) user;
        }
        else{
             colab=(DtColaborador) user;
            
        }
        
        %>
    </head>
    <body>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" type="text/css">

      
        <form id="msformPerfil" style="float: left">
            


        <div id="perfil" class ="main">
            <div id="divLeg">
              <legend id="legendPerf">Información del usuario</legend><br>
              </div>
		<div id="perfil_izquierda">
                    
                   
			<img src="img/user-4.png" alt="imagen" width="150" height="150" class="center">
		</div>

		<div id="perfil_derecha">
                    
			<div class="contenedor">
				<h2 class="fs-title">Información básica</h2>
				<label class="rotulo">Nombre:</label>
				<label class="valor"><%= colab.getNombre() %></label>
				<br/>
                                <label class="rotulo"> Apellido:</label>
                                <label class="valor"><%= colab.getApellido() %> </label><br/>
                                 <label class="rotulo"> Nickname:</label>
                                <label class="valor"><%= colab.getNick() %> </label><br/>
                                <label class="rotulo"> Tipo:</label>
                                <label class="valor">Colaborador</label><br/>
				<label class="rotulo">Fecha de nacimiento:</label>
				<label class="valor">
                                  
					<%= 
						new SimpleDateFormat("dd/MM/yyyy").format(colab.getFecha())
					%>
				</label>
			</div>

			<div class="contenedor">
				<label class="rotulo">Correo electrónico:</label>
				<label class="valor">
					<a href="mailto:<%= colab.getCorreo() %>">
						<%= colab.getCorreo() %>
					</a>
				</label>
			</div>
		</div>
	</div>
        </form>
 
             <form id="msform" style="float: left">
            <div id="divLeg">
              <legend id="legendPerf">Información del usuario</legend><br>
              </div>
                 
                   <form id="msform" style="clear: both">
            <div id="divLeg">
              <legend id="legendPerf">Información del usuario</legend><br>
              </div>
        </form>        
        
    </body>
</html>
