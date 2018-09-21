<%-- 
    Document   : consultarInfoPerfil
    Created on : 17/09/2018, 07:33:23 PM
    Author     : nambr
--%>

<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Logica.DtColaborador"%>
<%@page import="Logica.DtProponente"%>
<%@page import="Logica.DtUsuario"%>
<%@page import="Logica.DtPropuesta"%>
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
                 Titu = usea.getNick().replace(" ", "-");
                
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
           <!--   <legend id="legendPerf">Seguidores</legend><br>-->
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
              </div>
        <form style="float: both">
            <div id="divTablas" class="datagrid">
              <!--<legend id="legendPerf">Propuestas</legend><br>-->
                        <right>
           <table class="datagrid">
            <tr> 
                <th>
                    Colaboraciones
                </th> 
            </tr>
            
              <%
                List<DtPropuesta> props= (List<DtPropuesta>) request.getAttribute("propuCol");
                 String Tup ="";
                
                if(props.size()>0){
                for ( DtPropuesta propa : props) {
                 Tup = propa.getTitulo().replace(" ", "-");
            %>
            <tr>
                <td>
                    <a href=Consulta_de_propuesta_Servlet?T=<%=Tup%>>
                        <%= propa.getTitulo()%> 
                    </a>
                    </td>
            </tr>
            <%} } else{ %>
             <td> no tiene colaboraciones    </td>
            <%} %>
        </table>
         </right>
              </div>
          <form style="float: both">
            <div id="divTablas23" class="datagrid">
              <!--<legend id="legendPerf">Propuestas</legend><br>-->
                        <right>
           <table class="datagrid">
            <tr> 
                <th>
                    Propuestas favoritas
                </th> 
            </tr>
            
              <%
                List<DtPropuesta> propFavo= (List<DtPropuesta>) request.getAttribute("propuFav");
                 String pa ="";
                
                if(props.size()>0){
                for ( DtPropuesta propu1 : propFavo) {
                 pa = propu1.getTitulo().replace(" ", "-");
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
        
        
        
        <% } else {%>
         <legend id="legendPerf">Información del usuario</legend><br>
             
        <% } %>
    </body>
</html>
