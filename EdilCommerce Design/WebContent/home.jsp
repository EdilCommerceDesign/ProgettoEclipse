<%@page import="java.util.Iterator"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Collection"%>
<%@page session="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="model.*,javax.sql.*,utils.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta lang="it">
	<link href="/EdilCommerce_Design/css/default.css" rel="stylesheet" type="text/css">
	<link href="/EdilCommerce_Design/css/home.css" rel="stylesheet" type="text/css">
	<title>Benvenuto in Edil Commerce Design</title>
</head>
<body>	
	<div id="holder">
		
	<%
	HttpSession session = request.getSession(false);
	Boolean userRole  =  null;
	Boolean adminRole =  null;
	UserBean bean =  null;
	if(session != null){
		userRole = (Boolean) session.getAttribute("userRole"); 
		adminRole = (Boolean) session.getAttribute("adminRole"); 
		bean = (UserBean) session.getAttribute("loggedUser");
	}
	Collection<CategoriaBean> collection = (Collection<CategoriaBean>) getServletContext().getAttribute("Categorie");
	%>
	 
		<header>
		<div id="left"><abb title="Home"><a href="/EdilCommerce_Design/home.jsp"><img alt="ECD_Logo" src="/EdilCommerce_Design/img/logo_mini.png"></a></abb></div>
		
		<% 
		if(userRole != null && adminRole != null){
			if(userRole.equals(true) || adminRole.equals(true) ){
		%>
		<div id="rigth">
			<ul>
				<li><a href="<%=response.encodeRedirectURL("/EdilCommerce_Design/user/profilo.jsp")%>" title="Profilo di <%=bean.getUsername()%>"><img alt="profilo" src="/EdilCommerce_Design/img/profilo.jpg"></a></li>
				<li><a href="<%=response.encodeRedirectURL("/EdilCommerce_Design/Logout")%>" title="Logout"><img alt="logout" src="/EdilCommerce_Design/img/logout.jpg"></a></li>
				<li><a href="<%=response.encodeRedirectURL("/EdilCommerce_Design/user/carrello.jsp")%>" title="Carrello"><img alt="carrello" src="/EdilCommerce_Design/img/carrello.jpg"></a></li>
			</ul>
		</div>
		<% 	
				} else {
		%>
		<div id="rigth">
			<ul>
				<li><a href="<%=response.encodeURL("login.jsp")%>">Login</a></li>
				<li><a href="<%=response.encodeURL("registrazione.jsp")%>">Registrati</a></li>
			</ul>
		</div>
		<%
			}
		} else {
			
		%>
		<div id="rigth">
			<ul >
				<li><a class="login" href="login.jsp">Login</a></li>
				<li><a class="login" href="registrazione.jsp">Registrati</a></li>
			</ul>
		</div>
		<%
		}
		%>
		</header>
		<div id="body">
		<img alt="logo-edil" src="/EdilCommerce_Design/img/logo.png" id="mainLogo">
	
		<div class="center">
		<form action="<%=response.encodeURL("/EdilCommerce_Design/Search")%>" method="get">
		<input id="search" type="search"  name="criterioRicerca" size="30" placeholder="Cerca in EdilCommerce Design">
		</form>
		</div> 
	 
	
	<script type="text/javascript" src="/EdilCommerce_Design/script/scroll.js"></script>
	<div class="slideCategorie">
		<input type="button" value="&lt" onclick="scrollL()">
		<div id="categorie">
			<%
				
				if(collection != null){
					if(!collection.isEmpty()) {
						Iterator<CategoriaBean> it = collection.iterator();
						while(it.hasNext()){
							CategoriaBean catBean = it.next();
			%>
			<a title="<%=catBean.getNome() %>" href="<%=response.encodeURL("/EdilCommerce_Design/Search?criterioRicerca=" + catBean.getNome()) %>"><img alt="<%=catBean.getNome() %>" src="<%=catBean.getImmagine()%>"></a>
				
			<% 			
						}		
					}
				}
			%>
		</div>
		<input type="button" value="&gt" onclick="scrollR()">
	</div>
	</div>
	<%@ include file="./footer.jsp" %>
	</div>
</body>
</html>