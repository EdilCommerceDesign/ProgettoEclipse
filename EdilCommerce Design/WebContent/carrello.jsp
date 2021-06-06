
<%@page import="java.sql.SQLException"%>
<%
Boolean userRole = (Boolean) session.getAttribute("userRole");
if((userRole == null) || (!userRole.booleanValue())) {
	response.sendRedirect("/EdilCommerce_Design/login.jsp");
	return;
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="javax.sql.*,model.*,utils.*,java.text.*"%>
<!DOCTYPE html>
<%
UserBean bean1 = (UserBean) request.getSession().getAttribute("loggedUser");
if (bean1 == null) {
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
<link type="text/css" rel="stylesheet" href="/EdilCommerce_Design/css/default.css">
<title>Il tuo carrello</title>
</head>
<body>
	<%@include file="header.jsp" %>
	
	<script type="text/javascript" src="/EdilCommerce_Design/script/carrello.js"></script>
	
	<%
	Carrello<ArticoloBean> carrello = (Carrello<ArticoloBean>) getServletContext().getAttribute("Carrello");
	%>
	
	<fieldset>
		<legend>Carrello<button onclick='deleteItem("ALL", "carrello")'>Svuota</button></legend>
		<table id="carrello">
			<%
			String messaggio = (String)request.getParameter("messaggio");
			if(messaggio != null) {
			%>
			<tr><td><h2><%=messaggio %></h2></td></tr>
			<%
			}
			%>
			<%
			List<ArticoloBean> articoli = carrello.getItems();
			List<Integer> quantità = carrello.getQuantità();
			Iterator<ArticoloBean> it1 = articoli.iterator();
			Iterator<Integer> it2 = quantità.iterator();
			
			ArticoloBean bean = new ArticoloBean();
			Integer q = 0;
				
			while(it1.hasNext() && it2.hasNext()){
				bean=it1.next();
				q=it2.next();
				%>
				<tr><td><a href="/EdilCommerce_Design/articolo.jsp?articolo=<%=bean.getCodiceArticolo()%>"><img alt="<%=bean.getNome()%>" src="<%=bean.getImmagine()%>"></a></td>
				<td><h4><a href="/EdilCommerce_Design/articolo.jsp?articolo=<%=bean.getCodiceArticolo()%>"><%=bean.getNome()%></a></h4>
				<h5><%DecimalFormat df=new DecimalFormat("#.00");%><%=df.format(bean.getCosto())%>&euro;</h5>
				<label>Quantità</label><input type="number" value="<%=q%>"></td>
				<td><button onclick='deleteItem("<%=bean.getCodiceArticolo()%>", "carrello")'>X</button></td></tr>
				<%	
			}
			%>
		</table>
	</fieldset>
</body>
</html>