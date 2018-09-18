<%-- 
    Document   : registrar
    Created on : 09/09/2018, 02:17:59 PM
    Author     : Nuevo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Usuarios</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">  
        <link rel="stylesheet" href="../css/style.css">
        
        
            
        
    </head>
    <body>
        <h1>Registrarse</h1>

        <form action=../Registrarse method="POST" enctype="multipart/form-data" id="msform" onsubmit="return vacios()">
            <ul id="progressbar">

                <li class="active">Datos de cuenta</li>
                <li>Datos Personales</li>
                <li>Otros datos</li>
            </ul>
            <script src="../js/jquery.js" type="text/javascript"></script>
            <fieldset>
                <h2 class="fs-title">Complete los siguientes campos</h2>
                <h3 class="fs-subtitle"> Datos de la cuenta </h3> 
                <div class="form-group">
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="nick" name="nick" placeholder="Nickname" onblur="validarusu(this);"/>
                        <% if (request.getAttribute("mens") != null) {%>
                        <label for="mens"><%= request.getAttribute("mens")%></label>
                        <% } %>
                        <span id="avisa"></span> 
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-4">
                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" onblur="validarcorreo(this);">
                        <% if (request.getAttribute("correo") != null) {%>
                        <label for="correo"><%= request.getAttribute("correo")%></label>
                        <% } %>
                        <span id="avisaC"></span> 
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-4">
                        <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Enter password">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-4">
                        <input type="password" class="form-control" id="pwd2" name="pwd2" placeholder="Confirmar">
                        <% if (request.getAttribute("pass") != null) {%>
                        <label for="pass"><%= request.getAttribute("pass")%></label>
                        <% } %>
                    </div>
                </div>
                <input type="button" name="next" class="next action-button" value="Siguiente" />
            </fieldset>

            <fieldset>
                <h2 class="fs-title">Datos personales</h2>
                <div class="form-group">
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellido">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-4">
                        <input type="date" class="form-control" id="fecha" name="fecha" placeholder="Fecha de nacimiento">
                    </div>
                </div>
                <input type="button" name="previous" class="previous action-button" value="Anterior" />
                <input type="button" name="next" class="next action-button" value="Siguiente" />

            </fieldset>
            <fieldset>
                <h2 class="fs-title">Datos sobre el usuario</h2>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="file" class="btn btn-default" accept="image/*"
                               id="imagen" name="imagen">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="usuario">Seleccione tipo de Usuario:</label>
                    <div class="col-sm-4">
                        <label class="control-label col-sm-2" for="proponente">Proponente</label>
                        <input type="radio" name="usuario" value="proponente" id="proponente" onchange="javascript:showContent()" >
                        <label class="control-label col-sm-2" for="colaborador">Colaborador</label>
                        <input type="radio" name="usuario" value="colaborador" id="colaborador" onchange="javascript:showContent()" checked="checked">
                    </div>
                </div>


                <div id="content" style="display: none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <input type="text" name="direccion" id="direccion" placeholder="Direccion">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-4">
                            <textarea name="biografia" rows="10" cols="40" id="biografia" placeholder="Biografia"></textarea>
                        </div>
                    </div>
                    <div class="form-group">

                        <div class="col-sm-4">
                            <input type="url" name="web" placeholder="http://www.example.com" id="web">
                            <% if (request.getAttribute("link") != null) {%>
                            <label for="link"><%= request.getAttribute("link")%></label>
                            <% }%>
                        </div>
                    </div>
                </div> 
                <input type="button" name="previous" class="previous action-button" value="Anterior" />
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default" id="botoncito">Registrarse</button>
                    </div>
                </div>
            </fieldset>
            <script  src="../js/prototype.js"></script>
            <script  src="../js/validar.js"></script>
            <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
            <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
            
          
        </form> 
           <script src="../js/index.js"></script>
             <script type="text/javascript" src="../js/prototype.js" ></script>
            <script type="text/javascript" src="../js/validar.js"></script>
    </body>
</html>
