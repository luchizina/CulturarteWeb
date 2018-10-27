<%-- 
    Document   : consultarInfoPerfil
    Created on : 17/09/2018, 07:33:23 PM
    Author     : nambr
--%>

<%@page import="javax.xml.datatype.DatatypeConstants"%>

<%@page import="Servlets.inicSesion"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
<head>
      <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
        <jsp:include page="/template/head.jsp" />
         <script  src="../js/progress.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
    
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
           
        <title>Información de: <%= colab.getNick()%> </title>
    </head>
    <body>
        <jsp:include page="/template/header.jsp" />
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" type="text/css">
        <% if(colab != null ) {%>
                  
            <% 
              servicios.DtUsuario userop=inicSesion.getUsuarioLogueado(request);
                if(userop != null){
            List<servicios.DtUsuario> seguidoresPrueb= (List<servicios.DtUsuario>) request.getAttribute("seguidore");
            if(userop.getNick().equals(colab.getNick())==false){
                boolean yaSigue=false;
            for(int i=0; i < seguidoresPrueb.size(); i++){
              servicios.DtUsuario seguidor= seguidoresPrueb.get(i);
    
              if(seguidor.getNick().equals(userop.getNick())){
                     yaSigue=true;
               }
    
            }
              if(yaSigue==true){
             %>
          <form method="post" action="dejarDeSeguir">
              <%
                    String link2= "/consultarPerfil?T="+colab.getNick();
 %>
            <input type="hidden" name="link" value="<%=link2%>"/>
     
             <input type="hidden" name="nickLogueado" value="<%=userop.getNick()%>"/>
    <input type="hidden" name="nickASeguir" value="<%=colab.getNick()%>" />
           <input type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" value="Dejar de seguir" />
        </form>
       <% } else{%> 
           
           
     

            <form method="post" action="seguirUsuario">
            
                <%
                    String link= "/consultarPerfil?T="+colab.getNick();
 %>
            <input type="hidden" name="link" value="<%=link%>"/>
     
             <input type="hidden" name="nickLogueado" value="<%=userop.getNick()%>"/>
    <input type="hidden" name="nickASeguir" value="<%=colab.getNick()%>" />
           <input type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" value="Seguir" />
        </form>
            
           <%}} }%> 

         <form class="msformProp" enctype="multipart/form-data" style="position: absolute; top: 50px; left: 245px; color:green">
              <fieldset>
         <legend id="legendErr">Información básica: </legend>   
		<div id="perfil_izquierda" style="float: left">
                    <% if(colab.getLink()!=null && !colab.getLink().equals("")){
                        
                   
                        %>
                      <img id="imagenot" src="/CulturarteWeb/retornarimagen?T=${T}" width="200" height="200">  
                      <%   }else{%>          
                      <img id="imagenot" src="/CulturarteWeb/img/user-4.png" width="200" height="200">   
                          <%    } %>
		</div>
                
		<div id="perfil_derecha">
                    
			<div class="contenedor">
				
				<label class="rotulo" style="text-align: left">Nombre:</label>
				<label class="valor" style="text-align: left"><%= colab.getNombre() %></label>
				<br/>
                                <label class="rotulo" style="text-align: left"> Apellido:</label>
                                <label class="valor" style="text-align: left"><%= colab.getApellido() %> </label><br/>
                                 <label class="rotulo" style="text-align: left"> Nickname:</label>
                                <label class="valor" style="text-align: left"><%= colab.getNick() %> </label><br/>
                                <label class="rotulo" style="text-align: left"> Tipo:</label>
                                <label class="valor" style="text-align: left">Colaborador</label><br/>
				<label class="rotulo" style="text-align: left">Fecha de nacimiento:</label>
				<label class="valor" style="text-align: left">
                                  
					<%= 
						new SimpleDateFormat("dd/MM/yyyy").format(colab.getFecha().toGregorianCalendar().getTime())
					%>
				</label>
			</div>
			<div class="contenedor">
				<label class="rotulo" style="text-align: left">Correo electrónico:</label>
				<label class="valor" style="text-align: left">
					<a href="mailto:<%= colab.getCorreo() %>">
						<%= colab.getCorreo() %>
					</a>
				</label>
			</div>
		</div>
	
           </fieldset>
        </form>
 
             <div style="position: absolute; top: 150px; left: 60px; color:green">
            <div id="divTablas" class="datagrid">
           <legend id="legendPerf">Usuarios seguidos</legend><br>
                        <right>
           <table class="datagrid">
            <tr> 
                <th>
                  Nombre:
                </th> 
            </tr>
            <%
                List<servicios.DtUsuario> seguidos= (List<servicios.DtUsuario>) request.getAttribute("seguido");
                 String Titu ="";
                
                if(seguidos.size()>0){
                for ( servicios.DtUsuario usea : seguidos ) {
                 Titu = usea.getNick();
                
            %>
            <tr>
                <td>
                     <%= usea.getNombre() %>  <%= usea.getApellido() %> (<a href=consultarPerfil?T=<%=Titu%>> <%= usea.getNick()%> </a>)
             
                </td>
            </tr>
            <%}} else{ %>
             <td> no sigues a nadie  </td>
            <%} %>
        </table>
         </right>
              </div> <%-- Usuarios seguidos --%>
            <div id="divTablas" class="datagrid">
          <legend id="legendPerf">Seguidores</legend><br>
               <right>
           <table class="datagrid">
            <tr> 
                <th>
                   Nombre:
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
                 <%= usea.getNombre() %>  <%= usea.getApellido() %> (<a href=consultarPerfil?T=<%=Tu%>> <%= usea.getNick()%> </a>)
             
                </td>
            </tr>
            <%}} else{ %>
             <td> no tiene seguidores   </td>
            <%} %>
        </table>
         </right>
              </div>  <%-- Usuarios seguidos --%>
 </div> 
              
        <div style="position: absolute; top: 150px; right: 40px; color:green">
            <div id="divTablas" class="datagrid">
            <legend id="legendPerf">Colaboraciones</legend><br>
                        <right>
           <table class="datagrid">
            <tr> 
                <th>
                   Titulo:
                </th> 
                <%
          
            if(userop != null){
            String nicko=userop.getNick();
            if(nicko.equals(colab.getNick())){%>
             <th>
                    Monto:
                </th> 
                  <th>
                    Fecha:
                </th> 
            <%
                }
            }
            %>
            </tr>
              <%
                List<servicios.DtColaboracion> props= (List<servicios.DtColaboracion>) request.getAttribute("propuCol");
                 String Tup ="";
                
                if(props.size()>0){
                for ( servicios.DtColaboracion propa : props) {
                 Tup = propa.getPropuesta().getTitulo().replace(" ", "+");
            %>
            <tr>
                <td>
                    <a href=Consulta_de_propuesta_Servlet?T=<%=Tup%>>
                        <%= propa.getPropuesta().getTitulo() %> 
                    </a>
               </td>
                      <%
            if(userop != null && userop.getNick().equals(colab.getNick())){%>
             <td>  <%= propa.getMonto()   %>  </td> 
             <td> <%= propa.getFecha().toGregorianCalendar().getTime().toLocaleString() %> </td> 
            <%
                }
            }
            %>
            </tr>
            <%}  else{ %>
             <td> no tiene colaboraciones</td>
            <%} %>
        </table>
         </right>
              </div>
        <form style="float: both">
              
            <div id="divTablas" class="datagrid">
              <legend id="legendPerf">Propuestas favoritas</legend><br>
                        <right>
           <table class="datagrid">
            <tr> 
                <th>
                  Nombre:
                </th> 
            </tr>
            
              <%
                List<servicios.DtPropuesta> propFavo= (List<servicios.DtPropuesta>) request.getAttribute("propuFav");
                 String pa ="";
                
                if(propFavo.size()>0){
                for (servicios.DtPropuesta propu1 : propFavo) {
                 pa = propu1.getTitulo().replace(" ", "+");
            %>
            <tr>
                <td>
                    <a href=Consulta_de_propuesta_Servlet?T=<%=pa%>>
                        <%= propu1.getTitulo()%> 
                    </a>
                    </td>
            </tr>
            <%} } else{ %>
             <td> no tiene colaboraciones    </td>
            <%} %>
        </table>
         </right>
              </div>
        </form>
        </div>  
         
        <% } %>
    </body>
</html>
