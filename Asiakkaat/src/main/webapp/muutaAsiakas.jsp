<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="scripts/main.js"></script>
<script src="scripts/io.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">
<title>Asiakkaan tietojen muutos</title>
</head>
<body onload="asetaFocus('etunimi')" onkeydown="tutkiKey(event, 'paivita')">
<form name="lomake">
	<p id="otsikko">Muuta asiakkaan tietoja</p>
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
				<td><input type="button" value="Hyväksy" id="hakunappi" onclick="tutkiJaPaivita()" /></td>
			</tr>
		</tbody>
	</table>
		<input type="hidden" name="asiakas_id" id="asiakas_id">
	</form>
	<span id="ilmo"></span>
</body>
<script>
haeAsiakas();
</script>
</html>