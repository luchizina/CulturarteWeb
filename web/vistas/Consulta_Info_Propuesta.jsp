<%-- 
   Document   : Consulta_Info_Propuesta
   Created on : 14/09/2018, 10:16:05
   Author     : matheo
--%>

<%@page import="java.lang.String"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.List"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <script  src="<%= request.getContextPath()%>/js/validar.js"></script>
    <% servicios.DtPropuesta propu = (servicios.DtPropuesta) request.getAttribute("propu");
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
                if (Nombre_Usuario.equals(propu.getPropoACargo())) {
                    Propuso_a_propu = true;
                }

                if (tipo.equals("colaborador")) {
                    List<servicios.DtPropuesta.Colaboradores.Entry> lista = propu.getColaboradores().getEntry();
                    for (servicios.DtPropuesta.Colaboradores.Entry p : lista) {
                        if (p.getKey().equals(Nombre_Usuario)) {
                            Colaboro_a_propu = true;
                        }
                    }
                    if (!Colaboro_a_propu) {
                        Puede_colaborar_a_propu = true;
                    }

                }
            }
        }                                                                   %> 
    <head>
        <jsp:include page="/template/head.jsp" />
        <title>Consultar Propuesta: <%propu.getTitulo();%> </title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/pop.css">
    </head>
    <body>
        <jsp:include page="/template/header.jsp" />
        <form class="msformProp" enctype="multipart/form-data" style="position: absolute; top: 10px; left: 225px; color:green">
            <fieldset>
                <legend id="legendErr">Información básica: </legend> 
                <div id="perfil_izquierda" style="float: left">
                    <% if (propu.getImg() != null && !propu.getImg().equals("")) {%>
                    <img id="imagenot" src="/CulturarteWeb/Retornar_imag_propuesta_Servlet?T=${propu.getTitulo()}" width="200" height="200">  
                    <%   } else {%>          
                    <img id="imagenot" src="/CulturarteWeb/img/pro.jpeg" width="200" height="200">   
                    <%    }%>
                </div>

                <div id="perfil_derecha">

                    <div class="contenedor">

                        <label class="rotulo" style="text-align: left">Titulo:</label>
                        <label class="valor" style="text-align: left"><%= propu.getTitulo()%></label><br/>
                        <label class="rotulo" style="text-align: left"> Lugar:</label>
                        <label class="valor" style="text-align: left"><%= propu.getLugar()%> </label><br/>
                        <label class="rotulo" style="text-align: left"> Categoria:</label>
                        <label class="valor" style="text-align: left"><%= propu.getCategoria()%> </label><br/>
                        <label class="rotulo" style="text-align: left"> Tipo de retorno:</label>
                        <label class="valor" style="text-align: left"><%= propu.getTRetornos()%> </label><br/>
                        <label class="rotulo" style="text-align: left"> Precio de entrada:</label>
                        <label class="valor" style="text-align: left"><%= propu.getPrecio()%> </label><br/>
                        <label class="rotulo" style="text-align: left"> Monto necesario:</label>
                        <label class="valor" style="text-align: left"><%= propu.getMontoTotal()%> </label><br/>
                        <label class="rotulo" style="text-align: left"> Monto recaudado:</label>
                        <label class="valor" style="text-align: left"><%= propu.getMontoActual()%></label><br/>
                        <label class="rotulo" style="text-align: left">Fecha de realizacion:</label>
                        <label class="valor" style="text-align: left">

                            <%=new SimpleDateFormat("dd/MM/yyyy").format(propu.getFecha().toGregorianCalendar().getTime())%>
                        </label><br/>
                        <label class="rotulo" style="text-align: left"> Estado actual:</label>
                        <% if (propu.getEstActual().getEstado().equals(servicios.Testado.EN_FINANCIACION)) { %>
                        <label class="valor" style="text-align: left">En financiacion</label><br/>
                        <% } else if (propu.getEstActual().getEstado().equals(servicios.Testado.NO_FINANCIADA)) { %>
                        <label class="valor" style="text-align: left">No financiada</label><br/>
                        <% } else {%>
                        <label class="valor" style="text-align: left"><%= propu.getEstActual().getEstado().toString()%></label><br/>
                        <% }%>
                        <div style="text-align: left">
                            <label class="rotulo" style="text-align: left">Propuesto por:</label>
                            <label class="valor" style="text-align: left">
                                <a href="consultarPerfil?T=<%= propu.getPropoACargo()%>">
                                    <%= propu.getPropoACargo()%>
                                </a>
                            </label>
                        </div>
                        <div style="float: left">
                            <label class="rotulo" style="text-align: left"> Descripcion:</label>
                            <label class="valor" style="text-align: left"><%= propu.getDesc()%></label><br/>
                        </div>
                    </div>
                    <br>
                    <br>

                </div>
            </fieldset>
        </form>

        <div style="position: absolute; top: 150px; left: 60px; color:green">
            <div id="divTablas" class="datagrid">
                <legend id="legendPerf">Colaboradores</legend><br>
                <right>
                    <table class="datagrid">
                        <% if (colaboradores) {                                      %>
                        <% for (String cx : x) {
                                String[] col = cx.split("\\(");;
                                String h = col[1];
                                String ni = h.replace(")", "");
                        %>
                        <tr><td><a href=consultarPerfil?T=<%=ni%>> <%= cx%>  </a></td></tr>
                        <%}%>
                        <%} else {%>
                        <tr><td>
                                <i class="material-icons" >mood_bad</i>
                                <label> No tiene colaboradores </label></td></tr><%}%>
                    </table>
                </right>
            </div>
        </div> 

        <div style="position: absolute; top:70px;right:45px; width: 25%; color:green">
            <div id="divTablas" class="datagrid">
                <legend id="legendPerf">Comentarios</legend><br>
                <right>
                    <table class="datagrid">
                        <%
                            List<servicios.DtComentarios> props = (List<servicios.DtComentarios>) request.getAttribute("coment");
                            String com = "";
                            String col = "";
                            if (props.size() > 0) {
                                for (servicios.DtComentarios prop : props) {
                                    com = prop.getComentario();
                                    col = prop.getNick();
                        %>
                        <tr><td><%= col%> : <%= com%></td></tr>
                        <%}%>
                        <%} else {%>
                        <td>
                            <div style="color:green">
                                <i class="material-icons">
                                    comment
                                </i>
                                <b> Esta propuesta no tiene comentarios </b>
                            </div>
                        </td>
                        <% }%>
                        <% if (Colaboro_a_propu && !Nombre_Usuario.equals("") && !Ya_comento && !propu.getEstActual().getEstado().equals(servicios.Testado.INGRESADA)) {%>
                        <tr><td> <form action="/CulturarteWeb/comentario" method="post" onSubmit="alert('Comentario agregado');">

                                    <div class="container" align='center'>
                                        <textarea name="comentario" id="comentario" style="font-family: Arial; font-size: 12pt;" placeholder="Comentario" rows="5" cols="35" required="required"></textarea> <br><br>
                                        <input type="hidden" name="prop" value="<%=propu.getTitulo()%>">
                                        <input type="hidden" name="colab" value="<%=(String) request.getSession().getAttribute("sesionAct")%>">
                                        <button type="submit" class="comentario">Comentar</button>
                                    </div>

                                </form></td></tr>
                                <%} else if (Ya_comento && !propu.getEstActual().getEstado().equals(servicios.Testado.INGRESADA)) {%>
                        <br>
                        <td>
                            <div style="color:green">
                                <i class="material-icons">
                                    comment
                                </i>
                                <b> Usted ya ha comentado en esta propuesta </b>
                            </div>
                        </td>
                        <% }  %>
                    </table>
                </right>
            </div>
        </div> 

        <% if (Esta_logeado) { %>
        <div style="position: absolute; top: 70px; left: 60px; color:green; background: white">
            <fieldset>
                <button onclick="document.getElementById('modal-wrapper').style.display = 'block'" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                    <i class="material-icons">add</i>
                </button>  
                <button  class="mdl-button mdl-js-button mdl-button--accent">
                    Ver acciones
                </button>  
            </fieldset>
        </div>
        <div id="modal-wrapper" class="modal" style="width: 100%; color:green">
            <div class="modal-content animate">
                <div class="imgcontainer">
                    <span onclick="document.getElementById('modal-wrapper').style.display = 'none'" class="close" title="Cerrar">&times;</span>
                </div>
                <div class="container" align='center' style="width: 100%;">
                    <div id="divTablas" class="datagrid" align='center' style="width: 100%;">
                        <legend id="legendPerf">Acciones</legend><br>
                        <right>
                            <table class="datagrid" align='center' style="width: 100%;">
                                <% if (Puede_colaborar_a_propu && !Nombre_Usuario.equals("") && !propu.getEstActual().getEstado().equals(servicios.Testado.INGRESADA)) {%>
                                <tr>
                                    <td>
                                        <form method="post" action="Colaboracion" >
                                            <input type="hidden" name="T" value="<%=request.getAttribute("titulito")%>">
                                            <button type="submit" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                                                <i class="material-icons">monetization_on</i>
                                            </button>
                                            <button  class="mdl-button mdl-js-button mdl-button--accent">
                                                Colaborar
                                            </button>
                                        </form>
                                    </td>
                                    <% } else if (!Puede_colaborar_a_propu && session.getAttribute("tipo").equals("colaborador") && !propu.getEstActual().getEstado().equals(servicios.Testado.INGRESADA)) { %>
                                    <td>
                                        <div style="color:green">
                                            <i class="material-icons">
                                                attach_money
                                            </i>
                                            <b> Usted ya ha colaborado en esta propuesta </b>
                                        </div>
                                    </td>
                                    <% } %>

                                </tr>

                                <% if (!Nombre_Usuario.equals("") && !yaFav && !propu.getEstActual().getEstado().equals(servicios.Testado.INGRESADA)) {%>
                                <tr>
                                    <td>
                                        <form action="/CulturarteWeb/favorita" method="post" onSubmit="alert('Propuesta agregada a favoritos');">
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
                                    <%} else if (yaFav && !propu.getEstActual().getEstado().equals(servicios.Testado.INGRESADA)) { %>
                                <br>
                                <td>
                                    <div style="color:green" >
                                        <i class="material-icons">
                                            star
                                        </i>
                                        <b> Tiene esta propuesta como favorita </b>
                                    </div>
                                </td>
                                <% }  %>

                                </tr>
                                <% if (Propuso_a_propu && !Nombre_Usuario.equals("") && (propu.getEstActual().getEstado().equals(servicios.Testado.PUBLICADA) || propu.getEstActual().getEstado().equals(servicios.Testado.EN_FINANCIACION))) {%>
                                <tr>
                                    <td>
                                        <form action="/CulturarteWeb/extender" method="post" onsubmit="return extender()">
                                            <input type="hidden" name="prop" id="prop" value="<%=propu.getTitulo()%>">
                                            <button type="submit" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                                                <i class="material-icons">update</i>
                                            </button>
                                            <button  class="mdl-button mdl-js-button mdl-button--accent">
                                                Extender propuesta 
                                            </button>
                                        </form>
                                    </td>
                                    <% }  %>

                                </tr>

                                <%  if (Propuso_a_propu && !Nombre_Usuario.equals("") && propu.getEstActual().getEstado().compareTo(servicios.Testado.FINANCIADA) == 0) {%>
                                <tr>
                                    <td>
                                        <form method="post" id="ls" action="borrar_prop" onsubmit="return cancelar()">
                                            <%
                                                String link = "/consultarPerfil?T=" + propu.getTitulo();
                                            %>
                                            <input type="hidden" name="link" value="<%=link%>">
                                            <input type="hidden" name="prop" value="<%=propu.getTitulo()%>">
                                            <button type="submit" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                                                <i class="material-icons">delete</i>
                                            </button>
                                            <button  class="mdl-button mdl-js-button mdl-button--accent">
                                                Cancelar propuesta
                                            </button>
                                        </form>
                                    </td>
                                    <% } %>

                                </tr>
                                <%  }%>
                            </table>
                        </right>
                    </div>
                </div> 
            </div>
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
    </body>
</html>

