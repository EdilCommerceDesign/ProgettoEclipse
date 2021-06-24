<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="javax.sql.*,model.*,utils.*"%>
<%@page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ordine Effettuato</title>
</head>
<body>

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
	
	<%@ include file="../header.jsp" %>
	
	<%
	if(Integer.parseInt( request.getParameter("suc")) == 1) {
	%>
		<p>Ordine effettuato con successo.
	<%	
	} else {
	%>
		<p>Ordine non effettuato.
	<%		
	}
	%>
</body>
</html>