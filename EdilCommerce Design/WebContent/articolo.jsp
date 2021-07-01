<%@page import="javax.swing.text.Document"%>
<%@page import="java.awt.Window"%>
<%@page session="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="/EdilCommerce_Design/css/default.css" rel="stylesheet" type="text/css">
<link href="/EdilCommerce_Design/css/articolo.css" rel="stylesheet" type="text/css">
<title>EdilCommerce Design</title>
</head>
<body>
	<div id="holder">
		
		<%@include file="header.jsp" %>
		<div id="body">
		<%
		ArticoloModelDS model = new ArticoloModelDS((DataSource)getServletContext().getAttribute("DataSource"));
		ArticoloBean bean = new ArticoloBean();
		bean=model.doRetriveByKey(request.getParameter("articolo"));
		%>
		
		
		<img alt="<%=bean.getNome()%>" src="<%=bean.getImmagine()%>" class="articolo">
		 <div class="checkout">
			<h3><%=bean.getCosto() %>&euro;</h3>
			<p>Spedizione gratuita per ordini oltre i 20&euro;</p>
			<form action="<%=response.encodeURL("/EdilCommerce_Design/Aggiungi")%>" method="get">
				<input type="hidden" name="codice" value="<%=bean.getCodiceArticolo() %>">
				<label>Quantità: <input name="quantita" type="number" value="1" min="1" class="quantità"></label>
			 	<input type="submit" value="Aggiungi al carrello" class="aggiungi">
		 	</form>
		 </div>
		<h2><%=bean.getNome() %></h2>
		<p><%=bean.getDescrizione()%></p>
		
		<div class="recensioni">
			
		</div>
		</div>
	<%@ include file="./footer.jsp" %>
	</div>
</body>
</html>