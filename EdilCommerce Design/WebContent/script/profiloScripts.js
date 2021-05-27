/**
 * 
 */

function setModificable(name) {
	document.getElementsByName(name)[0].removeAttribute("readonly");
}

function controllaPass(pass1, pass2, mes, sub) {
    
	var e1 = document.getElementById(pass1).value;
	var e2 = document.getElementById(pass2).value;
	if (e1 != e2) {
		document.getElementById(mes).removeAttribute("hidden");
		document.getElementById(sub).setAttribute("disabled", "disabled");
	} else {
		document.getElementById(mes).setAttribute("hidden", true);
		document.getElementById(sub).removeAttribute("disabled");
		
	}
}