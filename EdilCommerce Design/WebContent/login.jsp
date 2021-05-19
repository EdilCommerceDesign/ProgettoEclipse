<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<img alt="logo-edil" src="./img/logo.png" id="mainLogo">
	<form method="post" action="">
		<fieldset>
			<legend>LOGIN</legend>
			<table>
				<tr><td>Username</td><td><input type="text" name="username" placeholder="Username"></td></tr>
				<tr><td>Password</td><td><input type="password" name="password" placeholder="Password"></td></tr>
			</table>
			<input type="submit" value="Login">&nbsp;<input type="reset" value="Reset">
		</fieldset>
	</form>
</body>
</html>