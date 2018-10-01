<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/template/head.jsp" />
<title>Inicio</title>
</head>
<body>
	<jsp:include page="/template/header.jsp" />
         <link href="<%= request.getContextPath()%>/css/style.css" rel="stylesheet" media="screen">
<center>
        <img src="<%= request.getContextPath()%>/img/logo.png" border="0" width="600" height="500">
</center>
	<jsp:include page="/template/footer.jsp" />
</body>
</html>
