
<%@page import="Servlets.inicSesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<script type="text/javascript" src="../js/Datos.js"></script>
 <div id='cssmenu'>
<ul>
<%  
String sesionAct=(String) session.getAttribute("sesionAct");
 if(sesionAct==null) {

                           
%>
 

<li class="active" ><a href="<%= request.getContextPath() %>/index.html">CulturArte</a></li>
 <li><a href="consultarPerfil">Visitar perfiles</a></li>
 <li><a href="#">Propuestas</a>
  <ul>
   <li><a href="<%= request.getContextPath() %>/Consulta_de_propuesta_Servlet">Consultar propuestas</a></li>
   <li><a href="<%= request.getContextPath() %>/Consulta_de_Propuesta_por_Categoria">Consultar propuestas por categoria</a></li>
  </ul>
 </li>  
 
 <li style="float: right"><a href="<%= request.getContextPath() %>/Registrarse">Registrar</a></li>
 <li style="float: right"><a href="<%= request.getContextPath() %>/iniciarS">Iniciar sesión</a></li>
 <li><a href="<%= request.getContextPath() %>/Consulta_de_propuesta_Servlet">Quiero ver una propuesta</a></li>
 
    <% 
        }else{

                               servicios.DtUsuario user=inicSesion.getUsuarioLogueado(request);
                               String nombre=user.getNombre();
                               String ape= user.getApellido();
                               
                               String nueva1=nombre+" "+ape;
  
                    String tipoUsu= (String) session.getAttribute("tipo");

                            %>
                           
                            
                            <li class="active"><a href="<%= request.getContextPath() %>/home">Culturarte</a></li>
 <li><a href="<%= request.getContextPath() %>/consultarPerfil">Visitar perfiles</a></li>
 <li><a href="#">Propuestas</a>
  <ul>
   <li><a href="<%= request.getContextPath() %>/Consulta_de_propuesta_Servlet">Consultar propuestas</a></li>
   <li><a href="<%= request.getContextPath() %>/Consulta_de_Propuesta_por_Categoria">Consultar propuestas por categoria</a></li>
  </ul>
 </li>
  <li><a href="<%= request.getContextPath() %>/Consulta_de_propuesta_Servlet">Quiero ver una propuesta</a></li> 
 <% if(tipoUsu.equals("proponente")){ %>
 <li><a style="color: #FFFFFF">|</a></li>
 <li><a href="<%= request.getContextPath() %>/alta_prop">Tengo una propuesta</a></li>
<% } %>
  <li style="float: right"><a href="<%= request.getContextPath() %>/cerrarSesion">Cerrar sesión</a></li> 
                                                      
 <li style="float: right"><a href="<%= request.getContextPath() %>/consultarPerfil?T=<%=user.getNick()%>">Mi perfil</a></li>
                     
                            
                             
					<li  style="float: right"><a href="#"><span class="glyphicon "></span>
							¡Bienvenido <%out.print(nueva1);%>!</a></li>
                            <%}%>
                                         <form style="float: right" role="search" class ="msform" action="/CulturarteWeb/buscador" method="POST">
                                             <input type="text"  placeholder="Titulo, lugar, descripcion" id="Buscador" name="busca">
							
					
                                        
                                         </form>
                            
        
</ul>
</div>
         
