<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*,utils.*,java.util.*"%>
<%@page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="/EdilCommerce_Design/css/header.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<%
	HttpSession headerSession = request.getSession(false);
	Boolean headerUserRole  =  null;
	Boolean headerAdminRole =  null;
	UserBean headerBean =  null;
	if(headerSession != null){
		headerUserRole = (Boolean) headerSession.getAttribute("userRole"); 
		headerAdminRole = (Boolean) headerSession.getAttribute("adminRole"); 
		headerBean = (UserBean) headerSession.getAttribute("loggedUser");
	}
	@SuppressWarnings("unchecked")
	Collection<CategoriaBean> headerCollection = (Collection<CategoriaBean>) getServletContext().getAttribute("Categorie");
	%>
		
	<header>
		<div id="left"><a href="/EdilCommerce_Design/home.jsp" title="Home"><img alt="ECD_Logo" src="/EdilCommerce_Design/img/logo_mini.png"></a></div>
		<div id="centro"> <img alt="lente" src="/EdilCommerce_Design/img/lente.png" width=30px height=30px>
		<input id="search" type="search"  name="search" size="30" placeholder="Cerca in EdilCommerce Design"></div>
		<div id = "rigth">
		<% 
		if(headerUserRole != null && headerAdminRole != null){
			if(headerUserRole.equals(true) || headerAdminRole.equals(true) ){
		%>
		<ul>
			<li><a href="<%=response.encodeURL("/EdilCommerce_Design/user/profilo.jsp")%>" title="Profilo di <%=headerBean.getUsername()%>"><img alt="profilo" src="/EdilCommerce_Design/img/profilo.jpg"></a></li>
			<li><a href="<%=response.encodeURL("/EdilCommerce_Design/Logout")%>" title="Logout"><img alt="logout" src="/EdilCommerce_Design/img/logout.jpg"></a></li>
			<li><a href="<%=response.encodeURL("/EdilCommerce_Design/carrello.jsp")%>" title="Carrello"><img alt="carrello" src="/EdilCommerce_Design/img/carrello.jpg"></a></li>
		</ul>
		<% 	
				}
			} else {
		%>
		<ul>
			<li><a href="<%=response.encodeURL("login.jsp")%>">Login</a></li>
			<li><a href="<%=response.encodeURL("registrazione.jsp")%>">Registrati</a></li>
		</ul>
		<% 
		}
		%>
		</div>
	</header>
	
	<nav><ul class="bottom">
	<%
		if(headerCollection != null){
			if(!headerCollection.isEmpty()) {
				Iterator<CategoriaBean> it = headerCollection.iterator();
				while(it.hasNext()){
					CategoriaBean catBean = it.next();
	%>
	<li><a href="<%=response.encodeURL("/EdilCommerce_Design/Search?criterioRicerca=" + catBean.getNome()) %>"><%=catBean.getNome() %></a></li>			
	<% 			
				}		
			}
		}
	%>
	</ul></nav>
</body>
</html>