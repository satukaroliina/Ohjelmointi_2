<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="style.css" rel="stylesheet">
<script src="scripts/main.js"></script>
<title>Asiakkaat</title>
</head>
<body>
<form>
<p>
Hakusana:  
<input type="text" id="hakusana">   
<input type="button" value="Hae" id="hakunappi" onclick="haeAsiakkaat()">
</p>  
</form>
<table id="listaus">
	<thead>
		<tr>
		<th>Etunimi</th>
		<th>Sukunimi</th>
		<th>Puhelin</th>
		<th>Sähköposti</th>
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