/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validarusu(nick) {
    var url = '../usuario';
    var parametros = 'nick=' + nick.value;
    var ajax = new Ajax.Updater('avisa', url, {method: 'get', parameters: parametros});
}

function validarcorreo(mail) {
    var url = '../correo';
    var parametros = 'email=' + mail.value;
    var ajax = new Ajax.Updater('avisaC', url, {method: 'get', parameters: parametros});
}

function vacios() {
    nick = document.getElementById("nick");
    nombre = document.getElementById("nombre");
    apellido = document.getElementById("apellido");
    fecha = document.getElementById("fecha");
    mail = document.getElementById("email");
    pass = document.getElementById("pwd");
    pass2 = document.getElementById("pwd2");
    aviso = document.getElementById("avisa");
    avisa = document.getElementById("avisaC");
    if (nick.value === "" || nombre.value === "" || apellido.value === "" || fecha.value === "" || mail.value === "" || pass.value === "" || pass2.value === "") {
//                    document.getElementById("botoncito").disabled = true;
        alert("Ha dejado campos vacios que debe llenar");
        return false;
    }
    if (nick.value !== "" || nombre.value !== "" || apellido.value !== "" || fecha.value !== "" || mail.value !== "" || pass.value !== "" || pass2.value !== "" && pass.value === pass2.value && aviso.innerHTML === "Nick disponible" && avisa.innerHTML === "Email disponible") {

        alert("El usuario " + nick.value + " ha sido registrado");
    }
    if (pass.value !== pass2.value) {
        alert("Las contraseñas no coinciden");
        return false;
    }

    if (aviso.innerHTML !== "Nick disponible" || avisa.innerHTML !== "Email disponible") {
        alert("Hay campos invalidos");
        return false;
    }
}

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
