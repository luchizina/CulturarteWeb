<%@page import="Logica.DtProponente"%>
<%@page import="Logica.DtUsuario"%>
<%@page import="Servlets.inicSesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
String sesionAct=(String) session.getAttribute("sesionAct");

%>
 <script type="text/javascript" src="../js/Datos.js"></script>
 
    
    
 <ul id="menu-bar">
 <li class="active"><a href="#">Culturarte</a></li>
 <li><a href="consultarPerfil">Visitar perfiles</a></li>
 <li><a href="#">Propuestas</a>
  <ul>
   <li><a href="Consulta_de_propuesta_Servlet">Consultar propuestas</a></li>
   <li><a href="Consulta_de_Propuesta_por_Categoria">Consultar propuestas por categoria</a></li>
  </ul>
 </li>
 <li><a href="Cargar_Datos_Web">Cargar Datos </a></li>  
  <% if(sesionAct==null) {

                            %>	
 <li style="float: right"><a href="Registrar">Registrar</a></li>
 <li style="float: right"><a href="iniciarS">iniciar sesión</a></li>
 <li style="float: right"><a href="#">Mi perfil</a></li>
    <% 
        }else{

                               DtUsuario user=inicSesion.getUsuarioLogueado(request);
                               String nick=user.getNick();
                               String nombre=user.getNombre();
                               String ape= user.getApellido();
                               String aux1=" ", aux2=" (", aux3=")";
                               String nueva1=nombre+aux1+ape+aux2+nick+aux3;
  


                            %>
                           
					<li style="float: right"><a href="cerrarSesion"><span class="glyphicon "></span>
							Cerrar sesión</a></li> 
                            
                       
                            
                             
					<li  style="float: right"><a href="#"><span class="glyphicon "></span>
							¡Bienvenido <%out.print(nueva1);%>!</a></li>
                            <%}%>
                             <form style="float: right" role="search">
					
						<input type="text" class="form-control" placeholder="Search..">
							<button class="btn btn-default" type="button"  >Buscar</button>
					
                                        
				</form>
                            
        
</ul>
                             
                             <script type="text/css" src="../css/style.css"></script>