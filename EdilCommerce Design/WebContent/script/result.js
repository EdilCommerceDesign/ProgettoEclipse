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

function aggiorna(codice) {
	var xhttp = getXmlHttpRequest();
		xhttp.onreadystatechange = function() {
		if(xhttp.readyState == 4 && xhttp.status == 200) {
			document.getElementById("result").innerHTML = xhttp.responseText;
		}
	};
	
	var prezzo="", ordine="", l;
	var list = document.getElementsByName("prezzo");
	l = list.length;
	for(var i=0; i<l; i++) {
		if(list[i].checked==true){
			prezzo = list[i].value;
			break;
		}
	}
	
	list= document.getElementsByName("ordine");
	l = list.length;
	for(var i=0; i<l; i++) {
		if(list[i].checked == true) {
			ordine = list[i].value;
			break;
		}
	}
	
	xhttp.open("GET", "/EdilCommerce_Design/AggiornaSearch?criterioRicerca=" + codice + "&prezzo=" + prezzo + "&ordine=" + ordine, true);
	xhttp.send();
}