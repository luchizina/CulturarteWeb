<%-- 
    Document   : consultarInfoPerfil
    Created on : 17/09/2018, 07:33:23 PM
    Author     : nambr
--%>

<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <script  src="../js/progress.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">  
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"> 
        <title>Información de usuario</title>
    
        <% 
        servicios.DtUsuario user=(servicios.DtUsuario) request.getAttribute("usuario");
        servicios.DtColaborador colab=null;
        servicios.DtProponente prop=null;
        if(user instanceof servicios.DtProponente){
            prop= (servicios.DtProponente) user;
        }
        else{
             colab=(servicios.DtColaborador) user;
            
        }
        
        %>
    </head>
    <body>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" type="text/css">
        <% if(colab != null ) {%>
        <form id="msformPerfil" style="float: left">
        <div id="perfil" class ="main">
            <div id="divLeg">
              <legend id="legendPerf">Información del usuario</legend><br>
              </div>
		<div id="perfil_izquierda">
                    <p>${mensaje_exito}</p>
                      <img src="/CulturarteWeb/retornarimagen?T=${T}" />                      
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
           <ul id="progressbar">
      
    <li class="active">Alta propuesta</li>
    <li>Datos generales</li>
    <li>Datos opcionales</li>
  </ul>
  <!-- fieldsets -->
   <fieldset>
    <h2 class="fs-title">Complete los siguientes campos</h2>
    <h3 class="fs-subtitle">Paso 1</h3> 
     <div id="divLeg">
              <legend id="legendPerf">Información del usuario</legend><br>
               <right>
           <table class="datagrid">
            <tr> 
                <th>
                    Nickname
                </th> 
            </tr>
            <%
                List<servicios.DtUsuario> seguidores= (List<servicios.DtUsuario>) request.getAttribute("seguidore");
                 String Tu ="";
                
                if(seguidores.size()>0){
                for ( servicios.DtUsuario usea : seguidores) {
                 Tu = usea.getNick().replace(" ", "-");
                
            %>
            <tr>
                <td>
                    <a href=consultarPerfil?T=<%=Tu%>>
                        <%= usea.getNick()%> 
                    </a>
                </td>
            </tr>
            <%}}%>
        </table>
         </right>
              </div>
    <input type="button" name="next" class="next action-button" value="Siguiente" />
   </fieldset>
   <fieldset>
    <h2 class="fs-title">Datos generales</h2>
    <input type="button" name="previous" class="previous action-button" value="Anterior" />
    <input type="button" name="next" class="next action-button" value="Siguiente" />
  </fieldset>
  <fieldset>
    <h2 class="fs-title">Datos opcionales</h2>
    <h3 class="fs-subtitle">Si desea complete la siguiente información:</h3>

    <input type="button" name="previous" class="previous action-button" value="Anterior" />
     <button type="submit" class="btn action-button" id="botoncito">Aceptar</button>
  </fieldset>
               </form>    
                  
        <% } else {%>
         <legend id="legendPerf">Información del usuario</legend><br>
             
        <% } %>
         <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script> 
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
<script  src="<%=request.getContextPath()%>/js/index.js"></script>
    </body>
</html>
