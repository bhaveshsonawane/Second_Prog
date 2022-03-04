
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html;
		charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%--
		This is a comment
		--%>
	<%
		Connection connection = null;
		PreparedStatement psSelect = null;
		ResultSet result = null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection =DriverManager.getConnection("jdbc:mysql://localhost/java","dbjava","java@123");
		psSelect =connection.prepareStatement("select * from category");
		
		result = psSelect.executeQuery();
		%>
	<table border='1'>
		<tr>
			<th>Name</th>
			<th>Description</th>
			<th>Image</th>
		</tr>
		<%
		while(result.next())
		{
		%>
		<tr>
			<td><a href='products.jsp?catId=<%=result.getInt("catId")%>'><%=result.getString("catName") %></a></td>
			<td><%=result.getString("catDesc") %></td>
			<td><img src='Images/<%=result.getString("catImgUrl") %>' height='60px'width='60px' /></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>