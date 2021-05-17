<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="./css/registrazione.css" rel="stylesheet" type="text/css">
<title>Registrazione</title>
</head>
<body>
	<div class="contenitore1">
		<img alt="logo-edil" src="./img/logo.png" id="mainLogo"> 
	</div>
	<div class="contenitore2">
	<h1>CREA UN ACCOUNT</h1>
	<!--<h2>Per effettuare i tuoi magnifici acquisti</h2> -->
	<form method="post" action="">
		<fieldset>
			  <legend>Informazioni Personali:</legend>
					<table>
					<tr><td>Nome</td> <td><input type="text" name="Name" placeholder="ex. Mario" required></td></tr>
					<tr><td>Cognome </td> <td> <input type="text" name="Surname" placeholder="ex. Rossi" required></td></tr>
					<tr><td>Nickname</td> <td> <input type="text" name="Nickname" placeholder="ex. Rossi" required></td></tr>
					<tr><td>E-mail  </td> <td> <input type="email" name="Email" placeholder="mario@ex.com" required></td></tr>
					<tr><td>Password</td> <td> <input type="password" name="Password" placeholder="Password" required></td></tr>
					<tr><td>Conferma Password </td> <td><input type="password" name="ConfermaP" placeholder="Password" requiredd></td></tr>
					<tr><td>Indirizzo </td> <td> <input type="text" name="Indirizzo" placeholder="ex. via demanio 7/1" required></td></tr>
					<tr><td>Telefono  </td> <td><input type="text" name="Telefono" placeholder="ex. 089893888" required></td></tr>
					</table>
			
					<input type="submit" value="Regitration"></td> <td><input type="reset" value="Reset">
		</fieldset>
		</form>
	
	<a href="home.jsp">Torna alla home</a>
	</div>
</body>
</html>