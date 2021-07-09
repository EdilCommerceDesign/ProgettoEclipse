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
		
		<div class="visualizzazione">
			<img alt="<%=bean.getNome()%>" src="<%=bean.getImmagine()%>" class="articolo">
			 <div class="checkout">
				<h3><%=bean.getCosto() %>&euro;</h3>
				<p>Spedizione gratuita per ordini oltre i 20&euro;</p>
				<form action="<%=response.encodeURL("/EdilCommerce_Design/Aggiungi")%>" method="get">
					<input type="hidden" name="codice" value="<%=bean.getCodiceArticolo() %>">
					<label>Quantit�: <input name="quantita" type="number" value="1" min="1" class="quantit�"></label>
				 	<input type="submit" value="Aggiungi al carrello" class="aggiungi">
			 	</form>
			 </div>
			<h2><%=bean.getNome() %></h2>
			<p><%=bean.getDescrizione()%></p>
		</div>
		<div class="recensioni">
		<div id="scriviRecensione">
		<h3>Lascia qui una recensione del prodotto</h3>
		<%HttpSession session = request.getSession(false);
		if(session==null) {
		%>
		<textarea rows="5" cols="50" maxlength="500" placeholder="Effettua il login per scrivere una recensione" disabled></textarea><br>
		<input type="button" value="Invia recensione" disabled>	
		<%
		} else {
			Boolean uRole = (Boolean) session.getAttribute("userRole");
			if(uRole.equals(false)) {%>
			<textarea rows="5" cols="50" maxlength="500" placeholder="Effettua il login per scrivere una recensione" disabled></textarea><br>
			<input type="button" value="Invia recensione" disabled>			
		<%
			} else {
				RecensisceModelDS rModel = new RecensisceModelDS((DataSource)getServletContext().getAttribute("DataSource"));
				UserBean user = (UserBean) session.getAttribute("loggedUser");
				RecensisceBean rBean = rModel.doRetriveByKey(user.getUsername(), bean.getCodiceArticolo());
				if(!rBean.isEmpty()){
		%>
			<input type="button" value="X" title="Cancella recensione" onclick="CancellaRecensione()">
			<textarea id="testoRecensione" rows="5" cols="50" maxlength="500" placeholder="Inserisci qui la tua recensione"><%=rBean.getTesto()%></textarea><br>
			<input type="button" value="Aggiorna recensione" onclick="AggiornaRecensione()">
		<%
				} else {		
			for(int i=1; i<6; i++) {
				%>
				<span class="fa fa-star" onmouseover="Seleziona('<%=i%>')" onclick="SetSelezionati('<%=i%>')"></span>
				<%
			}
			%>
			<br>
			<input id="stelle" type="number" hidden="true" min="1" max="5">
			<textarea rows="5" cols="50" maxlength="500" placeholder="Inserisci qui la tua recensione"></textarea><br>
			<input type="button" value="Invia recensione" onclick="InviaRecensione()">
		<%
				}	
			}
		}
		%>
		</div>
		<div>
		<%
		RecensisceModelDS rModel = new RecensisceModelDS((DataSource)getServletContext().getAttribute("DataSource"));
		LinkedList<RecensisceBean> recensioni = (LinkedList<RecensisceBean>) rModel.doRetriveByCodiceArticolo(bean.getCodiceArticolo());
		if(recensioni.isEmpty()){
		%>
		 <h4>Nessuna recensione per questo articolo</h4>
		<%	
		} else {
			Iterator<RecensisceBean> it = recensioni.iterator();
			while(it.hasNext()){
				RecensisceBean rBean = new RecensisceBean();
				rBean = it.next();
		%>
			<h4><%=rBean.getUsername()%></h4><h5><%=rBean.getDate()%></h5>
			<p class="recensione"><%=rBean.getTesto()%></p>	
		<%		
			}	
		}
		%>
		
		</div>
		
		</div>
		</div>
	<%@ include file="./footer.jsp" %>
	</div>
</body>
</html>