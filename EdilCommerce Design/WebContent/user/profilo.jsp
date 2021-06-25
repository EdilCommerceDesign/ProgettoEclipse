<%@page import="java.sql.SQLException"%>
<%@page session="false" %>
<%
HttpSession session = request.getSession(false);
if(session == null) {
	response.sendRedirect(response.encodeRedirectURL("/EdilCommerce_Design/login.jsp"));
	return;
} else {
	Boolean userRole = (Boolean) session.getAttribute("userRole");
	if((userRole == null) || (!userRole.booleanValue())) {
		response.sendRedirect(response.encodeRedirectURL("/EdilCommerce_Design/login.jsp"));
		return;
	}
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="javax.sql.*,model.*,utils.*"%>
<!DOCTYPE html>
<%
UserBean bean = (UserBean) session.getAttribute("loggedUser");
if (bean == null) {
	session.removeAttribute("userRole");
	session.removeAttribute("adminRole");
	session.invalidate();
	response.sendRedirect(response.encodeRedirectURL("/EdilCommerce_Design/login.jsp"));
	return;
}
%>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="/EdilCommerce_Design/css/default.css" rel="stylesheet" type="text/css">
<link href="/EdilCommerce_Design/css/profilo.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
	<h2>Benvenuto <%=bean.getUsername() %>, qui puoi modificare le tue informazioni personali</h2>
	<ul>
		<li onclick="visualizza('infoP')"><h2>Informazioni personali</h2></li>
		<div class="container" id="infoP" style="display: none;">
			<h2 style="text-align: center">Informazioni personali</h2>
			<form id="profilo" method="post" action="<%=response.encodeURL("/EdilCommerce_Design//Modifica")%>">
				<div class="flex">
					  	<div class="col-50">
								<label for="nome"><i class="fa fa-user"></i> Nome</label>
								<input type="text" name="nome" placeholder="ex. Mario" required readonly  value="<%= bean.getNome() %>">
								
								<label for="cognome"><i class="fa fa-user"></i> Cognome</label>
								<input type="text" name="cognome" placeholder="ex. Rossi" required readonly value="<%= bean.getCognome() %>">
								
								<label for="username"><i class="fa fa-user"></i> Username</label>
								<input type="text" name="username" placeholder="ex. Rossi" required readonly value="<%= bean.getUsername() %>">
								
								<label for="email"><i class="fa fa-envelope"></i> E-mail</label>
								<input type="email" name="email" placeholder="mario@ex.com" required readonly value="<%= bean.getEmail()%>">
								
								<label for="password"><i class="fa fa-lock"></i> Password</label>
								<input id="pass" type="password" name="password" placeholder="Password" required readonly value="<%= bean.getUserPassword() %>" onkeyup="controllaPass('pass', 'confermaPass', 'salva')">
								
								<label for="confermaPass"><i class="fa fa-lock"></i> Conferma Password</label>
								<input id="confermaPass" type="password" name="confermaP" placeholder="Password" required readonly value="<%= bean.getUserPassword() %>" onkeyup="controllaPass('pass', 'confermaPass', 'salva')">
						</div>
								
						<div class="col-50">		
								<label for="indirizzo"><i class="fa fa-address-card-o"></i> Indirizzo</label>
								<input type="text" name="indirizzo" placeholder="ex. via demanio 7/1" required readonly value="<%= bean.getIndirizzo() %>">
								
								<label for="telefono"><i class="fa fa-phone"></i> Telefono</label>
								<input type="text" name="telefono" placeholder="ex. 089893888" required readonly value="<%= bean.getTelefono() %>">
							
								<label for="citta"><i class="fa fa-institution"></i> Città</label>
								<input type="text" name="citta" placeholder="Salerno" required readonly value="<%= bean.getCittà() %>">
								
								<label for="cap"><i class="fa fa-home"></i> Cap</label>
								<input type="text" name="cap" placeholder="800000" required readonly value="<%= bean.getCap() %>">
								
								<label for="stato"><i class="fa fa-home"></i> Stato</label>
								<input type="text" name="stato" placeholder="IT" required readonly value="<%= bean.getStato() %>">
								
								<input type="hidden" name="originalUsername" value ="<%=bean.getUsername() %>">
						</div>
							
								<br><input type="submit" id="salva" value="Salva" >&nbsp;<input type="reset" value="Reset">&nbsp;<input type="button" onclick='setModificable()' value="Modifica">
				</div>
			</form>
		</div>
		<li onclick="visualizza('')"><h2>Ordini effettuati</h2></li>
	</ul>
	<%@ include file="../footer.jsp" %>;
</body>
</html>