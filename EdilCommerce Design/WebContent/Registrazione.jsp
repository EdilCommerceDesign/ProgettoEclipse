<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="./css/Registrazione.css" rel="stylesheet" type="text/css">
<title>Registrazione</title>
</head>
<body>
	<img alt="logo-edil" src="./img/logo.png" id="mainLogo">
		<form method="post" action="">
			<fieldset>
				<div class="h1">
				<h1>CREA UN ACCOUNT</h1>
				</div>
					Inserire un nome <input type="text" name="Name" placeholder="ex. Mario" required><br>
					Inserire un cognome <input type="text" name="Surname" placeholder="ex. Rossi" required><br>
					Inserire la propria email <input type="email" name="email" placeholder="mario@ex.com" required><br>
					Inserire una password <input type="password" name="password" placeholder="Password" required><br>
					<input type="submit" value="Regitration">
					<input type="reset" value="Reset">
			</fieldset>
		</form>
	<div class="a">
	<a href="home.jsp">Torna alla home</a>
	</div>
</body>
</html>