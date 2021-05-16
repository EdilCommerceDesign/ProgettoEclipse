<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registrazione</title>
</head>
<body>
	<form method="post" action="">
		<fieldset>
			<legend>CREA UN ACCOUNT</legend>
			<input type="text" name="Name" placeholder="ex. Mario" required>nome<br>
			<input type="text" name="Surname" placeholder="ex. Rossi" required>cognome<br>
			<input type="email" name="email" placeholder="mario@ex.com" required>email<br>
			<input type="password" name="password" placeholder="Password" required>password<br>
			<input type="submit" value="Regitration">
			<input type="reset" value="Reset">
		</fieldset>
	</form>
</body>
</html>