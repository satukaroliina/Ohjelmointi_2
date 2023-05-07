<%
if(session.getAttribute("kayttaja")==null){		
	response.sendRedirect("index.jsp");	
	return;
}

response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>