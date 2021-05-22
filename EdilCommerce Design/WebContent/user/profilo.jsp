<%@page import="java.sql.SQLException"%>
<%
Boolean userRole = (Boolean) session.getAttribute("userRole");
if((userRole == null) || (!userRole.booleanValue())) {
	response.sendRedirect("../login.jsp");
	return;
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="javax.sql.*,model.*,utils.*"%>
<!DOCTYPE html>
<%
UserBean bean = (UserBean) request.getSession().getAttribute("loggedUser");
if (bean == null) {
	request.getSession().removeAttribute("userRole");
	request.getSession().removeAttribute("adminRole");
	request.getSession().invalidate();
	response.sendRedirect("../login.jsp");
	return;
}
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=bean.getUsername()%></title>
<link href="../css/header.css" rel="stylesheet" type="text/css">
</head>
<body>
	<% 
	Boolean adminRole = (Boolean) request.getSession().getAttribute("adminRole");
	%>
	<script type="text/javascript" src="../script/profiloScripts.js"></script>
	
	<header>
		<div id="left"><a href="../home.jsp"><img alt="ECD_Logo" src="../img/logo_mini.png"></a></div>
		<div id="centro"> <img alt="lente" src="../img/lente.png" width=30px height=30px>
		<input id="search" type="search"  name="search" size="30" placeholder="Cerca in EdilCommerce Design"></div>
		<div id = "rigth">
		<% 
		if(userRole != null && adminRole != null){
			if(userRole.equals(true) || adminRole.equals(true) ){
		%>
		<ul>
			<li>Ciao <a class="login" href="./profilo.jsp" ><%=bean.getUsername()%> <img alt="profilo" src="../img/profilo.jpg"></a></li>
			<li><a class="login" href="../Logout" ><img alt="logout" src="../img/logout.jpg"></a></li>
			<li><a class="login" href="" ><img alt="carrello" src="../img/carrello.jpg"></a></li>
		</ul>
		<% 	
				}
			} else {
		%>
		<ul>
			<li><a href="login.jsp" >Login</a></li>
			<li><a href="registrazione.jsp" >Registrati</a></li>
		</ul>
		<% 
		}
		%>
		</div>
	</header>
	<%
	String error = (String) request.getAttribute("error");
	if (error != null && !error.equals("")) {
	%>
	<p style="color: red"><%=error%>
	<%
	}
	%>
	<form method="post" action="../Modifica">
		<fieldset>
			  <legend>Informazioni Personali:</legend>
					<table>
						<tr><td>Nome</td> <td><input type="text" name="nome" placeholder="ex. Mario" required readonly  value="<%= bean.getNome() %>"></td><td><input type="button" value="Modifica" onclick='setModificable("nome")'></td></tr>
						<tr><td>Cognome </td> <td> <input type="text" name="cognome" placeholder="ex. Rossi" required readonly value="<%= bean.getCognome() %>"></td><td><input type="button" value="Modifica" onclick='setModificable("cognome")'></td></tr>
						<tr><td>Username</td> <td> <input type="text" name="username" placeholder="ex. Rossi" required readonly value="<%= bean.getUsername() %>"></td><td><input type="button" value="Modifica" onclick='setModificable("username")'></td></tr>
						<tr><td>E-mail  </td> <td> <input type="email" name="email" placeholder="mario@ex.com" required readonly value="<%= bean.getEmail()%>"></td><td><input type="button" value="Modifica" onclick='setModificable("email")'></td></tr>
						<tr><td>Password</td> <td> <input id="pass" type="password" name="password" placeholder="Password" required readonly value="<%= bean.getUserPassword() %>" ></td><td><input type="button" value="Modifica" onclick='setModificable("password"),setModificable("confermaP")'></td></tr>
						<tr><td>Conferma Password </td> <td><input id="confermaPass" type="password" name="confermaP" placeholder="Password" required readonly value="<%= bean.getUserPassword() %>" onblur="controllaPass('pass', 'confermaPass','messaggioPass')"></td><td><p hidden="true" id="messaggioPass" style="color:red">X</td></tr>
						<tr><td>Indirizzo </td> <td> <input type="text" name="indirizzo" placeholder="ex. via demanio 7/1" required readonly value="<%= bean.getIndirizzo() %>"></td><td><input type="button" value="Modifica" onclick='setModificable("indirizzo")'></td></tr>
						<tr><td>Telefono  </td> <td><input type="text" name="telefono" placeholder="ex. 089893888" required readonly value="<%= bean.getTelefono() %>"></td><td><input type="button" value="Modifica" onclick='setModificable("telefono")'></td></tr>
					</table>
					<input type="hidden" name="originalUsername" value ="<%=bean.getUsername() %>">
					
					<input type="submit" value="Salva">&nbsp;<input type="reset" value="Reset">
		</fieldset>
		</form>
</body>
</html>