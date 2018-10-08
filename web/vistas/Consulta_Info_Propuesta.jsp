<%-- 
   Document   : Consulta_Info_Propuesta
   Created on : 14/09/2018, 10:16:05
   Author     : matheo
--%>

<%@page import="Logica.DtUsuario"%>
<%@page import="Logica.Testado"%>
<%@page import="Logica.DtColaborador"%>
<%@page import="java.util.Collection"%>
<%@page import="Logica.DtPropuesta"%>
<%@page import="java.util.List"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <% DtPropuesta propu = (DtPropuesta) request.getAttribute("propu");
        boolean colaboradores = false;
        List<String> x = (List<String>) request.getAttribute("col");
        if (x != null) {
            colaboradores = true;
        }
        boolean Propuso_a_propu = false;
        boolean Colaboro_a_propu = false;
        boolean Puede_colaborar_a_propu = false;
        boolean Ya_comento = false;
        boolean yaFav = false;
        boolean Esta_logeado = false;
        String Nombre_Usuario = "";
        String tipo = "";
        if (request.getSession().getAttribute("sesionAct") != null) {
        String Favo = (String) request.getAttribute("fav");
        String String_Ya_Comento = (String) request.getAttribute("comentario");
        if (String_Ya_Comento.equals("true")) {
            Ya_comento = true;
        }
        if (Favo.equals("true")) {
            yaFav = true;
        }
        if (request.getSession().getAttribute("sesionAct") != null) {   
            Esta_logeado = true;
            Nombre_Usuario = (String) request.getSession().getAttribute("sesionAct");
            tipo = (String) session.getAttribute("tipo");
            if (Nombre_Usuario.equals(propu.getPropo())) {
                Propuso_a_propu = true;
            }
            if (tipo.equals("colaborador")) {
                if (propu.getColabs().containsKey(Nombre_Usuario)) {
                    Colaboro_a_propu = true;
                } else {
                    Puede_colaborar_a_propu = true;
                }
            }
        }  
        }                                                                        %> 
    <head>
        <jsp:include page="/template/head.jsp" />
        <title>Consultar Propuesta: <%propu.getTitulo();%> </title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css">
    </head>
    <body>
        <jsp:include page="/template/header.jsp" />
        <table border=10 >
            <tr>
                <th><b> Titulo </b></th>
                <th><b> Lugar </b></th>
                <th><b> Monto </b></th>
                <th><b> Monto Recaudado </b></th>
                <th><b> Fecha </b></th>
                <th><b> Estado </b></th>
                <th><b> Propuesto por </b></th>
                <th><b> Precio </b></th>
                <th><b> Categoria </b></th>
                <th><b> Retorno </b></th>
            </tr>
            <tr>
                <td><b>  <%= propu.getTitulo()%> </b></td>
                <td><b>  <%= propu.getLugar()%> </b></td>
                <td><b>  <%= propu.getMontototal()%> </b></td>
                <td><b>  <%= propu.getMontoActual()%> </b></td>
                <td><b>  <%= propu.getFecha()%> </b></td>
                <td><b>  <%= propu.getEstActual().getEstado().toString()%> </b></td>
                <td><b>  <%= propu.getPropo()%> </b></td>
                <td><b>  <%= propu.getPrecio()%> </b></td>
                <td><b>  <%= propu.getNombreCate()%></b></td>
                <td><b>  <%= propu.getTRetornos()%></b></td>
            </tr>
        </table>
        <br>
        <br>
        <table border=10>
            <tr>
                <th><b> Descripcion </b></th>
            </tr>
            <tr>
                <td><b><%= propu.getDescripcion()%></b></td>
            </tr>    
        </table>
        <br>
        <% if (propu.getImg() != null && !propu.getImg().equals("")) {              %>
        <img src="/CulturarteWeb/Retornar_imag_propuesta_Servlet?T=${propu.getTitulo()}" width="250" height="250">  
        <%} else {%>                              
        <img id="imagenot" src="/CulturarteWeb/img/pro.jpeg" width="250" height="250">                
        <%}%>
        <br>
        <table border=10><tr><th><b> Colaboradores </b></th></tr>
                    <% if (colaboradores) {                                      %>
                    <% for (String cx : x) {%>
            <tr><td><%= cx%></td></tr>
            <%}%>
            <%}%>
        </tr>
    </table>  


    <table style="position:absolute;top:50px;right:45px; width: 20%" border=10><tr><th><b> Acciones </b></th></tr>
        <% if (Esta_logeado) { %>
        <% if (Puede_colaborar_a_propu && !Nombre_Usuario.equals("") && !propu.getEstActual().getEstado().equals(Testado.Ingresada)) {%>
        <tr>
            <td>
                <form method="post" action="Colaboracion">
                    <input type="hidden" name="T" value="<%=request.getAttribute("titulito")%>">
                    <button type="submit" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                        <i class="material-icons">monetization_on</i>
                    </button>
                    <button  class="mdl-button mdl-js-button mdl-button--accent">
                        Colaborar
                    </button>
                </form>
            </td>
            <% } else if (!Puede_colaborar_a_propu && session.getAttribute("tipo").equals("colaborador") && !propu.getEstActual().getEstado().equals(Testado.Ingresada)) { %>
            <td>
                <div style="color:green">
                    <i class="material-icons">
                        attach_money
                    </i>
                    <b> Usted ya ha colaborado en esta propuesta </b>
                </div>
            </td>
            <% } else { %>
            <td>
                <div style="color:green">
                    <i class="material-icons">
                        highlight_off
                    </i>
                    <b> Accion no disponible </b>
                </div>
            </td>
            <% } %>
        </tr>
        <% if (Colaboro_a_propu && !Nombre_Usuario.equals("") && !Ya_comento && !propu.getEstActual().getEstado().equals(Testado.Ingresada)) {%>
        <style>
            .comentario {
                background-color: #4CAF50;
                color: white;
                padding: 10px 15px;
                margin: 8px 26px;
                border: none;
                cursor: pointer;
                width: 250px;
                font-size:10px;
            }
            .comentario:hover {
                opacity: 0.8;
            }

            /* Center the image and position the close button */
            .imgcontainer {
                text-align: center;
                margin: 24px 0 12px 0;
                position: relative;
            }
            .avatar {
                width: 200px;
                height:200px;
                border-radius: 50%;
            }

            /* The Modal (background) */
            .modal {
                display:none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0,0,0,0.4);
            }

            /* Modal Content Box */
            .modal-content {
                background-color: #fefefe;
                margin: 4% auto 15% auto;
                border: 1px solid #888;
                width: 40%; 
                padding-bottom: 30px;
            }

            /* The Close Button (x) */
            .close {
                position: absolute;
                right: 25px;
                top: 0;
                color: #000;
                font-size: 35px;
                font-weight: bold;
            }
            .close:hover,.close:focus {
                color: red;
                cursor: pointer;
            }

            /* Add Zoom Animation */
            .animate {
                animation: zoom 0.6s
            }
            @keyframes zoom {
                from {transform: scale(0)} 
                to {transform: scale(1)}
            }
        </style>
        <tr>
            <td>
                <fieldset>
                    <button onclick="document.getElementById('modal-wrapper').style.display = 'block'" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                        <i class="material-icons">add</i>
                    </button>  
                    <button  class="mdl-button mdl-js-button mdl-button--accent">
                        Agregar comentario
                    </button>  
                </fieldset>
            </td>

        <div id="modal-wrapper" class="modal">

            <form class="modal-content animate" action="/CulturarteWeb/comentario" method="post">

                <div class="imgcontainer">
                    <span onclick="document.getElementById('modal-wrapper').style.display = 'none'" class="close" title="Cerrar">&times;</span>
                </div>

                <div class="container" align='center'>
                    <textarea name="comentario" id="comentario" placeholder="Comentario" rows="15" cols="40" required="required"></textarea> <br><br>
                    <input type="hidden" name="prop" value="<%=propu.getTitulo()%>">
                    <input type="hidden" name="colab" value="<%=(String) request.getSession().getAttribute("sesionAct")%>">
                    <button type="submit" class="comentario" onSubmit="alert('Comentario agregado')">Comentar</button>
                </div>

            </form>

        </div>
        <script>
            // If user clicks anywhere outside of the modal, Modal will close

            var modal = document.getElementById('modal-wrapper');
            window.onclick = function (event) {
                if (event.target === modal) {
                    modal.style.display = "none";
                }
            };
        </script>
        <%} else if (Ya_comento && !propu.getEstActual().getEstado().equals(Testado.Ingresada)) {%>
        <br>
        <td>
            <div style="color:green">
                <i class="material-icons">
                    comment
                </i>
                <b> Usted ya ha comentado en esta propuesta </b>
            </div>
        </td>
        <% } else { %>
        <td>
            <div style="color:green">
                <i class="material-icons">
                    highlight_off
                </i>
                <b> Accion no disponible </b>
            </div>
        </td>
        <% } %>
    </tr>
    <% if (!Nombre_Usuario.equals("") && !yaFav && !propu.getEstActual().getEstado().equals(Testado.Ingresada)) {%>
    <tr>
        <td>
            <form action="/CulturarteWeb/favorita" method="post">
                <input type="hidden" name="prop" value="<%=propu.getTitulo()%>">
                <input type="hidden" name="usu" value="<%=(String) request.getSession().getAttribute("sesionAct")%>">
                <button type="submit" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                    <i class="material-icons">grade</i>
                </button>
                <button  class="mdl-button mdl-js-button mdl-button--accent">
                    Marcar como Favorita
                </button>
            </form>
        </td>
        <%} else if (yaFav && !propu.getEstActual().getEstado().equals(Testado.Ingresada)) { %>
    <br>
    <td>
        <div style="color:green" >
            <i class="material-icons">
                star
            </i>
            <b> Tiene esta propuesta como favorita </b>
        </div>
    </td>
    <% } else { %>
    <td>
        <div style="color:green">
            <i class="material-icons">
                highlight_off
            </i>
            <b> Accion no disponible </b>
        </div>
    </td>
    <% } %>
