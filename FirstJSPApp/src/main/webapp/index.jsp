<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<%!
Date objDate;
public void show()
{
objDate = new Date();
}
%>
<meta charset="ISO-8859-1">
<title>Time Show</title>
</head>
<body>
	<%
	for (int iTmp = 0; iTmp < 3; iTmp++) {
		int tmp = 0;
		tmp++;
	%>
	<h1>
		Current Time is:
		<%=new Date()%></h1>
	<%
	}
	%>

</body>
</html>