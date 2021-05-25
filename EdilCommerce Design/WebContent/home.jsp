<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="model.*"%>
<!DOCTYPE html>
<html>
<head>

<style>
	body {
  		<!--background-image: url("./img/casa.jpg") ; 
   background-repeat: no-repeat; -->
	}
</style>
	
	<!-- <link rel="stylesheet" type="text/css" href="home.css"/> -->
	<meta charset="ISO-8859-1">
	<meta lang="it">
	<link href="/EdilCommerce_Design/css/default.css" rel="stylesheet" type="text/css">
	<link href="/EdilCommerce_Design/css/home.css" rel="stylesheet" type="text/css">
	<title>Benvenuto in Edil Commerce Design</title>
</head>
<body>
	<%
	Boolean userRole = (Boolean) request.getSession().getAttribute("userRole"); 
	Boolean adminRole = (Boolean) request.getSession().getAttribute("adminRole"); 
	UserBean username = (UserBean) request.getSession().getAttribute("loggedUser");
	%>
	
		<img alt="logo-edil" src="/EdilCommerce_Design/img/logo.png" id="mainLogo">
		<% 
		if(userRole != null && adminRole != null){
			if(userRole.equals(true) || adminRole.equals(true) ){
		%>
		<ul class="rigth">
			<li>Ciao <a class="login" href="/EdilCommerce_Design/user/profilo.jsp" ><%=username.getUsername()%></a></li>
			<li><a class="login" href="/EdilCommerce_Design/Logout" >Logout</a></li>
			<li><a class="login" href="" >Carrello</a></li>
		</ul>
		<% 	
				}
			} else {
		%>
		<ul class="rigth">
			<li><a class="login" href="login.jsp" >Login</a></li>
			<li><a class="login" href="registrazione.jsp" >Registrati</a></li>
		</ul>
		<% 
		}
		%>
	
	  <form action="" method="get">
		<div class="center">

			<input id="search" type="search"  name="search" size="30" placeholder="Cerca in EdilCommerce Design" >
			<!--  <a href="" ><img alt="" src="./img/lente.png" width=30px height=30px></a>-->
		</div> 
	</form> 
</body>
</html>