<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
<script src="scripts/main.js"></script>
<script src="scripts/io.js"></script>
<title>Asiakkaat</title>
</head>
<body onload="asetaFocus('hakusana')" onkeydown="tutkiKey(event, 'listaa')">
<form>
<p><a id="linkki" href="login?logout=1">Kirjaudu ulos (<%out.print(session.getAttribute("kayttaja"));%>)</a></p>
</form>
<p><span id="haku">Hakusana:</span> 
<input type="text" id="hakusana">   
<input type="button" value="Hae" id="hakunappi" onclick="haeAsiakkaat()"></p>
<table id="listaus">
	<thead>
		<tr>
		<th>Etunimi</th>
		<th>Sukunimi</th>
		<th>Puhelin</th>
		<th>Sähköposti</th>
		<th><a id="linkki" href="lisaaAsiakas.jsp">Lisää uusi asiakas</a></th>
		</tr>
	</thead>
	<tbody id = "tbody">	
	</tbody>
</table>
<span id="ilmo"></span>
<script>
haeAsiakkaat();
</script>
</body>
</html>