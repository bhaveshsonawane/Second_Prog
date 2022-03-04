<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>authenticate</title>
</head>
<body>
	<%
		Connection connection = null;
		PreparedStatement psSelect = null;
		ResultSet result = null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection =DriverManager.getConnection("jdbc:mysql://localhost/java","dbjava","java@123");
		psSelect =connection.prepareStatement("select * from users where username=? and password=?");
		String user =request.getParameter("userName");
		String pwd =request.getParameter("password");
		psSelect.setString(1, user);
		psSelect.setString(2,pwd);
		result = psSelect.executeQuery();
		
		if(result.next())
		response.sendRedirect("category.jsp");
		else
		{
		%>
	<font color='red'>You have failed to authenticate</font>
	<br />
	<jsp:include page="login.jsp" />
	<%
		}
		%>
</body>
</html>