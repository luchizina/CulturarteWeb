<%-- 
    Document   : consultarInfoPerfil
    Created on : 17/09/2018, 07:33:23 PM
    Author     : nambr
--%>

<%@page import="Logica.DtColaboracion"%>
<%@page import="Servlets.inicSesion"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Logica.DtColaborador"%>
<%@page import="Logica.DtProponente"%>
<%@page import="Logica.DtUsuario"%>
<%@page import="Logica.DtPropuesta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <head>
        <jsp:include page="/template/head.jsp" />
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
        <jsp:include page="/template/header.jsp" />
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" type="text/css">
        <% if(colab != null ) {%>
        <form id="msformPerfil" style="float: left">
        <div id="perfil" class ="main">
            <div id="divLeg">
              <legend id="legendPerf">Información del usuario</legend><br>
              </div>
		<div id="perfil_izquierda">
                    
                    <% if(colab.getImg()!=null){
                        
                   
                        %>
                  
                      <img id="imagenot" src="/CulturarteWeb/retornarimagen?T=${T}" width="250" height="250">  
                      
                      <%   }else{%>
                              
                      <img id="imagenot" src="/CulturarteWeb/img/user-4.png" width="250" height="250">
                             
                          <%    } %>
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
 
             <form style="float: left">
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
                List<DtUsuario> seguidos= (List<DtUsuario>) request.getAttribute("seguido");
                 String Titu ="";
                
                if(seguidos.size()>0){
                for ( DtUsuario usea : seguidos) {
                 Titu = usea.getNick();
                
            %>
            <tr>
                <td>
                    <a href=consultarPerfil?T=<%=Titu%>>
                        <%= usea.getNick()%> 
                    </a>
                </td>
            </tr>
            <%}} else{ %>
             <td> no sigues a nadie  </td>
            <%} %>
        </table>
         </right>
              </div> <%-- Usuarios seguidos --%>
 <form id="msform" style="clear: both">
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
                List<DtUsuario> seguidores= (List<DtUsuario>) request.getAttribute("seguidore");
                 String Tu ="";
                
                if(seguidores.size()>0){
                for ( DtUsuario usea : seguidores) {
                 Tu = usea.getNick().replace(" ", "-");
                
            %>
            <tr>
                <td>
                    <a href=consultarPerfil?T=<%=Tu%>>
                        <%= usea.getNick()%> 
                    </a>
                </td>
            </tr>
            <%}} else{ %>
             <td> no tiene seguidores   </td>
            <%} %>
        </table>
         </right>
              </div>  <%-- Usuarios seguidos --%>
        <form style="float: both">
            <div id="divTablas" class="datagrid">
            <legend id="legendPerf">Colaboraciones</legend><br>
                        <right>
           <table class="datagrid">
            <tr> 
                <th>
                   Titulo:
                </th> 
                <%
           DtUsuario userop=inicSesion.getUsuarioLogueado(request);
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
            %>
            </tr>
            
              <%
                List<DtColaboracion> props= (List<DtColaboracion>) request.getAttribute("propuCol");
                 String Tup ="";
                
                if(props.size()>0){
                for ( DtColaboracion propa : props) {
                 Tup = propa.getPropuesta().getTitulo().replace(" ", "+");
            %>
            <tr>
                <td>
                    <a href=Consulta_de_propuesta_Servlet?T=<%=Tup%>>
                        <%= propa.getPropuesta().getTitulo() %> 
                    </a>
                    </td>
                      <%
            if(nicko.equals(colab.getNick())){%>
             <td>
                   <a href=Consulta_de_propuesta_Servlet?T=<%=Tup%>>
                        <%= propa.getMonto()   %> 
                    </a>
                </td> 
                 <td>
                   <a href=Consulta_de_propuesta_Servlet?T=<%=Tup%>>
                        <%= propa.getFecha()%> 
                    </a>
                </td> 
            <%
                }}
            %>
            </tr>
            <%}}  else{ %>
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
                List<DtPropuesta> propFavo= (List<DtPropuesta>) request.getAttribute("propuFav");
                 String pa ="";
                
                if(propFavo.size()>0){
                for ( DtPropuesta propu1 : propFavo) {
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
      
        
            <%  DtUsuario userLogueado= inicSesion.getUsuarioLogueado(request);  
            List<DtUsuario> seguidoresPrueb= (List<DtUsuario>) request.getAttribute("seguidore");
            if(userLogueado.getNick().equals(colab.getNick())==false){
                boolean yaSigue=false;
for(int i=0; i < seguidoresPrueb.size(); i++){
    DtUsuario seguidor= seguidoresPrueb.get(i);
    
    if(seguidor.getNick().equals(userLogueado.getNick())){
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
     
             <input type="hidden" name="nickLogueado" value="<%=userLogueado.getNick()%>"/>
    <input type="hidden" name="nickASeguir" value="<%=colab.getNick()%>" />
           <input type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" value="Dejar de seguir" />
        </form>
       <% } else{%> 
           
           
     

            <form method="post" action="seguirUsuario">
            
                <%
                    String link= "/consultarPerfil?T="+colab.getNick();
 %>
            <input type="hidden" name="link" value="<%=link%>"/>
     
             <input type="hidden" name="nickLogueado" value="<%=userLogueado.getNick()%>"/>
    <input type="hidden" name="nickASeguir" value="<%=colab.getNick()%>" />
           <input type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" value="Seguir" />
        </form>
            
           <%} }%> 
       


        
        
        <% } else {%>
         <legend id="legendPerf">Información del usuario</legend><br>
             
        <% } %>
    </body>
</html>
