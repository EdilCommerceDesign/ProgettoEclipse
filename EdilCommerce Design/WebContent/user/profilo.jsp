<%@page import="java.sql.SQLException"%>
<%@page session="false" %>
<%
HttpSession session = request.getSession(false);
if(session == null) {
	response.sendRedirect(response.encodeRedirectURL("/EdilCommerce_Design/login.jsp"));
	return;
} else {
	Boolean userRole = (Boolean) session.getAttribute("userRole");
	if((userRole == null) || (!userRole.booleanValue())) {
		response.sendRedirect(response.encodeRedirectURL("/EdilCommerce_Design/login.jsp"));
		return;
	}
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="javax.sql.*,model.*,utils.*"%>
<!DOCTYPE html>
<%
UserBean bean = (UserBean) session.getAttribute("loggedUser");
if (bean == null) {
	session.removeAttribute("userRole");
	session.removeAttribute("adminRole");
	session.invalidate();
	response.sendRedirect(response.encodeRedirectURL("/EdilCommerce_Design/login.jsp"));
	return;
}
%>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="/EdilCommerce_Design/css/default.css" rel="stylesheet" type="text/css">
<link href="/EdilCommerce_Design/css/profilo.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title><%=bean.getUsername()%></title>
</head>

<body>
	<%@ include file="../header.jsp" %>
	<script type="text/javascript" src="/EdilCommerce_Design/script/profiloScripts.js"></script>
	<%
	String error = (String) request.getAttribute("error");
	if (error != null && !error.equals("")) {
	%>
	<p style="color: red"><%=error%>
	<%
	}
	%>
	<h1>AREA UTENTE</h1>
	<h2>Benvenuto <%=bean.getUsername() %>, qui puoi modificare le tue informazioni personali</h2>
	<ul>
		<li onclick="visualizza('infoP')"><h2>Informazioni personali</h2></li>
		<div class="container" id="infoP" style="display: none;">
			<h2 style="text-align: center">Informazioni personali</h2>
			<form id="profilo" method="post" action="<%=response.encodeURL("/EdilCommerce_Design//Modifica")%>">
				<div class="flex">
					  	<div class="col-50">
								<label for="nome"><i class="fa fa-user"></i> Nome</label>
								<input type="text" name="nome" placeholder="ex. Mario" required readonly  value="<%= bean.getNome() %>">
								
								<label for="cognome"><i class="fa fa-user"></i> Cognome</label>
								<input type="text" name="cognome" placeholder="ex. Rossi" required readonly value="<%= bean.getCognome() %>">
								
								<label for="username"><i class="fa fa-user"></i> Username</label>
								<input type="text" name="username" placeholder="ex. Rossi" required readonly value="<%= bean.getUsername() %>">
								
								<label for="email"><i class="fa fa-envelope"></i> E-mail</label>
								<input type="email" name="email" placeholder="mario@ex.com" required readonly value="<%= bean.getEmail()%>">
								
								<label for="password"><i class="fa fa-lock"></i> Password</label>
								<input id="pass" type="password" name="password" placeholder="Password" required readonly value="<%= bean.getUserPassword() %>" onkeyup="controllaPass('pass', 'confermaPass', 'salva')">
								
								<label for="confermaPass"><i class="fa fa-lock"></i> Conferma Password</label>
								<input id="confermaPass" type="password" name="confermaP" placeholder="Password" required readonly value="<%= bean.getUserPassword() %>" onkeyup="controllaPass('pass', 'confermaPass', 'salva')">
						</div>
								
						<div class="col-50">		
								<label for="indirizzo"><i class="fa fa-address-card-o"></i> Indirizzo</label>
								<input type="text" name="indirizzo" placeholder="ex. via demanio 7/1" required readonly value="<%= bean.getIndirizzo() %>">
								
								<label for="telefono"><i class="fa fa-phone"></i> Telefono</label>
								<input type="text" name="telefono" placeholder="ex. 089893888" required readonly value="<%= bean.getTelefono() %>">
							
								<label for="citta"><i class="fa fa-institution"></i> Città</label>
								<input type="text" name="citta" placeholder="Salerno" required readonly value="<%= bean.getCittà() %>">
								
								<label for="cap"><i class="fa fa-home"></i> Cap</label>
								<input type="text" name="cap" placeholder="800000" required readonly value="<%= bean.getCap() %>">
								
								<label for="stato"><i class="fa fa-home"></i> Stato</label>
								<input type="text" name="stato" placeholder="IT" required readonly value="<%= bean.getStato() %>">
								
								<input type="hidden" name="originalUsername" value ="<%=bean.getUsername() %>">
						</div>
							
								<br><input type="submit" id="salva" value="Salva" >&nbsp;<input type="reset" value="Reset">&nbsp;<input type="button" onclick='setModificable()' value="Modifica">
				</div>
			</form>
		</div>
		<li onclick="visualizza('ordiniE')"><h2>Ordini effettuati</h2></li>
			<div class="container" id="ordiniE" style="display:none">
				<%
					DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
				
					OrdineModelDS oModel = new OrdineModelDS(ds);
					PagamentoModelDS pModel = new PagamentoModelDS(ds);
					ComponeModelDS cModel = new ComponeModelDS(ds);
					CartaModelDS caModel = new CartaModelDS(ds);
					ContrassegnoModelDS coModel = new ContrassegnoModelDS(ds);
					ArticoloModelDS aModel = new ArticoloModelDS(ds);
					
					LinkedList<OrdineBean> oList = (LinkedList<OrdineBean>) oModel.doRetriveByUser(bean.getUsername());
					
					boolean primoOrdine = true;
				
					Iterator<OrdineBean> it = oList.iterator();
					if(!it.hasNext()) {
				%>
				<h3>Non hai ancora effettuato un ordine</h3>
				<%			
					}
					while(it.hasNext()) {
						 if(primoOrdine==true) {
							 primoOrdine = false;
						 } else {
						%><hr><%
						 }
						OrdineBean oBean = it.next();
					
						PagamentoBean pBean = (PagamentoBean) pModel.doRetriveByNumeroOrdine(oBean.getNumeroOrdine());
						
						CartaBean caBean = caModel.doRetriveByKey(pBean.getNumeroPagamento());
						ContrassegnoBean coBean = coModel.doRetriveByKey(pBean.getNumeroPagamento());
						
				%>
					<div>
					<h2>Codice Ordine: <%=oBean.getNumeroOrdine()%></h2>
					<h3>Metodo di pagamento: 
				<%
					if(caBean.isEmpty()){ 
				%> 
						Contrassegno
				<%
					}else{
				%> 
						<%="Carta NumeroCarta:****" + caBean.getNumero().substring(caBean.getNumero().length() - 4) + " Intestario carta:" + caBean.getIntestatario()%>
				<%
					}
				 %>
					</h3>
					<h3>Importo ordine: <%=pBean.getImporto()%>&euro;</h3>
				<%
						
						LinkedList<ComponeBean> cList = (LinkedList<ComponeBean>) cModel.doRetriveByOneKey(oBean.getNumeroOrdine() + "");
						Iterator<ComponeBean> it1 = cList.iterator(); 
				%>
					<h3>Articoli che compongono l'ordine:</h3><ul>
				<%		
				
						while(it1.hasNext()){
							ComponeBean cBean = it1.next();
							ArticoloBean aBean = aModel.doRetriveByKey(cBean.getCodiceArticolo()); 
				%>
					<li><a href="<%=response.encodeURL("/EdilCommerce_Design/articolo.jsp?articolo=" + aBean.getCodiceArticolo())%>"><%=aBean.getNome()%></a>, quantità:<%=cBean.getQuantità()%></li>
				<%			
						}
				%>
					</ul></div>
				<%
					}
					
				%>
			</div>
	</ul>
	<%@ include file="../footer.jsp" %>
</body>
</html>