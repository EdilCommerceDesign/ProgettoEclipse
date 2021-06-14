<%@page import="java.sql.SQLException"%>
<%@page session="false" %>
<%
HttpSession session = request.getSession(false);
if(session == null) {
	response.sendRedirect("/EdilCommerce_Design/login.jsp");
	return;
} else {
	Boolean userRole = (Boolean) session.getAttribute("userRole");
	if((userRole == null) || (!userRole.booleanValue())) {
		response.sendRedirect("/EdilCommerce_Design/login.jsp");
		return;
	}
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="javax.sql.*,model.*,utils.*"%>
<!DOCTYPE html>
<%
UserBean bean = (UserBean) request.getSession().getAttribute("loggedUser");
if (bean == null) {
	session.removeAttribute("userRole");
	session.removeAttribute("adminRole");
	session.invalidate();
	response.sendRedirect("/EdilCommerce_Design/login.jsp");
	return;
}
%>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="/EdilCommerce_Design/css/default.css" rel="stylesheet" type="text/css">
<title><%=bean.getUsername()%></title>
</head>

<body>
	<%@ include file="../header.jsp" %>
	<script type="text/javascript" src="/EdilCommerce_Design/script/profiloScripts.js"></script>
	<%
	String error = (String) request.getAttribute("error");
	if (error != null && !error.equals("")) {
	%>
	<p style="color: red"><%=error%>
	<%
	}
	%>
	<h1>AREA UTENTE</h1>
	<p>Benvenuto <%=bean.getUsername() %>, qui puoi modificare le tue informazioni personali</p>
	<form method="post" action="<%=response.encodeURL("/EdilCommerce_Design//Modifica")%>">
		<fieldset>
			  <legend>Informazioni Personali:</legend>
					<table>
						<tr><td>Nome</td> <td><input type="text" name="nome" placeholder="ex. Mario" required readonly  value="<%= bean.getNome() %>"></td><td><input type="button" value="Modifica" onclick='setModificable("nome")'></td></tr>
						<tr><td>Cognome </td> <td> <input type="text" name="cognome" placeholder="ex. Rossi" required readonly value="<%= bean.getCognome() %>"></td><td><input type="button" value="Modifica" onclick='setModificable("cognome")'></td></tr>
						<tr><td>Username</td> <td> <input type="text" name="username" placeholder="ex. Rossi" required readonly value="<%= bean.getUsername() %>"></td><td><input type="button" value="Modifica" onclick='setModificable("username")'></td></tr>
						<tr><td>E-mail  </td> <td> <input type="email" name="email" placeholder="mario@ex.com" required readonly value="<%= bean.getEmail()%>"></td><td><input type="button" value="Modifica" onclick='setModificable("email")'></td></tr>
						<tr><td>Password</td> <td> <input id="pass" type="password" name="password" placeholder="Password" required readonly value="<%= bean.getUserPassword() %>" onchange="controllaPass('pass', 'confermaPass','messaggioPass', 'salva')"></td><td><input type="button" value="Modifica" onclick='setModificable("password"),setModificable("confermaP")'></td></tr>
						<tr><td>Conferma Password </td> <td><input id="confermaPass" type="password" name="confermaP" placeholder="Password" required readonly value="<%= bean.getUserPassword() %>" onchange="controllaPass('pass', 'confermaPass','messaggioPass', 'salva')"></td><td><p hidden="true" id="messaggioPass" style="color:red;margin:0">X</td></tr>
						<tr><td>Indirizzo </td> <td> <input type="text" name="indirizzo" placeholder="ex. via demanio 7/1" required readonly value="<%= bean.getIndirizzo() %>"></td><td><input type="button" value="Modifica" onclick='setModificable("indirizzo")'></td></tr>
						<tr><td>Telefono  </td> <td><input type="text" name="telefono" placeholder="ex. 089893888" required readonly value="<%= bean.getTelefono() %>"></td><td><input type="button" value="Modifica" onclick='setModificable("telefono")'></td></tr>
					</table>
					<input type="hidden" name="originalUsername" value ="<%=bean.getUsername() %>">
					
					<input type="submit" id="salva" value="Salva" >&nbsp;<input type="reset" value="Reset">
		</fieldset>
		</form>
</body>
</html>