<%@page import="Logica.DtProponente"%>
<%@page import="Logica.DtUsuario"%>
<%@page import="Servlets.inicSesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript" src="../js/Datos.js"></script>
 <div id='cssmenu'>
<ul>
<%  
String sesionAct=(String) session.getAttribute("sesionAct");
 if(sesionAct==null) {

                           
%>
 

<li class="active" ><a href="<%= request.getContextPath() %>/home">CulturArte</a></li>
 <li><a href="consultarPerfil">Visitar perfiles</a></li>
 <li><a href="#">Propuestas</a>
  <ul>
   <li><a href="<%= request.getContextPath() %>/Consulta_de_propuesta_Servlet">Consultar propuestas</a></li>
   <li><a href="<%= request.getContextPath() %>/Consulta_de_Propuesta_por_Categoria">Consultar propuestas por categoria</a></li>
  </ul>
 </li>
 <li><a href="<%= request.getContextPath() %>/Cargar_Datos_Web">Cargar Datos </a></li>  
 
 <li style="float: right"><a href="<%= request.getContextPath() %>/Registrarse">Registrar</a></li>
 <li style="float: right"><a href="<%= request.getContextPath() %>/iniciarS">Iniciar sesión</a></li>
 
    <% 
        }else{

                               DtUsuario user=inicSesion.getUsuarioLogueado(request);
                               String nick=user.getNick();
                               String nombre=user.getNombre();
                               String ape= user.getApellido();
                               String aux1=" ", aux2=" (", aux3=")";
                               String nueva1=nombre+aux1+ape+aux2+nick+aux3;
  
                    String tipoUsu= (String) session.getAttribute("tipo");

                            %>
                           
                            
                            <li class="active"><a href="#">Culturarte</a></li>
 <li><a href="<%= request.getContextPath() %>/consultarPerfil">Visitar perfiles</a></li>
 <li><a href="#">Propuestas</a>
  <ul>
   <li><a href="<%= request.getContextPath() %>/Consulta_de_propuesta_Servlet">Consultar propuestas</a></li>
   <li><a href="<%= request.getContextPath() %>/Consulta_de_Propuesta_por_Categoria">Consultar propuestas por categoria</a></li>
  </ul>
 </li>
 <li><a href="<%= request.getContextPath() %>/Cargar_Datos_Web">Cargar Datos </a></li>  
					<li style="float: right"><a href="<%= request.getContextPath() %>/cerrarSesion"><span class="glyphicon "></span>
							Cerrar sesión</a></li> 
                                                      
                            <li style="float: right"><a href="<%= request.getContextPath() %>/consultarPerfil?T=<%=user.getNick()%>">Mi perfil</a></li>
                     
                            
                             
					<li  style="float: right"><a href="#"><span class="glyphicon "></span>
							¡Bienvenido <%out.print(nueva1);%>!</a></li>
                            <%}%>
                                         <form style="float: right" role="search" class ="msform">
						<input type="text"  placeholder="Search..">
							<button class="btn action-button" type="button"  >Buscar</button>
					
                                        
                                         </form>
                            
        
</ul>
</div>
         