</tr>
<% if (Propuso_a_propu && !Nombre_Usuario.equals("") && !propu.getEstActual().getEstado().equals(Testado.Ingresada)) {%>
<tr>
    <td>
        <form action="#" method="get">
            <button type="submit" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                <i class="material-icons">update</i>
            </button>
            <button  class="mdl-button mdl-js-button mdl-button--accent">
                Extender propuesta 
            </button>
        </form>
    </td>
    <% } else { %>
    <td>
        <div style="color:green">
            <i class="material-icons">
                highlight_off
            </i>
            <b> Accion no disponible </b>
        </div>
    </td>
    <% } %>
</tr>

<%  if (Propuso_a_propu && !Nombre_Usuario.equals("") && propu.getEstActual().getEstado().compareTo(Testado.Financiada) == 0) {%>
<tr>
    <td>
        <form method="post" id="ls" class="msformProp" action="borrar_prop">
            <%
                String link = "/consultarPerfil?T=" + propu.getTitulo();
            %>
            <input type="hidden" name="link" value="<%=link%>"/>
            <input type="hidden" name="prop" value="<%=propu.getTitulo()%>"/>
            <button type="submit" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                <i class="material-icons">delete</i>
            </button>
            <button  class="mdl-button mdl-js-button mdl-button--accent">
                Cancelar propuesta
            </button>
        </form>
    </td>
    <% } else { %>
    <td>
        <div style="color:green">
            <i class="material-icons">
                highlight_off
            </i>
            <b> Accion no disponible </b>
        </div>
    </td>
    <% }%> 
    <%  }%>
</tr>
</table>
</body>
</html>

