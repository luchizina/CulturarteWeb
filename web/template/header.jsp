<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
					<li><a href="#">Propuestas</a></li>
				</ul>
				
				<ul class="nav navbar-nav navbar-right">
					<li><a href="inicSesion.jsp"><span class="glyphicon "></span>
							Iniciar sesión</a></li>
                                      
				</ul>
                            <ul class="nav navbar-nav navbar-right">
					<li><a href="vistas/registrar.jsp"><span class="glyphicon "></span>
							Registrarse</a></li>
                                      
				</ul>
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

