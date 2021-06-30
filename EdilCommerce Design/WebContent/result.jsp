<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.text.*"%>
<%@page session="false" %>
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
	<script type="text/javascript" src="/EdilCommerce_Design/script/result.js"></script>
	<div id="scelte">
		<b>Ordine Alfabetico</b><br>
		<label><input type="radio" name="ordine" value="nome ASC" onchange="aggiorna('<%=request.getParameter("criterioRicerca")%>')">Crescente</label><br>
		<label><input type="radio" name="ordine" value="nome DESC" onchange="aggiorna('<%=request.getParameter("criterioRicerca")%>')">Decrescente</label><br>
		<hr>
		<b>Ordina Prezzo</b><br>
		<label><input type="radio" name="ordine" value="costo ASC" onchange="aggiorna('<%=request.getParameter("criterioRicerca")%>')">Crescente</label><br>
		<label><input type="radio" name="ordine" value="costo DESC" onchange="aggiorna('<%=request.getParameter("criterioRicerca")%>')">Decrescente</label><br>
		<hr>
		<b>Prezzo</b><br>
		<label><input type="checkbox" name="prezzo" value="BETWEEN 0.0 AND 50.0" onclick="mutua('BETWEEN 0.0 AND 50.0')" onchange="aggiorna('<%=request.getParameter("criterioRicerca")%>')">0-50&euro;</label><br>
		<label><input type="checkbox" name="prezzo" value="BETWEEN 50.01 AND 200.0" onclick="mutua('BETWEEN 50.01 AND 200.0')" onchange="aggiorna('<%=request.getParameter("criterioRicerca")%>')">50-200&euro;</label><br>
		<label><input type="checkbox" name="prezzo" value="BETWEEN 200.01 AND 99999.0" onclick="mutua('BETWEEN 200.01 AND 99999.0')" onchange="aggiorna('<%=request.getParameter("criterioRicerca")%>')">&lt;200&euro;</label><br>
	</div>
	
	<div id="result">
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
				int pag = 1, count=0;
				while(it.hasNext()) {
					if(count==7) {
						count=0;
						pag++;
					}
					bean=it.next();
					count++;
		%>
		
		<tr class="<%="pagina"+ pag%> pagina">
		<td><a href="<%=response.encodeURL("/EdilCommerce_Design/articolo.jsp?articolo=" + bean.getCodiceArticolo())%>"><img alt="<%=bean.getNome()%>" src="<%=bean.getImmagine()%>"></a></td>
		<td><h4><a href="<%=response.encodeURL("/EdilCommerce_Design/articolo.jsp?articolo=" + bean.getCodiceArticolo())%>"><%=bean.getNome()%></a></h4>
		<h5><%DecimalFormat df=new DecimalFormat("#0.00");%><%=df.format(bean.getCosto())%>&euro;</h5>
		</td></tr>
		
		<%				
				}		
		%>
		</table>
		<%
		
		%>
		<br>
		<div class="paginazione">
		<a href="javascript:void(0);" onclick="prevPag()">&lt;</a>
		<%
				int i;
				for(i=0; i<pag; i++) {
		%>
		<a href="javascript:void(0);" onclick="cambiaPag('<%=i+1%>')"><%="" + (i+1)%></a>
		<%			
				}
		%>
		<a href="javascript:void(0);" onclick="succPag()">&gt;</a>
		</div>
		<%
			}
		%>
	</div>
	<%@ include file="./footer.jsp" %>
</body>
</html>