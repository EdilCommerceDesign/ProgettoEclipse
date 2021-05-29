<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="/EdilCommerce_Design/css/default.css" rel="stylesheet" type="text/css">
<link href="/EdilCommerce_Design/css/result.css" rel="stylesheet" type="text/css">
<title>EdilCommerce Design</title>
</head>
<body>
	<%@ include file="./header.jsp" %>
	
	<%
		ArticoloBean bean = new ArticoloBean();
		Collection<ArticoloBean> collection = (Collection<ArticoloBean>)request.getAttribute("risultato"); 
	%>
	
	<div class="result">
		<%
			if(collection == null) {
		%>
		<h3>Nessun articolo trovato</h3>
		<%
			} else {
				if(collection.isEmpty()) {
		%>
		<h3>Nessun articolo trovato</h3>
		<%
	
				}
		%>
		<table>
		<%
				Iterator<ArticoloBean> it = collection.iterator();
			
				while(it.hasNext()) {
					bean=it.next();
		%>
		<tr><td><img alt="<%=bean.getNome()%>" src="<%=bean.getImmagine()%>"></td>
		<td><h4><%=bean.getNome()%></h4>
		<h5><%DecimalFormat df=new DecimalFormat("#.00");%><%=df.format(bean.getCosto())%>&euro;</h5></td></tr>
		
		<%				
				}		
		%>
		</table>
		<%
			}
		%>
	</div>

</body>
</html>