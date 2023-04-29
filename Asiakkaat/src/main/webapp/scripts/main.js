
function serialize_form(form){
	return JSON.stringify(
	    Array.from(new FormData(form).entries())
	        .reduce((m, [ key, value ]) => Object.assign(m, { [key]: value }), {})
	        );	
}

function haeAsiakkaat() {
	let url = "asiakkaat?hakusana=" + document.getElementById("hakusana").value;
	let requestOptions = {
			method: "GET",
			headers: { "Content-Type": "application/x-www-form-urlencoded" }
	};
	fetch(url, requestOptions)
	.then(response => response.json())
	.then(response => printItems(response))
	.catch(errorText => console.error("Fetch failed: " + errorText));
}

function printItems(respObjList) {
	let htmlStr="";
	for (let item of respObjList) {
		htmlStr+="<tr id='rivi_"+item.asiakas_id+"'>";
		htmlStr+="<td>"+item.etunimi+"</td>";
		htmlStr+="<td>"+item.sukunimi+"</td>";
		htmlStr+="<td>"+item.puhelin+"</td>";
		htmlStr+="<td>"+item.sposti+"</td>";
		htmlStr+="<td><button onclick=varmistaPoisto("+item.asiakas_id+",'"+encodeURI(item.etunimi)+"')>Poista</button></td>";
		htmlStr+="</tr>";
	}
	document.getElementById("tbody").innerHTML = htmlStr;
}

function tutkiJaLisaa(){
	if(tutkiTiedot()){
		lisaaTiedot();
	}
}

function tutkiTiedot(){
	let ilmo="";
	if(document.getElementById("etunimi").value.length<1){
		ilmo="Etunimi ei kelpaa";	
		document.getElementById("etunimi").focus();	
	}else if(document.getElementById("sukunimi").value.length<1){
		ilmo="Sukunimi ei kelpaa";
		document.getElementById("sukunimi").focus();			
	}else if(document.getElementById("puhelin").value.length<1){
		ilmo="Puhelinnumero ei kelpaa";	
		document.getElementById("puhelin").focus();	
	}else if(document.getElementById("sposti").value.length<1){
		ilmo="Sähköpostiosoite ei kelpaa";	
		document.getElementById("sposti").focus();
	}	
	if(ilmo!=""){
		document.getElementById("ilmo").innerHTML=ilmo;
		setTimeout(function(){ document.getElementById("ilmo").innerHTML=""; }, 3000);
		return false;
	}else{
		document.getElementById("etunimi").value=siivoa(document.getElementById("etunimi").value);
		document.getElementById("sukunimi").value=siivoa(document.getElementById("sukunimi").value);
		document.getElementById("puhelin").value=siivoa(document.getElementById("puhelin").value);
		document.getElementById("sposti").value=siivoa(document.getElementById("sposti").value);	
		return true;
	}
}

function siivoa(teksti){
	teksti=teksti.replace(/</g, "");
	teksti=teksti.replace(/>/g, "");	
	teksti=teksti.replace(/'/g, "''");
	return teksti;
}

function lisaaTiedot(){
	let formData = serialize_form(document.lomake);
	let url = "asiakkaat";    
    let requestOptions = {
        method: "POST",
        headers: { "Content-Type": "application/json" },  
    	body: formData
    };    
    fetch(url, requestOptions)
    .then(response => response.json())
   	.then(responseObj => {
   		if(responseObj.response==0){
   			document.getElementById("ilmo").innerHTML = "Asiakkaan lisäys epäonnistui.";	
        }else if(responseObj.response==1){ 
        	document.getElementById("ilmo").innerHTML = "Asiakkaan lisäys onnistui.";
			document.lomake.reset();	        	
		}
		setTimeout(function(){ document.getElementById("ilmo").innerHTML=""; }, 3000);
   	})
   	.catch(errorText => console.error("Fetch failed: " + errorText));
}

function varmistaPoisto(asiakas_id, sukunimi){
	if(confirm("Poista asiakas " + decodeURI(sukunimi) +"?")){
		poistaAsiakas(asiakas_id, encodeURI(sukunimi));
	}
}

function poistaAsiakas(asiakas_id, sukunimi){
	let url = "asiakkaat?asiakas_id=" + asiakas_id;    
    let requestOptions = {
        method: "DELETE"             
    };    
    fetch(url, requestOptions)
    .then(response => response.json())
   	.then(responseObj => {	
   		if(responseObj.response==0){
			alert("Asiakkaan poisto epäonnistui.");	        	
        }else if(responseObj.response==1){ 
			document.getElementById("rivi_"+asiakas_id).style.backgroundColor="red";
			alert("Asiakkaan " + decodeURI(sukunimi) +" poisto onnistui.");
			haeAsiakkaat();        	
		}
   	})
   	.catch(errorText => console.error("Fetch failed: " + errorText));
}