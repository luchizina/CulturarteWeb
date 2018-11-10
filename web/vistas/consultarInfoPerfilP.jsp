<%-- 
    Document   : consultarInfoPerfilP
    Created on : 19/09/2018, 05:52:47 PM
    Author     : Luchi
--%>
<%@page import="Servlets.inicSesion"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/iconos.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/material.indigo-pink.min.css">
    <script defer src="<%= request.getContextPath()%>/js/material.min.js"></script>
      <script  src="<%= request.getContextPath()%>/js/validar.js"></script>
    <head>
        <script  src="../js/progress.js"></script>
        <jsp:include page="/template/head.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

       

        <%
                String control = (String) request.getAttribute("paso");
                if(control == null){
                    %>
                    <jsp:forward page="ErrorIP.jsp"/>
                    <% }%>
                <%
            servicios.DtUsuario user = (servicios.DtUsuario) request.getAttribute("usuario");
            servicios.DtProponente prop = null;
            if (user instanceof servicios.DtProponente) {
                prop = (servicios.DtProponente) user;

            }
        %>
         <title>Información de : <%= prop.getNick()%></title>
    </head>
    <body>


        <jsp:include page="/template/header.jsp" />
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css" type="text/css">
        <%
            servicios.DtUsuario userop = inicSesion.getUsuarioLogueado(request);
            if (userop != null) {
                String nicko = userop.getNick();
                if (nicko.equals(prop.getNick())) {%>
                
                <form method="post" action="<%=request.getContextPath()%>/desactProp" onsubmit="return desactivar()">
                <input type="hidden" name="nickLogueado" value="<%=userop.getNick()%>"/>
                <input type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" value="Desactivar cuenta"/>
                
                
                </form>
                
                
                
                
                
                
                
                
        <div style="float: right">                                
            <form id="pa" class="msformProp2" action="<%=request.getContextPath()%>/alta_prop" method="post">
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
                List<servicios.DtUsuario> seguidoresPrueb = (List<servicios.DtUsuario>) request.getAttribute("seguidore");
                if (userop.getNick().equals(prop.getNick()) == false) {
                    boolean yaSigue = false;
                    for (int i = 0; i < seguidoresPrueb.size(); i++) {
                        servicios.DtUsuario seguidor = seguidoresPrueb.get(i);

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

                            List<servicios.DtUsuario> seguidos = (List<servicios.DtUsuario>) request.getAttribute("seguido");
                            String Titu = "";

                            if (seguidos.size() > 0) {
                                for (servicios.DtUsuario usea : seguidos) {
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
                                List<servicios.DtUsuario> seguidores = (List<servicios.DtUsuario>) request.getAttribute("seguidore");
                                String Tu = "";

                                if (seguidores.size() > 0) {
                                    for (servicios.DtUsuario usea : seguidores) {
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
                            List<servicios.DtPropuesta> propFavo = (List<servicios.DtPropuesta>) request.getAttribute("propuFav");
                            String pa = "";

                            if (propFavo.size() > 0) {
                                for (servicios.DtPropuesta propu1 : propFavo) {
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
                                    List<servicios.DtPropuesta> MisProps = (List<servicios.DtPropuesta>) request.getAttribute("propus");
                                    String Mu = "";

                                    if (MisProps.size() > 0) {
                                        for (servicios.DtPropuesta MiP : MisProps) {
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

                <form class="msformProp"  enctype="multipart/form-data">
                    
                    <ul id="progressbar">
                        <li class="active"></li>
                        <li></li>
                            <% if (userop != null && userop.getNick().equals(prop.getNick())) {%>
                        <li></li>
                            <% }%>
                    </ul>
                    <fieldset>
                          <legend id="legendErr">Datos generales: </legend>   
                            <div id="perfil_izquierda" style="float: left" >

                            <% if (prop.getLink() != null && !prop.getLink().equals("")) {%>
                            <img id="imagenot" src="/CulturarteWeb/retornarimagen?T=${T}" width="200" height="200">  
                            <%   } else {%>
                            <img id="imagenot" src="<%= request.getContextPath()%>/img/user-4.png" width="200" height="200">
                            <%}%>
                        </div>
                        <div id="perfil_derecha" >
                            
                            <label class="rotulo" style="text-align: left">Nombre completo:</label><br>
                            <label class="valor" style="text-align: left"><%= prop.getNombre()%> <%= prop.getApellido()%> </label><br/>
                            <label class="rotulo" style="text-align: left"> Nickname:</label><br>
                            <label class="valor" style="text-align: left"> <%= prop.getNick()%> </label><br/>
                            
                            <label class="rotulo" style="text-align: left"> Tipo:</label><br/>
                            <label class="valor" style="text-align: left"> Proponente</label><br/>
                            <label class="rotulo" style="text-align: left">Fecha de nacimiento:</label><br/>
                            <label class="valor" style="text-align: left"> <%=new SimpleDateFormat("dd/MM/yyyy").format(prop.getFecha().toGregorianCalendar().getTime())%>                       </label><br/>
                            <label class="rotulo"style="text-align: left">Correo electrónico:   </label><br/>
                            <label class="valor"style="text-align: left"><a href="mailto:<%= prop.getCorreo()%>" ><%= prop.getCorreo()%></a>
                            </label><br/>
                        </div>
                        
                        <input type="button" name="next" class="next action-button" value="Siguiente" />
                    </fieldset>
                    <fieldset>
                          <legend id="legendErr">Datos opcionales: </legend>     
                      
                        <label class="rotulo" style="text-align: left" ><br/>Página Web:</label> <br/>
                            <% if (!prop.getLinkWeb().equals("")) {%>
                        <br/>
                        <label class="valor" style="text-align: left"> <a href="<%= prop.getLinkWeb()%>"><%= prop.getLinkWeb()%></a></label>
                        <% } else {%>
                        <br/>
                        <label class="valor" style="text-align: left"> No tiene página web</label><br/>
                        <%}%>
                        <br/>
                        <label class="rotulo" style="text-align: left">Dirección:</label>
                        <% if (!prop.getDireccion().equals("")) {%>
                        <br/>
                        <label class="valor" style="text-align: left"><%= prop.getDireccion()%></label><br/>
                          <% } else {%>
                        <label class="valor" style="text-align: left"> No tiene dirección</label><br/>
                        <%}%>
                         <label class="rotulo" style="text-align: left">Biografia:</label><br/>
                        <% if (!prop.getBiografia().equals("")) {%>
                        <label class="valor" style="text-align: left"> <%= prop.getBiografia()%></label><br/>
                       <% } else {%>
                        <label class="valor" style="text-align: left"> No tiene biografía</label><br/>
                        <%}%>
                        <br/><br/>
                        <input type="button" name="previous" class="previous action-button" value="Anterior" />
                        <% if (userop != null && userop.getNick().equals(prop.getNick())) {%>
                        <input type="button" name="next" class="next action-button" value="Siguiente" />
                        <%}%>
                    </fieldset>
                    <% if (userop != null && userop.getNick().equals(prop.getNick())) {%>
                    <fieldset>
                          <legend id="legendErr">Mis propuestas </legend>     
                       
                      
                            <!--   <legend id="legendPerf">Seguidores</legend><br>-->
                            <center>
                                <table>
                                    <tr> 
                                        <th>
                                            Título:
                                        </th> 
                                    </tr>
                                    <%
                                        List<servicios.DtPropuesta> MisPropas = (List<servicios.DtPropuesta>) request.getAttribute("propusMias");
                                        String MuA = "";

                                        if (MisPropas.size() > 0) {
                                            for (servicios.DtPropuesta MiP : MisPropas) {
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
                            </center>
                        <input type="button" name="previous" class="previous action-button" value="Anterior" />
                    </fieldset>
                    <%}%>
                </form>




                <% } else {%>
                <legend id="legendPerf">Información no disponibe</legend><br><% }%>
                <script src='<%= request.getContextPath()%>/js/jquery.min.js'></script> 
                <script src='<%= request.getContextPath()%>/js/jquery.easing.min.js'></script>
                <script  src="<%=request.getContextPath()%>/js/index.js"></script>
                </body>
                </html>
