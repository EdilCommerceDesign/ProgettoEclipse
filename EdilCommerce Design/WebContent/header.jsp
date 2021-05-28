<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*,utils.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="/EdilCommerce_Design/css/header.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<%
	Boolean headerUserRole = (Boolean) session.getAttribute("userRole");
	Boolean headerAdminRole = (Boolean) session.getAttribute("adminRole");
	UserBean headerBean = (UserBean) session.getAttribute("loggedUser");
	Collection<CategoriaBean> headerCollection = (Collection<CategoriaBean>) getServletContext().getAttribute("Categorie");
	
	%>
		
	<header>
		<div id="left"><abb title="Home"><a href="/EdilCommerce_Design/home.jsp"><img alt="ECD_Logo" src="/EdilCommerce_Design/img/logo_mini.png"></a></abb></div>
		<div id="centro"> <img alt="lente" src="/EdilCommerce_Design/img/lente.png" width=30px height=30px>
		<input id="search" type="search"  name="search" size="30" placeholder="Cerca in EdilCommerce Design"></div>
		<div id = "rigth">
		<% 
		if(headerUserRole != null && headerAdminRole != null){
			if(headerUserRole.equals(true) || headerAdminRole.equals(true) ){
		%>
		<ul>
			<li><abb title="Profilo di <%=headerBean.getUsername()%>"><a href="/EdilCommerce_Design/user/profilo.jsp"><img alt="profilo" src="/EdilCommerce_Design/img/profilo.jpg"></a></abb></li>
			<li><abb title="Logout"><a href="/EdilCommerce_Design/Logout" ><img alt="logout" src="/EdilCommerce_Design/img/logout.jpg"></a></abb></li>
			<li><abb title="Carrello"><a href="" ><img alt="carrello" src="/EdilCommerce_Design/img/carrello.jpg"></a></abb></li>
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
		<ul class="bottom">
		<%
			if(headerCollection != null){
				if(!headerCollection.isEmpty()) {
					Iterator<CategoriaBean> it = headerCollection.iterator();
					while(it.hasNext()){
						CategoriaBean catBean = it.next();
		%>
		<li><a href=""><%=catBean.getNome() %></a></li>			
		<% 			
					}		
				}
			}
		%>
		</ul>
	</header>
</body>
</html>