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
	<%@include file="header.jsp" %>
	
	<%
	ArticoloModelDS model = new ArticoloModelDS((DataSource)getServletContext().getAttribute("DataSource"));
	ArticoloBean bean = new ArticoloBean();
	bean=model.doRetriveByKey(request.getParameter("articolo"));
	Carrello<ArticoloBean> carrello = new Carrello<ArticoloBean>();
	carrello = (Carrello<ArticoloBean>) request.getSession(false).getAttribute("Carrello");
	%>
	
	
	<img alt="<%=bean.getNome()%>" src="<%=bean.getImmagine()%>" class="articolo">
	 <div class="checkout">
		<h3><%=bean.getCosto() %>&euro;</h3>
		<p>Spedizione gratuita per ordini oltre i 20&euro;</p>
		<form action="<%=response.encodeURL("/EdilCommerce_Design/Aggiungi")%>" method="post">
			<input type="hidden" name="codice" value="<%=bean.getCodiceArticolo() %>">
			<label>Quantità: <input name="quantità" type="number" value="1" min="1" class="quantità"></label>
		 	<input type="submit" value="Aggiungi al carrello" class="aggiungi">
	 	</form>
	 </div>
	<h2><%=bean.getNome() %></h2>
	<p><%=bean.getDescrizione()%></p>
	
	<div class="recensioni">
		
	</div>


</body>
</html>