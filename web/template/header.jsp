<%@page import="Logica.DtUsuario"%>
<%@page import="Servlets.inicSesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
String sesionAct=(String) session.getAttribute("sesionAct");

%>
<div id="header">
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Culturarte</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Mi perfil</a></li>
                                        <li><a href="#">Visitar perfiles</a></li>   
					<li><a href="Consulta_de_propuesta_Servlet">Propuestas</a></li>
                                        <li><a href="alta_prop">Propuestas</a></li>
				</ul>
			   <% if(sesionAct==null) {
                                
                            
                                
                            
                            
                            %>	
                            
                            
                            
				<ul class="nav navbar-nav navbar-right">
					<li><a href="vistas/inicSesion.jsp"><span class="glyphicon "></span>
							Iniciar sesión</a></li>
                                      
				</ul>
                         
                            <ul class="nav navbar-nav navbar-right">
					<li><a href="vistas/registrar.jsp"><span class="glyphicon "></span>
							Registrarse</a></li>
                                      
				</ul>
                            <%
                            
                             }else{

                               DtUsuario user=inicSesion.getUsuarioLogueado(request);
                               String nick=user.getNick();
                               String nombre=user.getNombre();
                               String ape= user.getApellido();
                               String aux1=" ", aux2=" (", aux3=")";
                               String nueva1=nombre.concat(aux1);
                               String nueva2=nueva1.concat(ape);
                               String nueva3=nueva2.concat(aux2);
                               String nueva4=nueva3.concat(nick);
                               String nuevaFin=nueva4.concat(aux3);

                            %>
                            <ul class="nav navbar-nav navbar-right">
					<li><a href="cerrarSesion"><span class="glyphicon "></span>
							Cerrar sesión</a></li>
				</ul>
                            
                       
                            
                             <ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon "></span>
							¡Bienvenido <%out.print(nuevaFin);%>!</a></li>
                                      
				</ul>
                            <%}%>
                            
                            
                            
                            
                            
                            <form class="navbar-form navbar-right" role="search">
					<div class="form-group input-group">
						<input type="text" class="form-control" placeholder="Search..">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>
                                        
				</form>
                            <ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon-perfil"></span>
							Mi perfil</a></li>
                                      
				</ul>
			</div>
		</div>
	</nav>
</div>

