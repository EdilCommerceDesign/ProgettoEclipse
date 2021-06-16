<%@page session="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="/EdilCommerce_Design/css/default.css" rel="stylesheet" type="text/css">
<link href="/EdilCommerce_Design/css/registrazione.css" rel="stylesheet" type="text/css">
<title>Login</title>
</head>
<body>
	<%@ include file="./header.jsp" %>
	<%
		HttpSession session = request.getSession(true);
		if(session != null) {
			String redirect = (String) session.getAttribute("loginRedirect");
			if(redirect == null) {
					redirect = request.getHeader("Referer");
					session.setAttribute("loginRedirect", redirect);
			}
		}
	%>

	<div class=body>
		<img alt="logo-edil" src="/EdilCommerce_Design/img/logo.png" id="mainLogo">
		<div class="input">
			<form method="post" action="<%=response.encodeURL("/EdilCommerce_Design/Login") %>">
				<fieldset>
					<legend>LOGIN</legend>
					<table>
						<tr><td>Username</td><td><input type="text" name="username" placeholder="Username"></td></tr>
						<tr><td>Password</td><td><input type="password" name="password" placeholder="Password"></td></tr>
					</table>
					<input type="submit" value="Login">&nbsp;<input type="reset" value="Reset">
				</fieldset>
			</form>
		</div>
		<%
		String error = (String) request.getAttribute("error");
		if (error != null && !error.equals("")) {
		%>
		<p style="color: red"><%=error%>
		<%
		}
		%>
		
		<h4>Oppure</h4><br>
		
		<input type="button" value="Registrati" onclick="window.location.href='<%=response.encodeURL("/EdilCommerce_Design/registrazione.jsp")%>'">
	</div>
</body>
</html>