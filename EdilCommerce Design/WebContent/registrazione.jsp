<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="/EdilCommerce_Design/css/default.css" rel="stylesheet" type="text/css">
<link href="/EdilCommerce_Design/css/registrazione.css" rel="stylesheet" type="text/css">
<title>Registrazione</title>
</head>
<body>
	<%@ include file="./header.jsp" %>

	<script type="text/javascript" src="/EdilCommerce_Design/script/profiloScripts.js"></script>
	<div class="body">
		<img alt="logo-edil" src="/EdilCommerce_Design/img/logo.png" id="mainLogo"> 
	<div class="input">
	<h1>CREA UN ACCOUNT</h1>
	<!--<h2>Per effettuare i tuoi magnifici acquisti</h2> -->
	<%
	String error = (String) request.getAttribute("error");
	if (error != null && !error.equals("")) {
	%>
	<p style="color: red"><%=error%>
	<%
	}
	%>
	<form method="post" action="<%=response.encodeURL("/EdilCommerce_Design/Registrazione")%>">
		<fieldset>
			  <legend>Informazioni Personali:</legend>
					<table>
						<tr><td>Nome</td> <td><input type="text" name="nome" placeholder="ex. Mario" required></td></tr>
						<tr><td>Cognome </td> <td> <input type="text" name="cognome" placeholder="ex. Rossi" required></td></tr>
						<tr><td>Username</td> <td> <input type="text" name="username" placeholder="ex. Rossi" required></td></tr>
						<tr><td>E-mail  </td> <td> <input type="email" name="email" placeholder="mario@ex.com" required></td></tr>
						<tr><td>Password</td> <td> <input id="pass"type="password" name="password" placeholder="Password" required onkeyup="controllaPass('pass', 'confermaPass','messaggioPass', 'salva')"></td></tr>
						<tr><td>Conferma Password </td> <td><input id="confermaPass" type="password" name="confermaP" placeholder="Password" required onkeyup="controllaPass('pass', 'confermaPass','messaggioPass', 'salva')"></td><td><p hidden="true" id="messaggioPass" style="color:red;margin:0">X</td></tr>
						<tr><td>Indirizzo </td> <td> <input type="text" name="indirizzo" placeholder="ex. via demanio 7/1" required></td></tr>
						<tr><td>Telefono  </td> <td><input type="text" name="telefono" placeholder="ex. 089893888" required></td></tr>
					</table>
			
					<input type="submit" id="salva" value="Registrati">&nbsp;<input type="reset" value="Reset">
		</fieldset>
		</form>
	
	<a href="<%=response.encodeURL("home.jsp")%>">Torna alla home</a>
	</div>
	
	</div>
</body>
</html>