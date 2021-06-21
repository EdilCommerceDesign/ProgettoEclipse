/**
 * 
 */

function disabilita() {
	var node = document.getElementById("cname");
	node.setAttribute("disabled", "disabled");
	node.value = "";
	node = document.getElementById("ccnum");
	node.setAttribute("disabled", "disabled");
	node.value = "";
	node = document.getElementById("expmonth");
	node.setAttribute("disabled", "disabled");
	node.value = "";
	node = document.getElementById("expyear");
	node.setAttribute("disabled", "disabled");
	node.value = "";
	node = document.getElementById("cvv");
	node.setAttribute("disabled", "disabled");
	node.value = "";
}

function abilita() {
	document.getElementById("cname").removeAttribute("disabled");
	document.getElementById("ccnum").removeAttribute("disabled");
	document.getElementById("expmonth").removeAttribute("disabled");
	document.getElementById("expyear").removeAttribute("disabled");
	document.getElementById("cvv").removeAttribute("disabled");
}