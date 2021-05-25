<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*,utils.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="../css/header.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<%
	Boolean headerUserRole = (Boolean) session.getAttribute("userRole");
	Boolean headerAdminRole = (Boolean) session.getAttribute("adminRole");
	UserBean headerBean = (UserBean) session.getAttribute("loggedUser");
	
	%>
	<script type="text/javascript" src="../script/profiloScripts.js"></script>
	
	<header>
		<div id="left"><a href="../home.jsp"><img alt="ECD_Logo" src="../img/logo_mini.png"></a></div>
		<div id="centro"> <img alt="lente" src="../img/lente.png" width=30px height=30px>
		<input id="search" type="search"  name="search" size="30" placeholder="Cerca in EdilCommerce Design"></div>
		<div id = "rigth">
		<% 
		if(headerUserRole != null && headerAdminRole != null){
			if(headerUserRole.equals(true) || headerAdminRole.equals(true) ){
		%>
		<ul>
			<li>Ciao <a class="login" href="./profilo.jsp" ><%=headerBean.getUsername()%> <img alt="profilo" src="../img/profilo.jpg"></a></li>
			<li><a class="login" href="../Logout" ><img alt="logout" src="../img/logout.jpg"></a></li>
			<li><a class="login" href="" ><img alt="carrello" src="../img/carrello.jpg"></a></li>
		</ul>
		<% 	
				}
			} else {
		%>
		<ul>
			<li><a href="login.jsp" >Login</a></li>
			<li><a href="registrazione.jsp" >Registrati</a></li>
		</ul>
		<% 
		}
		%>
		</div>
	</header>
</body>
</html>