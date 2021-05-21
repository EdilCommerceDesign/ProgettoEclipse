<%@page import="java.sql.SQLException"%>
<%
Boolean userRoles = (Boolean) session.getAttribute("userRole");
if((userRoles == null) || (!userRoles.booleanValue())) {
	response.sendRedirect("../login.jsp");
	return;
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="javax.sql.*,model.*,utils.*"%>
<!DOCTYPE html>
<%
String username= (String) request.getSession().getAttribute("loggedUsername");//Da ottimizziare come bean
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=username%></title>
</head>
<body>
	<%
	DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
	UserModelDS model = new UserModelDS(ds);
	
	UserBean bean = new UserBean();
	
	try{
		bean = model.doRetriveByKey(username);

	%>
	<script type="text/javascript" src="../script/profiloScripts.js"></script>
	<form method="post" action="../Modifica">
		<fieldset>
			  <legend>Informazioni Personali:</legend>
					<table>
						<tr><td>Nome</td> <td><input type="text" name="nome" placeholder="ex. Mario" required readonly  value="<%= bean.getNome() %>"></td><td><input type="button" value="Modifica" onclick='setModificable("nome")'></td></tr>
						<tr><td>Cognome </td> <td> <input type="text" name="cognome" placeholder="ex. Rossi" required readonly value="<%= bean.getCognome() %>"></td><td><input type="button" value="Modifica" onclick='setModificable("cognome")'></td></tr>
						<tr><td>Username</td> <td> <input type="text" name="username" placeholder="ex. Rossi" required readonly value="<%= bean.getUsername() %>"></td><td><input type="button" value="Modifica" onclick='setModificable("username")'></td></tr>
						<tr><td>E-mail  </td> <td> <input type="email" name="email" placeholder="mario@ex.com" required readonly value="<%= bean.getEmail()%>"></td><td><input type="button" value="Modifica" onclick='setModificable("email")'></td></tr>
						<tr><td>Password</td> <td> <input class ="pass" type="password" name="password" placeholder="Password" required readonly value="<%= bean.getUserPassword() %>"></td><td><input type="button" value="Modifica" onclick='setModificable("password"),setModificable("confermaP")'></td></tr>
						<tr><td>Conferma Password </td> <td><input class ="pass" type="password" name="confermaP" placeholder="Password" required readonly value="<%= bean.getUserPassword() %>"></td></tr>
						<tr><td>Indirizzo </td> <td> <input type="text" name="indirizzo" placeholder="ex. via demanio 7/1" required readonly value="<%= bean.getIndirizzo() %>"></td><td><input type="button" value="Modifica" onclick='setModificable("indirizzo")'></td></tr>
						<tr><td>Telefono  </td> <td><input type="text" name="telefono" placeholder="ex. 089893888" required readonly value="<%= bean.getTelefono() %>"></td><td><input type="button" value="Modifica" onclick='setModificable("telefono")'></td></tr>
					</table>
					<input type="hidden" name="originalUsername" value ="<%=bean.getUsername() %>">
					
					<input type="submit" value="Salva">&nbsp;<input type="reset" value="Reset">
		</fieldset>
		</form>
		
	<% 
	} catch(SQLException e){
		Utility.print(e);
		request.setAttribute("error", e.getMessage());
	}
	%>

</body>
</html>