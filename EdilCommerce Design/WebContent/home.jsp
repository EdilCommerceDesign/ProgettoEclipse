<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<style>
	body {
  	background-image: url("./img/casa.jpg"); 
  	<!-- background-repeat: no-repeat; -->
	}
</style>
	
	<!-- <link rel="stylesheet" type="text/css" href="home.css"/> -->
	<meta charset="ISO-8859-1">
	<meta lang="it">
	<link href="./css/home.css" rel="stylesheet" type="text/css">
	<title>Benvenuto in Edil Commerce Design</title>
</head>
<body>
		
		
		<img alt="logo-edil" src="./img/logo.png" id="mainLogo">
		<ul class="rigth">
			<li><a class="login" href="login.jsp" >Login</a></li>
			<li><a class="login" href="signup.jsp">Registrati</a></li>
		</ul>

	<form action="" method="get">
		<div class="center">
			<input id="search" type="search"  name="search" size="30" placeholder="Cerca in EdilCommerce Design">
			<input id="submit" type="submit" value="Cerca">
		</div>
	</form>
</body>
</html>