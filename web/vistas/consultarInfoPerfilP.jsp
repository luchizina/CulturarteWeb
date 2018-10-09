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
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <head>
        <script  src="../js/progress.js"></script>
        <jsp:include page="/template/head.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Información de usuario</title>

        <%
            DtUsuario user = (DtUsuario) request.getAttribute("usuario");
            DtProponente prop = null;
            if (user instanceof DtProponente) {
                prop = (DtProponente) user;

            }
        %>

    </head>
    <body>


        <jsp:include page="/template/header.jsp" />
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css" type="text/css">
        <%
            DtUsuario userop = inicSesion.getUsuarioLogueado(request);
            if (userop != null) {
                String nicko = userop.getNick();
                if (nicko.equals(prop.getNick())) {%>
        <div style="float: right">                                
            <form id="pa" class="msformProp" action="<%=request.getContextPath()%>/alta_prop" method="post">
                <fieldset>
                    <button type="submit" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                        <i class="material-icons">add</i>
                    </button>  
                    <button type="submit" class="mdl-button mdl-js-button mdl-button--accent">
                        Alta de propuesta
                    </button>  
                </fieldset>
            </form>

            <form id="msform" style="clear: both">


            </form>
        </div>
        <%}
            }%>
        <% if (prop != null) {%>
        <%  if (userop != null) {
                List<DtUsuario> seguidoresPrueb = (List<DtUsuario>) request.getAttribute("seguidore");
                if (userop.getNick().equals(prop.getNick()) == false) {
                    boolean yaSigue = false;
                    for (int i = 0; i < seguidoresPrueb.size(); i++) {
                        DtUsuario seguidor = seguidoresPrueb.get(i);

                        if (seguidor.getNick().equals(userop.getNick())) {
                            yaSigue = true;
                        }

                    }
                    if (yaSigue == true) {

        %>
        <form method="post" action="dejarDeSeguir">
            <%String link2 = "/consultarPerfil?T=" + prop.getNick();%>
            <input type="hidden" name="link" value="<%=link2%>"/>
            <input type="hidden" name="nickLogueado" value="<%=userop.getNick()%>"/>
            <input type="hidden" name="nickASeguir" value="<%=prop.getNick()%>" />
            <input type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" value="Dejar de seguir" />
        </form>
        <% } else {%> 
        <form method="post" action="seguirUsuario">

            <%
                String link = "/consultarPerfil?T=" + prop.getNick();
            %>
            <input type="hidden" name="link" value="<%=link%>"/>
            <input type="hidden" name="nickLogueado" value="<%=userop.getNick()%>"/>
            <input type="hidden" name="nickASeguir" value="<%=prop.getNick()%>" />
            <input type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" value="Seguir" />
        </form>
        <%}
                }
            }%>     

        <form  style="position: absolute; top: 200px; left: 40px; color:green" >
            <div id="divTablas" class="datagrid">
                <legend id="legendPerf">Usuarios seguidos</legend><br>
                <right>
                    <table class="datagrid">
                        <tr> 
                            <th>
                                Nombre:
                            </th> 
                        </tr>
                        <%

                            List<DtUsuario> seguidos = (List<DtUsuario>) request.getAttribute("seguido");
                            String Titu = "";

                            if (seguidos.size() > 0) {
                                for (DtUsuario usea : seguidos) {
                                    Titu = usea.getNick().replace(" ", "+");

                        %>
                        <tr>
                            <td>
                                <%= usea.getNombre()%>  <%= usea.getApellido()%> (<a href=consultarPerfil?T=<%=Titu%>> <%= usea.getNick()%> </a>)

                            </td>
                        </tr>
                        <%}
                        } else { %>
                        <td> no tiene seguidos   </td>
                        <%} %>
                    </table>
                </right>
            </div>

            <form id="msform" style="clear: both">
                <div id="divTablas" class="datagrid">
                    <legend id="legendPerf">Seguidores</legend><br>
                    <right>
                        <table class="datagrid">
                            <tr> 
                                <th>
                                    Nombre:
                                </th> 
                            </tr>
                            <%
                                List<DtUsuario> seguidores = (List<DtUsuario>) request.getAttribute("seguidore");
                                String Tu = "";

                                if (seguidores.size() > 0) {
                                    for (DtUsuario usea : seguidores) {
                                        Tu = usea.getNick().replace(" ", "+");

                            %>
                            <tr>
                                <td>
                                    <%= usea.getNombre()%>  <%= usea.getApellido()%> (<a href=consultarPerfil?T=<%=Tu%>> <%= usea.getNick()%> </a>)
                                </td>
                            </tr>
                            <%}
                            } else { %>
                            <td> no tiene seguidores   </td>
                            <%} %>
                        </table>
                    </right>
                </div> 
            </form >
            
            
            <form style="position: absolute; top: 200px; right: 40px; color:green" >
                <div id="divTablas" class="datagrid" >
                    <legend id="legendPerf">Propuestas favoritas</legend><br>
                  
                        <table class="datagrid">
                            <tr> 
                                <th>
                                    Nombre:
                                </th> 
                            </tr>

                            <%
                                List<DtPropuesta> propFavo = (List<DtPropuesta>) request.getAttribute("propuFav");
                                String pa = "";

                                if (propFavo.size() > 0) {
                                    for (DtPropuesta propu1 : propFavo) {
                                        pa = propu1.getTitulo().replace(" ", "+");
                            %>
                            <tr>
                                <td>
                                    <a href=Consulta_de_propuesta_Servlet?T=<%=pa%>>
                                        <%= propu1.getTitulo()%> 
                                    </a>
                                </td>
                            </tr>
                            <%}
                                } else { %>
                            <td> no tiene ninguna  </td>
                            <%} %>
                        </table>
                  
                </div>
                <form id="msform" style="float: right">
                    <div id="divTablas" class="datagrid">
                        <legend id="legendPerf">Propuestas realizadas</legend><br>
                        <right>
                            <table class="datagrid">
                                <tr> 
                                    <th>
                                        Nombre:
                                    </th> 
                                </tr>
                                <%
                                    List<DtPropuesta> MisProps = (List<DtPropuesta>) request.getAttribute("propus");
                                    String Mu = "";

                                    if (MisProps.size() > 0) {
                                        for (DtPropuesta MiP : MisProps) {
                                            Mu = MiP.getTitulo().replace(" ", "+");

                                %>
                                <tr>
                                    <td>
                                        <a href=Consulta_de_propuesta_Servlet?T=<%=Mu%>>
                                            <%= MiP.getTitulo()%> (<%= MiP.getEstActual().getEstado().toString()%>)
                                        </a>
                                    </td>

                                </tr>

                                <%}
                                    } else { %>
                                <td> No tiene ninguna propuesta</td>
                                <%} %>
                            </table>
                        </right>
                    </div>

                </form>  

                <form id="msform"  enctype="multipart/form-data">

                    <ul id="progressbar">
                        <li class="active">Datos generales</li>
                        <li>Datos opcionales</li>
                        <% if (userop != null && userop.getNick().equals(prop.getNick())) {%>
                        <li>Mis propuestas</li>
                            <% }%>
                    </ul>
                    <fieldset>
                        <div id="divLeg">
                            <legend id="legendPerf">Información del usuario</legend><br>
                        </div>

                        <div id="perfil_derecha">

                            <h2 class="fs-title">Información básica</h2>
                            <label class="rotulo">Nombre:</label>
                            <label class="valor"> <br/><%= prop.getNombre()%> <%= prop.getApellido()%> </label>
                            <br/>
                            <label class="rotulo"> Nickname:</label>
                            <label class="valor"> <br/><%= prop.getNick()%> </label><br/>
                            <label class="rotulo"> Tipo:</label>
                            <label class="valor"> <br/>Proponente</label><br/>
                            <label class="rotulo">Fecha de nacimiento:</label>
                            <label class="valor"> <br/>
                                <%=new SimpleDateFormat("dd/MM/yyyy").format(prop.getFecha())%>
                            </label><br/>
                            <label class="rotulo">Correo electrónico:   </label>
                            <label class="valor"><a href="mailto:<%= prop.getCorreo()%>" ><br/><%= prop.getCorreo()%></a>
                            </label><br/>
                        </div>
                        <input type="button" name="next" class="next action-button" value="Siguiente" />
                    </fieldset>
                    <fieldset>
                        <div id="perfil_izquierda">

                            <% if (prop.getImg() != null && !prop.getImg().equals("")) {%>
                            <img id="imagenot" src="/CulturarteWeb/retornarimagen?T=${T}" width="250" height="250">  
                            <%   } else {%>
                            <img id="imagenot" src="<%= request.getContextPath()%>/img/user-4.png" width="250" height="250">
                            <%}%>
                        </div>
                        <% if (!prop.getLinkWeb().equals("")) {%>
                        <label class="rotulo"><br/>Pagina Web:</label><br/>
                        <label class="valor"> <a href="<%= prop.getLinkWeb()%>">
                                <%= prop.getLinkWeb()%>
                            </a></label><br/>
                            <% }%>
                            <% if (!prop.getDireccion().equals("")) {%>
                        <label class="rotulo">Dirección:</label><br/>
                        <label class="valor"><%= prop.getDireccion()%></label><br/>
                        <% } %>
                        <% if (!prop.getBiografia().equals("")) {%>
                        <label class="rotulo"><br/>Biografia:</label><br/>
                        <label class="valor"> <br/> <%= prop.getBiografia()%></label>
                            <% }%>
                        <input type="button" name="previous" class="previous action-button" value="Anterior" />
                        <% if ( userop != null && userop.getNick().equals(prop.getNick())) {%>
                        <input type="button" name="next" class="next action-button" value="Siguiente" />
                        <%}%>
                    </fieldset>
                    <% if (userop != null &&  userop.getNick().equals(prop.getNick())) {%>
                    <fieldset>
                        <legend id="legendErr">Mis propuestas</legend>
                        <div id="divTablas" class="datagrid">
                            <!--   <legend id="legendPerf">Seguidores</legend><br>-->
                            <right>
                                <table class="datagrid">
                                    <tr> 
                                        <th>
                                            Título:
                                        </th> 
                                    </tr>
                                    <%
                                        List<DtPropuesta> MisPropas = (List<DtPropuesta>) request.getAttribute("propusMias");
                                        String MuA = "";

                                        if (MisPropas.size() > 0) {
                                            for (DtPropuesta MiP : MisPropas) {
                                                MuA = MiP.getTitulo().replace(" ", "+");

                                    %>
                                    <tr>
                                        <td>
                                            <a href=Consulta_de_propuesta_Servlet?T=<%=MuA%>>
                                                <%= MiP.getTitulo()%> (<%= MiP.getEstActual().getEstado().toString()%>)
                                            </a>
                                        </td>

                                    </tr>

                                    <%}
                            } else { %>
                                    <td> No tiene ninguna propuesta</td>
                                    <%} %>
                                </table>
                            </right>
                        </div>
                        <input type="button" name="previous" class="previous action-button" value="Anterior" />
                    </fieldset>
                    <%}%>
                </form>




                <% } else {%>
                <legend id="legendPerf">Información no disponibe</legend><br><% }%>
                <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script> 
                <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
                <script  src="<%=request.getContextPath()%>/js/index.js"></script>
                </body>
                </html>
