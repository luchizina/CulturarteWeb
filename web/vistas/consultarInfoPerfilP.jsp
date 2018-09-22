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
        String nicko=userop.getNick();
            if(nicko.equals(prop.getNick())){%>
           
            <form class = msform style="float: right" action="<%=request.getContextPath()%>/alta_prop" method="post">
                <button type="submit" class="btn action-button" id="botoncito">Dar propuestas de alta</button>
            </form>
          
        <%}%>
       
       
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
                              
                      <img id="imagenot" src="/CulturarteWeb/img/user-4.png" width="250" height="250">
                             
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
       
       
        
        <% } else {%>
         <legend id="legendPerf">Información no disponibe</legend><br>
             
        <% } %>
    </body>
</html>
