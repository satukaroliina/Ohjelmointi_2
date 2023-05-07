<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="scripts/main.js"></script>
<script src="scripts/io.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">
<title>Asiakkaan lisäys</title>
</head>
<body onload="asetaFocus('etunimi')" onkeydown="tutkiKey(event, 'lisaa')">
<form name="lomake">
	<p id="otsikko">Uuden asiakkaan lisäys</p>
	<p><a id="linkki" href="listaaAsiakkaat.jsp">Takaisin listaukseen</a></p>
	<table>
		<thead>			
			<tr>
				<th>Etunimi</th>
				<th>Sukunimi</th>
				<th>Puhelinnumero</th>
				<th>Sähköposti</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" name="etunimi" id="etunimi" /></td>
				<td><input type="text" name="sukunimi" id="sukunimi" /></td>
				<td><input type="text" name="puhelin" id="puhelin" /></td>
				<td><input type="text" name="sposti" id="sposti" /></td> 
				<td><input type="button" value="Lisää" id="hakunappi" onclick="tutkiJaLisaa()" /></td>
			</tr>
		</tbody>
	</table>
</form>
<p id="ilmo"></p>
</body>
</html>