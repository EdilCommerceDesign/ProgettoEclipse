<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="/EdilCommerce_Design/css/default.css" rel="stylesheet" type="text/css">
<title>Login</title>
</head>
<body>
	<%@ include file="./header.jsp" %>

	<img alt="logo-edil" src="/EdilCommerce_Design/img/logo.png" id="mainLogo">
	<form method="post" action="/EdilCommerce_Design/Login">
		<fieldset>
			<legend>LOGIN</legend>
			<table>
				<tr><td>Username</td><td><input type="text" name="username" placeholder="Username"></td></tr>
				<tr><td>Password</td><td><input type="password" name="password" placeholder="Password"></td></tr>
			</table>
			<input type="submit" value="Login">&nbsp;<input type="reset" value="Reset">
		</fieldset>
	</form>

	<%
	String error = (String) request.getAttribute("error");
	if (error != null && !error.equals("")) {
	%>
	<p style="color: red"><%=error%>
	<%
	}
	%>
	
</body>
</html>