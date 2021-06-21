/**
 * 
 */

function getXmlHttpRequest() {
	
	var xhr = false;
	var activateXoptions = new Array("Microsoft.XmlHttp", "MSXML4.XmlHttp" , "MSXML3.XmlHttp", "MSXML2.XmlHttp", "MSXML.XmlHttp");

	try {
		xhr = new XMLHttpRequest();
	} catch(e) {}
	
	if(!xhr) {
		var created = false;
		for(var i=0; i < activateXoptions.length && !created; i++) {
			try {
				xhr = new ActiveXObject(activeXoptions[i]);
				created = true;
			} catch(e) {}
		}
	}
	return xhr;
}

function deleteItem(codice, id) {
	var xhttp = getXmlHttpRequest();
		xhttp.onreadystatechange = function() {
		if(xhttp.readyState == 4 && xhttp.status == 200) {
			document.getElementById(id).innerHTML = xhttp.responseText;
			document.getElementById("checkout").innerHTML = '<h4>Carrello <span class="prezzo" style="color:black"><i class="fa fa-shopping-cart"></i> <%=articoli.size()%></span></h4>'
				 + '<h4>Totale: <span class="prezzo" style="color:black"><%=df.format(totale)%>&euro;</span></h4>'
				+ '<a href="<%= response.encodeURL("/EdilCommerce_Design/user/checkout.jsp")%>"><button class="bottone" >Procedi al pagamento</button></a>';
		}
	};
	xhttp.open("GET", "/EdilCommerce_Design/Rimuovi?codice=" + codice, true);
	xhttp.send();
}

function aggiornaQuantita(index) {
	var xhttp = getXmlHttpRequest();
	var q = document.getElementsByClassName("quantita")[index].value;
	xhttp.open("GET", "/EdilCommerce_Design/AggiornaQ?codice=" + index +"&quantita=" + q, true);
	xhttp.send();
}