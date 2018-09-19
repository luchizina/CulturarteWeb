<%-- 
    Document   : popupComentario
    Created on : 19/09/2018, 04:56:06 PM
    Author     : Nuevo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

    </head>
    <body>
        <h1 style="text-align:center; font-size:50px; color:#fff">Modal Popup Box Login Form</h1>

        <button onclick="document.getElementById('modal-wrapper').style.display = 'block'" style="width:200px; margin-top:200px; margin-left:160px;">
            Open Popup</button>

        <div id="modal-wrapper" class="modal">

            <form class="modal-content animate" action="#">

                <div class="imgcontainer">
                    <span onclick="document.getElementById('modal-wrapper').style.display = 'none'" class="close" title="Close PopUp">&times;</span>
                </div>

                <div class="container" align='center'>
                    <textarea name="comentario" id="comentario" placeholder="Comentario"></textarea> <br><br>
                    <button type="submit">Comentar</button>
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
    </body>
</html>
