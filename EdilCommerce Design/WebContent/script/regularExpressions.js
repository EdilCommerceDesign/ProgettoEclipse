/**
 * 
 */
function checkNome(inputtxt){
	 var nome= /^[A-Za-z]+$/;
	 if(inputtxt.value.match(nome))	
		return true;
	 return false;
}

function checkEmail(inputtxt){
	 var email= /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	 if(inputtxt.value.match(email))	
		return true;
	 return false;
}
function checkPass(inputtxt){
	 var pass= /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}+$/;
	 if(inputtxt.value.match(pass))	
		return true;
	 return false;
}

function checkPhone(inputtxt){
	 var phone= /^([0-9]{3}-[0-9]{7})$/;
	 if(inputtxt.value.match(phone))	
		return true;
	 return false;
}

function checkCap(inputtxt){
	 var cap= /^([0-9]{5})$/;
	 if(inputtxt.value.match(cap))	
		return true;
	 return false;
}

function checkAnno(inputtxt){
	 var anno= /^([0-9]{4})$/;
	 var annoC = new Date().getFullYear();
	 if(inputtxt.value.match(anno))	
		if(inputtxt.value>annoC)
			return true;
	 return false;
}

function checkCvv(inputtxt){
	 var cvv= /^([0-9]{3})$/;
	 if(inputtxt.value.match(cvv))	
		return true;
	 return false;
}

function checkCarta(inputtxt){
	 var carta= /^([0-9])$/;
	 if(inputtxt.value.match(carta))	
		return true;
	 return false;
}
//da fare
function validateLogin(obj){
	var valid= true;
	
	var username= document.getElementsByName("username")[0];
	if(!checkNome(username)){
		valid= false;
		username.classList.add("error");
	}else{
		username.classList.remove("error")
	}
	

	if(valid) obj.submit();
}