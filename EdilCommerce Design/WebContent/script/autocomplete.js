function autocomp(){ 
var ricerca= document.getElementById("search").value;
var xhttp = new XMLHttpRequest();
if(ricerca.length>=1){
	document.getElementById("suggerimenti").style.display="block";
xhttp.onreadystatechange = function() {
		if(xhttp.readyState == 4 && xhttp.status == 200) {
			
	    	document.getElementById("suggerimenti").innerHTML = xhttp.responseText;
			
		}
	}
	xhttp.open("GET", "/EdilCommerce_Design/Autocomplete?criterioRicerca=" + ricerca , true);
	xhttp.send();
} else {
	document.getElementById("suggerimenti").style.display="none";
}
		
}