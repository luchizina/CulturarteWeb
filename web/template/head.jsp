<%-- 
    Document   : head
    Author     : Igui
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Para evitar ver caracteres raros -->
<meta http-equiv="Content-type" content="text/html; charset=ISO-8859-1" />
<meta http-equiv="Content-language" content="es" />
<style>
#menu-bar {
  width: 100%;
  margin: 0px 0px 0px 0px;
  padding: 5px 6px 4px 6px;
  height: 40px;
  line-height: 100%;
 
  box-shadow: 0px 0px 0px #00260A;
  -webkit-box-shadow: 0px 0px 0px #00260A;
  -moz-box-shadow: 0px 0px 0px #00260A;
  background: #B2E0A4;
  background: linear-gradient(top,  #56A343,  #397A22);
  background: -ms-linear-gradient(top,  #56A343,  #397A22);
  background: -webkit-gradient(linear, left top, left bottom, from(#56A343), to(#397A22));
  background: -moz-linear-gradient(top,  #56A343,  #397A22);
  border: solid 0px #111F0C;
  position:relative;
  z-index:999;
}
#menu-bar li {
  margin: 0px 0px 6px 0px;
  padding: 0px 6px 0px 6px;
  float: left;
  position: relative;
  list-style: none;
}
#menu-bar a {
  font-weight: bolder;
  font-family: arial;
  font-style: normal;
  font-size: 15px;
  color: #FFFFFF;
  text-decoration: none;
  display: block;
  padding: 6px 19px 9px 17px;
  margin: 0;
  margin-bottom: 6px;
  border-radius: 10px;
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  text-shadow: 0px 0px 0px #000000;
}
#menu-bar li ul li a {
  margin: 0;
}
#menu-bar .active a, #menu-bar li:hover > a {
  background: #0399D4;
  background: linear-gradient(top,  #FFFFFF,  #3EA137);
  background: -ms-linear-gradient(top,  #FFFFFF,  #3EA137);
  background: -webkit-gradient(linear, left top, left bottom, from(#FFFFFF), to(#3EA137));
  background: -moz-linear-gradient(top,  #FFFFFF,  #3EA137);
  color: #444444;
  -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
  -moz-box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
  box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
  text-shadow: 2px 2px 3px #FFFFFF;
}
#menu-bar ul li:hover a, #menu-bar li:hover li a {
  background: none;
  border: none;
  color: #666;
  -box-shadow: none;
  -webkit-box-shadow: none;
  -moz-box-shadow: none;
}
#menu-bar ul a:hover {
  background: #0399D4 !important;
  background: linear-gradient(top,  #04ACEC,  #0186BA) !important;
  background: -ms-linear-gradient(top,  #04ACEC,  #0186BA) !important;
  background: -webkit-gradient(linear, left top, left bottom, from(#04ACEC), to(#0186BA)) !important;
  background: -moz-linear-gradient(top,  #04ACEC,  #0186BA) !important;
  color: #FFFFFF !important;
  border-radius: 0;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  text-shadow: 2px 2px 3px #FFFFFF;
}
#menu-bar li:hover > ul {
  display: block;
}
#menu-bar ul {
  background: #85BA6E;
  display: none;
  margin: 0;
  padding: 0;
  width: 185px;
  position: absolute;
  top: 33px;
  left: 0;
  border: solid 1px #B4B4B4;
  border-radius: 10px;
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  -webkit-box-shadow: 0px 0px 3px #222222;
  -moz-box-shadow: 0px 0px 3px #222222;
  box-shadow: 0px 0px 3px #222222;
}
#menu-bar ul li {
  float: none;
  margin: 0;
  padding: 0;
}
#menu-bar ul a {
  padding:10px 0px 10px 15px;
  color:#FFFFFF !important;
  font-size:12px;
  font-style:normal;
  font-family:arial;
  font-weight: normal;
  text-shadow: 0px 0px 0px #FFFFFF;
}
#menu-bar ul li:first-child > a {
  border-top-left-radius: 10px;
  -webkit-border-top-left-radius: 10px;
  -moz-border-radius-topleft: 10px;
  border-top-right-radius: 10px;
  -webkit-border-top-right-radius: 10px;
  -moz-border-radius-topright: 10px;
}
#menu-bar ul li:last-child > a {
  border-bottom-left-radius: 10px;
  -webkit-border-bottom-left-radius: 10px;
  -moz-border-radius-bottomleft: 10px;
  border-bottom-right-radius: 10px;
  -webkit-border-bottom-right-radius: 10px;
  -moz-border-radius-bottomright: 10px;
}
#menu-bar:after {
  content: ".";
  display: block;
  clear: both;
  visibility: hidden;
  line-height: 0;
  height: 0;
}
#menu-bar {
  display: inline-block;
}
  html[xmlns] #menu-bar {
  display: block;
}
* html #menu-bar {
  height: 1%;
}
    </style>