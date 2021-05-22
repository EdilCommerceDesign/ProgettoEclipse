/**
 * 
 */

function setModificable(name) {
	document.getElementsByName(name)[0].removeAttribute("readonly");
}

function controllaPass(id1, id2, id3) {
	var e1 = document.getElementById(id1).value;
	var e2 = document.getElementById(id2).value;
	if (e1 != e2) {
		document.getElementById(id3).removeAttribute("hidden");
	} else {
		document.getElementById(id3).setAttribute("hidden", true);
	}
}

