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
#cssmenu > ul,
#cssmenu > ul li,
#cssmenu > ul ul {
  list-style: none;
  margin: 0;
  padding: 0;
}
#cssmenu > ul {
  position: relative;
  z-index: 597;
}
#cssmenu > ul li {
  float: left;
  min-height: 1px;
  line-height: 1.3em;
  vertical-align: middle;
}
#cssmenu > ul li.hover,
#cssmenu > ul li:hover {
  position: relative;
  z-index: 599;
  cursor: default;
}
#cssmenu > ul ul {
  visibility: hidden;
  position: absolute;
  top: 100%;
  left: 0;
  z-index: 598;
  width: 100%;
}
#cssmenu > ul ul li {
  float: none;
}
#cssmenu > ul ul ul {
  top: 1px;
  left: 99%;
}
#cssmenu > ul li:hover > ul {
  visibility: visible;
}
/* Align last drop down RTL */
#cssmenu > ul > li.last ul ul {
  left: auto !important;
  right: 99%;
}
#cssmenu > ul > li.last ul {
  left: auto;
  right: 0;
}
#cssmenu > ul > li.last {
  text-align: right;
}
/* Theme Styles */
#cssmenu > ul {
  border-top: 4px solid #3fa338;
  font-family: Calibri, Tahoma, Arial, sans-serif;
  font-size: 14px;
  background: #1e1e1e;
  background: -moz-linear-gradient(top, #1e1e1e 0%, #040404 100%);
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #1e1e1e), color-stop(100%, #040404));
  background: -webkit-linear-gradient(top, #1e1e1e 0%, #040404 100%);
  background: linear-gradient(top, #1e1e1e 0%, #040404 100%);
  width: 100%;
  zoom: 1;
}
#cssmenu > ul:before {
  content: '';
  display: block;
}
#cssmenu > ul:after {
  content: '';
  display: table;
  clear: both;
}
#cssmenu > ul li a {
  display: inline-block;
  padding: 10px 22px;
}
#cssmenu > ul > li.active,
#cssmenu > ul > li.active:hover {
  background-color: #3fa338;
}
#cssmenu > ul > li > a:link,
#cssmenu > ul > li > a:active,
#cssmenu > ul > li > a:visited {
  color: #ffffff;
}
#cssmenu > ul > li > a:hover {
  color: #ffffff;
}
#cssmenu > ul ul ul {
  top: 0;
}
#cssmenu > ul li li {
  background-color: #ffffff;
  border-bottom: 1px solid #ebebeb;
  font-size: 12px;
}
#cssmenu > ul li.hover,
#cssmenu > ul li:hover {
  background-color: #F5F5F5;
}
#cssmenu > ul > li.hover,
#cssmenu > ul > li:hover {
  background-color: #3fa338;
  -webkit-box-shadow: inset 0 -3px 0 rgba(0, 0, 0, 0.15);
  -moz-box-shadow: inset 0 -3px 0 rgba(0, 0, 0, 0.15);
  box-shadow: inset 0 -3px 0 rgba(0, 0, 0, 0.15);
}
#cssmenu > ul a:link,
#cssmenu > ul a:visited {
  color: #9a9a9a;
  text-decoration: none;
}
#cssmenu > ul a:hover {
  color: #9a9a9a;
}
#cssmenu > ul a:active {
  color: #9a9a9a;
}
#cssmenu > ul ul {
  border: 1px solid #CCC \9;
  -webkit-box-shadow: 0 0px 2px 1px rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0 0px 2px 1px rgba(0, 0, 0, 0.15);
  box-shadow: 0 0px 2px 1px rgba(0, 0, 0, 0.15);
  width: 150px;
}

    </style>
    