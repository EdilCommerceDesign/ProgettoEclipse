<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.SQLException" import="java.text.*"%>
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
Carrello<ArticoloBean> carrello = (Carrello<ArticoloBean>) session.getAttribute("Carrello");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<meta lang="it">
	<link href="/EdilCommerce_Design/css/default.css" rel="stylesheet" type="text/css">
    <link href="/EdilCommerce_Design/css/checkout.css" rel="stylesheet" type="text/css">
	<title>Pagamento</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<%@ include file="../header.jsp" %>
	<h2>Riepilogo carrello</h2>

<div class="row">
  <div class="col-75">
    <div class="container">
      <form action="">
      
        <div class="row">
          <div class="col-50">
            <h3>Indirizzo di fatturazione</h3>
            <label for="fname"><i class="fa fa-user"></i> Nome</label>
            <input type="text" id="fname" name="firstname" placeholder="Mario">
            
            <label for="lname"><i class="fa fa-user"></i> Cognome</label>
            <input type="text" id="lname" name="laststname" placeholder="Rossi">
            
            <label for="email"><i class="fa fa-envelope"></i> Email</label>
            <input type="text" id="email" name="email" placeholder="marioRossi@example.com">
            
            <label for="adr"><i class="fa fa-phone"></i> Telefono</label>
            <input type="text" id="tel" name="telefono" placeholder="088-8888">
            
            <label for="adr"><i class="fa fa-address-card-o"></i> Indirizzo</label>
            <input type="text" id="adr" name="address" placeholder="via umberto I">
            
            <label for="city"><i class="fa fa-institution"></i> Città</label>
            <input type="text" id="city" name="city" placeholder="Salerno">

            <div class="row">
              <div class="col-50">
                <label for="state">Stato</label>
                <input type="text" id="state" name="state" placeholder="IT">
              </div>
              <div class="col-50">
                <label for="zip">CAP</label>
                <input type="text" id="zip" name="cap" placeholder="84085">
              </div>
            </div>
          </div>
		<script type="text/javascript" src="/EdilCommerce_Design/script/checkout.js"></script>
          <div class="col-50">
            <h3>Pagamento con carta o contrassegno</h3>
             <label><h4><input type="radio" checked="checked" name="metodo" onclick="abilita()"> Carta </h4></label>
             <label><h4><input type="radio"  name="metodo" onclick="disabilita()"> Contrassegno </h4></label>
            <label for="fname">Carte Accettate</label>
            <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"></i>
              <i class="fa fa-cc-amex" style="color:blue;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
              <i class="fa fa-cc-discover" style="color:orange;"></i>
            </div>
            <label for="cname">Intestatario della carta</label>
            <input type="text" id="cname" name="cardname" placeholder="Mario Rossi">
            <label for="ccnum">Numero carta</label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
            <label for="expmonth">Validità (mese)</label>
            <input type="text" id="expmonth" name="expmonth" placeholder="Settembre">
            <div class="row">
              <div class="col-50">
                <label for="expyear">Validità (anno)</label>
                <input type="text" id="expyear" name="expyear" placeholder="2022">
              </div>
              <div class="col-50">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="352">
              </div>
            </div>
          </div>
          
        </div>
        <label>
          <input type="checkbox" checked="checked" name="sameadr"> Indirizzo di spedizione uguale a quello di fatturazione
        </label>
        <input type="submit" value="Continua al checkout" class="btn">
      </form>
    </div>
  </div>
  <div class="col-25">
    <div class="container">
	<%
	List<ArticoloBean> articoli = carrello.getItems();
	List<Integer> quantità = carrello.getQuantità();
	Iterator<ArticoloBean> it1 = articoli.iterator();
	Iterator<Integer> it2 = quantità.iterator();
	DecimalFormat df = new DecimalFormat("#.00");
		
	ArticoloBean bean = new ArticoloBean();
	Integer q = 0;
	double totale = 0;
	%>
	<h4><a class="link-nero" href="<%= response.encodeURL("/EdilCommerce_Design/user/carrello.jsp")%>">Carrello</a> <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <%=articoli.size()%></span></h4>
	<%
			
	while(it1.hasNext() && it2.hasNext()){
		bean=it1.next();
		q=it2.next();
	%>
      <p><%=q%> <a href="<%= response.encodeURL("/EdilCommerce_Design/articolo.jsp?articolo=" + bean.getCodiceArticolo())%>"><%=bean.getNome() %></a>  <span class="price"><%=df.format(bean.getCosto() * q)%>&euro;</span></p>
    <%
   	 totale = totale + (q * bean.getCosto());
	}
    %>    
      <hr>
      <p>Totale <span class="price" style="color:black"><%=df.format(totale)%>&euro;</span></p>
    </div>
  </div>
</div>

</body>
</html>