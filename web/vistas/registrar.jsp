<%-- 
    Document   : registrar
    Created on : 09/09/2018, 02:17:59 PM
    Author     : Nuevo
--%>
<%@ page contentType="text/html; charset=ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <script type="text/javascript">
            function showContent() {
                element = document.getElementById("content");
                check = document.getElementById("proponente");
                check2 = document.getElementById("colaborador");
                if (check.checked) {
                    element.style.display = 'block';
                    document.getElementById("direccion").required = true;
                } else {
                    element.style.display = 'none';
                    document.getElementById("direccion").required = false;
                }
                if (check2.checked) {
                    element.style.display = 'none';
                }
            }
        </script>
    </head>
    <body>
        <h1>Registrarse</h1>

        <form class="form-horizontal" action=../Registrarse method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label class="control-label col-sm-2" for="nick">Nickname:</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="nick" name="nick" placeholder="Nickname">
                    <% if (request.getAttribute("mens") != null) {%>
                    <label for="mens"><%= request.getAttribute("mens")%></label>
                    <% } %>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="nombre">Nombre:</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="apellido">Apellido:</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellido">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="email">Email:</label>
                <div class="col-sm-4">
                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter email">
                    <% if (request.getAttribute("correo") != null) {%>
                    <label for="correo"><%= request.getAttribute("correo")%></label>
                    <% } %>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="fecha">Fecha de nacimiento:</label>
                <div class="col-sm-4">
                    <input type="date" class="form-control" id="fecha" name="fecha">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="pwd">Password:</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Enter password">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="pwd2">Confirmar Password:</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" id="pwd2" name="pwd2" placeholder="Confirmar">
                    <% if (request.getAttribute("pass") != null) {%>
                    <label for="pass"><%= request.getAttribute("pass")%></label>
                    <% } %>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="file" class="btn btn-default" accept="image/*"
                           id="imagen" name="imagen">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="usuario">Seleccione tipo de Usuario:</label>
                <div class="col-sm-4">
                    <input type="radio" name="usuario" value="proponente" id="proponente" onchange="javascript:showContent()" >Proponente
                    <input type="radio" name="usuario" value="colaborador" id="colaborador" onchange="javascript:showContent()" checked="checked">Colaborador
                </div>
            </div>


            <div id="content" style="display: none;">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="dir">Direccion:</label>
                    <div class="col-sm-4">
                        <input type="text" name="direccion" id="direccion" placeholder="Direccion">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="bio">Biografia:</label>
                    <div class="col-sm-4">
                        <textarea name="biografia" rows="10" cols="40" id="biografia" placeholder="Biografia"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="link">Link web:</label>
                    <div class="col-sm-4">
                        <input type="text" name="web" placeholder="Link web" id="web">
                        <% if (request.getAttribute("link") != null) {%>
                        <label for="link"><%= request.getAttribute("link")%></label>
                        <% }%>
                    </div>
                </div>


            </div> 

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default" >Registrarse</button>
                </div>
            </div>


        </form> 
    </body>
</html>
