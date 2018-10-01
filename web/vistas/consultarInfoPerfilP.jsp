<%-- 
    Document   : consultarInfoPerfilP
    Created on : 19/09/2018, 05:52:47 PM
    Author     : Luchi
--%>
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
         <script  src="../js/progress.js"></script>
         <jsp:include page="/template/head.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         
        <title>Información de usuario</title>
        
        <% 
        DtUsuario user=(DtUsuario) request.getAttribute("usuario");
        DtProponente prop=null;
        if(user instanceof DtProponente){
            prop= (DtProponente) user;           
        }  
        %>
    </head>
    <body>
        
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" type="text/css">
            <jsp:include page="/template/header.jsp" />
                  <%
        DtUsuario userop=inicSesion.getUsuarioLogueado(request);
        if(userop != null){
        String nicko=userop.getNick();
            if(nicko.equals(prop.getNick())){%>
            <div style="float: right">                                
            <form id="pa" class="msformProp" action="<%=request.getContextPath()%>/alta_prop" method="post">
                <fieldset>
                <button type="submit" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                 <i class="material-icons">add</i>
                </button>  
                 <button type="submit" class="mdl-button mdl-js-button mdl-button--accent">
                Alta de propuesta
               </button>  
                </fieldset>
            </form>
                
             <form id="msform" style="clear: both">
            <div id="divTablas" class="datagrid">
           <!--   <legend id="legendPerf">Seguidores</legend><br>-->
               <right>
           <table class="datagrid">
            <tr> 
                <th>
                  Mis Propuestas
                </th> 
            </tr>
            <%
                List<DtPropuesta> MisProps = (List<DtPropuesta>) request.getAttribute("propusMias");
                 String Mu ="";
                
                if(MisProps.size()>0){
                for ( DtPropuesta MiP : MisProps) {
                 Mu = MiP.getTitulo().replace(" ", "+");
                
            %>
            <tr>
                <td>
                    <a href=consultarPerfil?T=<%=Mu%>>
                        <%= MiP.getTitulo()%> (<%= MiP.getEstActual().getEstado().toString() %>)
                    </a>
                </td>
                
            </tr>
            
            <%}} else{ %>
             <td> No tiene ninguna propuesta</td>
            <%} %>
        </table>
         </right>
              </div>
       
            </form>
    </div>
        <%}}%>
       
       
        <% if(prop != null ) {%>
        <form id="msformPerfil" style="float: left">
        <div id="perfil" class ="main">
            <div id="divLeg">
              <legend id="legendPerf">Información del usuario</legend><br>
              </div>
		<div id="perfil_izquierda">
                    
                    <% if(prop.getImg()!=null){
                        
                   
                        %>
                  
                      <img id="imagenot" src="/CulturarteWeb/retornarimagen?T=${T}" width="250" height="250">  
                      
                      <%   }else{%>
                              
                      <img id="imagenot" src="<%= request.getContextPath() %>/img/user-4.png" width="250" height="250">
                             
                          <%    } %>
		</div>
                
		<div id="perfil_derecha">
                    
			<div class="contenedor">
				<h2 class="fs-title">Información básica</h2>
				<label class="rotulo">Nombre:</label>
				<label class="valor"> <br/><%= prop.getNombre() %></label>
				<br/>
                                <label class="rotulo"> Apellido:</label>
                                <label class="valor"> <br/><%= prop.getApellido() %> </label><br/>
                                 <label class="rotulo"> Nickname:</label>
                                <label class="valor"> <br/><%= prop.getNick() %> </label><br/>
                                <label class="rotulo"> Tipo:</label>
                                <label class="valor"> <br/>Proponente</label><br/>
				<label class="rotulo">Fecha de nacimiento:</label>
				<label class="valor"> <br/>
					<%= 
						new SimpleDateFormat("dd/MM/yyyy").format(prop.getFecha())
					%>
				</label><br/>
		
				<label class="rotulo">Correo electrónico:   </label>
				<label class="valor"><a href="mailto:<%= prop.getCorreo()%>" ><br/><%= prop.getCorreo() %>
					</a>
				</label><br/>
                                        <% if(!prop.getLinkWeb().equals("")) { %>
                                <label class="rotulo"><br/>Pagina Web:</label><br/>
				<label class="valor"> <a href="<%= prop.getLinkWeb()%>">
						<%= prop.getLinkWeb()%>
					</a></label><br/>
                                        <% }%>
                                <% if(!prop.getDireccion().equals("")) { %>
                                <label class="rotulo">Dirección:</label><br/>
				<label class="valor"><%= prop.getDireccion()%></label><br/>
                                        <% } %>
                                        <% if(!prop.getBiografia().equals("")) { %>
                                <label class="rotulo"><br/>Biografia:</label><br/>
				<label class="valor"> <br/> <%= prop.getBiografia()%></label>
                                        <% }%>
                      </div>   
		</div>
	</div>
        </form>
 
             <form style="float: left">
            <div id="divTablas" class="datagrid">
            <!--  <legend id="legendPerf">Usuarios seguidos</legend><br>-->
                        <right>
           <table class="datagrid">
            <tr> 
                <th>
                    Usuarios seguidos
                </th> 
            </tr>
            <%
                
                List<DtUsuario> seguidos= (List<DtUsuario>) request.getAttribute("seguido");
                 String Titu ="";
                
                if(seguidos.size()>0){
                for ( DtUsuario usea : seguidos) {
                 Titu = usea.getNick().replace(" ", "+");
                
            %>
            <tr>
                <td>
                    <a href=consultarPerfil?T=<%=Titu%>>
                        <%= usea.getNick()%> 
                    </a>
                </td>
            </tr>
            <%}} else{ %>
             <td> no tiene seguidos   </td>
            <%} %>
        </table>
         </right>
              </div>
   
     <form id="msform" style="clear: both">
            <div id="divTablas" class="datagrid">
             <legend id="legendPerf">Seguidores</legend><br>
               <right>
           <table class="datagrid">
            <tr> 
                <th>
                   Seguidores
                </th> 
            </tr>
            <%
                List<DtUsuario> seguidores= (List<DtUsuario>) request.getAttribute("seguidore");
                 String Tu ="";
                
                if(seguidores.size()>0){
                for ( DtUsuario usea : seguidores) {
                 Tu = usea.getNick().replace(" ", "+");
                
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
         <form id="msform" style="clear: both">
            <div id="divTablas" class="datagrid">
           <!--   <legend id="legendPerf">Seguidores</legend><br>-->
               <right>
           <table class="datagrid">
            <tr> 
                <th>
                  Mis Propuestas
                </th> 
            </tr>
            <%
                List<DtPropuesta> MisProps = (List<DtPropuesta>) request.getAttribute("propus");
                 String Mu ="";
                
                if(MisProps.size()>0){
                for ( DtPropuesta MiP : MisProps) {
                 Mu = MiP.getTitulo().replace(" ", "+");
                
            %>
            <tr>
                <td>
                    <a href=consultarPerfil?T=<%=Mu%>>
                        <%= MiP.getTitulo()%> (<%= MiP.getEstActual().getEstado().toString() %>)
                    </a>
                </td>
                
            </tr>
            
            <%}} else{ %>
             <td> No tiene ninguna propuesta</td>
            <%} %>
        </table>
         </right>
              </div>
           
        </form>  
      <%  DtUsuario userLogueado= inicSesion.getUsuarioLogueado(request);  
            List<DtUsuario> seguidoresPrueb= (List<DtUsuario>) request.getAttribute("seguidore");
            if(userLogueado.getNick().equals(prop.getNick())==false){
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
                    String link2= "/consultarPerfil?T="+prop.getNick();
 %>
            <input type="hidden" name="link" value="<%=link2%>"/>
     
             <input type="hidden" name="nickLogueado" value="<%=userLogueado.getNick()%>"/>
    <input type="hidden" name="nickASeguir" value="<%=prop.getNick()%>" />
           <input type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" value="Dejar de seguir" />
        </form>
       <% } else{%> 
           
           
     

            <form method="post" action="seguirUsuario">
            
                <%
                    String link= "/consultarPerfil?T="+prop.getNick();
 %>
            <input type="hidden" name="link" value="<%=link%>"/>
 <input type="hidden" name="nickLogueado" value="<%=userLogueado.getNick()%>"/>
    <input type="hidden" name="nickASeguir" value="<%=prop.getNick()%>" />
           <input type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" value="Seguir" />
        </form>
            
           <%} }%>     
        
        
        
        
        
        
        <% } else {%>
         <legend id="legendPerf">Información no disponibe</legend><br>
             
        <% } %>
    </body>
</html>
