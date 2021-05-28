<%@page import="java.util.Iterator"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="model.*,javax.sql.*,utils.*"%>
<!DOCTYPE html>
<html>
<head>

<style>
	body {
  		<!--background-image: url("./img/casa.jpg") ; 
   background-repeat: no-repeat; -->
	}
</style>
	
	<!-- <link rel="stylesheet" type="text/css" href="home.css"/> -->
	<meta charset="ISO-8859-1">
	<meta lang="it">
	<link href="/EdilCommerce_Design/css/default.css" rel="stylesheet" type="text/css">
	<link href="/EdilCommerce_Design/css/home.css" rel="stylesheet" type="text/css">
	<title>Benvenuto in Edil Commerce Design</title>
</head>
<body>
	<%
	Boolean userRole = (Boolean) request.getSession().getAttribute("userRole"); 
	Boolean adminRole = (Boolean) request.getSession().getAttribute("adminRole"); 
	UserBean bean = (UserBean) request.getSession().getAttribute("loggedUser");
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
				<li><abb title="Profilo di <%=bean.getUsername()%>"><a href="/EdilCommerce_Design/user/profilo.jsp"><img alt="profilo" src="/EdilCommerce_Design/img/profilo.jpg"></a></abb></li>
				<li><abb title="Logout"><a href="/EdilCommerce_Design/Logout" ><img alt="logout" src="/EdilCommerce_Design/img/logout.jpg"></a></abb></li>
				<li><abb title="Carrello"><a href="" ><img alt="carrello" src="/EdilCommerce_Design/img/carrello.jpg"></a></abb></li>
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
		
		<img alt="logo-edil" src="/EdilCommerce_Design/img/logo.png" id="mainLogo">
	
	  <form action="" method="get">
		<div class="center">


			<input id="search" type="search"  name="search" size="30" placeholder="Cerca in EdilCommerce Design" >

			<!--  <a href="" ><img alt="" src="./img/lente.png" width=30px height=30px></a>-->

			<!--  <a href="" ><img alt="" src="./img/lente.png" width=30px height=30px></a>-->

		</div> 
	</form> 
	
	<div class="categorie">
		<%
			
			if(collection != null){
				if(!collection.isEmpty()) {
					Iterator<CategoriaBean> it = collection.iterator();
					while(it.hasNext()){
						CategoriaBean catBean = it.next();
		%>
		<abb title="<%=catBean.getNome() %>"><img alt="<%=catBean.getNome() %>" src="<%=catBean.getImmagine()%>"></abb>
			
		<% 			
					}		
				}
			}
		%>
	</div>
	
	<script type="text/javascript">
	function scrollRight(){
		  document.getElementByClass('categorie').scrollRight -= 15; // vertical scroll increments
		  timerScrollUp = setTimeout('scrollRight()',2);
		}
	</script>
</body>
</html>