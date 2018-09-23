<%-- 
   Document   : Consulta_Info_Propuesta
   Created on : 14/09/2018, 10:16:05
   Author     : matheo
--%>

<%@page import="Logica.DtColaborador"%>
<%@page import="java.util.Collection"%>
<%@page import="Logica.DtPropuesta"%>
<%@page import="java.util.List"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        String Nombre_Usuario = "";
        String tipo = "";
        String Favo = (String) request.getAttribute("fav");
        String String_Ya_Comento = (String) request.getAttribute("comentario");
        if(String_Ya_Comento.equals("true")){
            Ya_comento = true;
        }
        if(Favo.equals("true")){
            yaFav = true;
        }
        if (request.getSession().getAttribute("sesionAct") != null) {
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
        <% if(propu.getImg()!=null){                                             %>
            <img src="/CulturarteWeb/Retornar_imag_propuesta_Servlet?T=${propu.getTitulo()}" width="250" height="250">  
        <%}else{%>                              
            <img id="imagenot" src="/CulturarteWeb/img/pro.jpeg" width="250" height="250">                
        <%}%>
        <br>
        <table border=10><tr><th><b> Colaboradores </b></th></tr>
                    <% if (colaboradores){                                      %>
                    <% for (String cx : x) {                                    %>
            <tr><td><%= cx%></td></tr>
            <%}%>
            <%}%>
        </tr>
    </table>  

    <% if (Puede_colaborar_a_propu && !Nombre_Usuario.equals("")) {          %>
    <form method="post" action="Colaboracion">
            <input type="hidden" name="T" value="<%=request.getAttribute("titulito")%>">
            <input type="submit" value="Colaborar">
        </form>
    <% } %>

    <% if (Colaboro_a_propu && !Nombre_Usuario.equals("") && !Ya_comento) {     %>
    <style>
        *{margin:0px; padding:0px; font-family:Helvetica, Arial, sans-serif;}

        /* Set a style for all buttons */
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            margin: 8px 26px;
            border: none;
            cursor: pointer;
            width: 250px;
            font-size:10px;
        }
        button:hover {
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
    <button onclick="document.getElementById('modal-wrapper').style.display = 'block'" style="width:200px; margin-top:200px; margin-left:160px;">
        Agregar comentario</button>

    <div id="modal-wrapper" class="modal">

        <form class="modal-content animate" action="/CulturarteWeb/comentario" method="post">

            <div class="imgcontainer">
                <span onclick="document.getElementById('modal-wrapper').style.display = 'none'" class="close" title="Close PopUp">&times;</span>
            </div>

            <div class="container" align='center'>
                <textarea name="comentario" id="comentario" placeholder="Comentario" rows="15" cols="40"></textarea> <br><br>
                <input type="hidden" name="prop" value="<%=propu.getTitulo()%>">
                <input type="hidden" name="colab" value="<%=(String) request.getSession().getAttribute("sesionAct")%>">
                <button type="submit" onClick="alert('Comentario agregado')">Comentar</button>
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
    <%}else if(Ya_comento){%>
    <br>
    <b> Usted ya a comentado en esta propuesta </b>
    <%}%>

    <% if (!Nombre_Usuario.equals("") && !yaFav) {%>
    <form 	action="/CulturarteWeb/favorita" method="post">
    <input type="hidden" name="prop" value="<%=propu.getTitulo()%>">
    <input type="hidden" name="usu" value="<%=(String) request.getSession().getAttribute("sesionAct")%>">
     <button type="submit" >Marcar como favorita</button>
    </form>
    <%} else if (yaFav) { %>
    <br>
    <b> Tiene esta propuesta como favorita </b>
    <%}%>
    <% if (Propuso_a_propu && !Nombre_Usuario.equals("")) {                  %>
    <form 	action="#" method="get">
        <input type="submit" value="Extender Tiempo">
    </form>
    <br>
    <form 	action="#" method="get">
        <input type="submit" value="Cancela Propuesta">
    </form>
    <%}%>   
</body>
</html>

