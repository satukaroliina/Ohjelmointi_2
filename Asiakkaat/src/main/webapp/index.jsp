<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="scripts/main.js"></script>
<script src="scripts/login.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">
<title>Kirjautuminen</title>
</head>
<body onload="loginForm.uid.focus();" onkeydown="tutkiKey(event, 'kirjaudu')">
<div id="loginDiv">	
	<form name="loginForm">
	<p id="otsikko">Kirjaudu sisään</p>
	<label>&nbsp;</label><span id="ilmo"></span><br>	
	<label>Sähköposti:</label><input type="text" name="uid" id="uid"><br>
	<label>Salasana:</label><input type="password" name="pwd" id="pwd"><br>
	<label>&nbsp;</label><input type="button" value="Kirjaudu" onclick="hashPwd()" ><br>	
	<input type="hidden" name="hashedPwd" id="hashedPwd">	
	</form>
</div>
<script>
if(requestURLParam("unknown")!=null){
	document.getElementById("ilmo").innerHTML="Käyttäjää ei tunneta!";
	setTimeout(function(){ document.getElementById("ilmo").innerHTML=""; }, 3000);
}
</script>
</body>
</html>