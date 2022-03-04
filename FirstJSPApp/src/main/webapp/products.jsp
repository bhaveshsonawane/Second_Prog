<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <% 
    Connection connection =null;
    PreparedStatement psSelect=null;
    ResultSet result=null;
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    connection = DriverManager.getConnection("jdbc:mysql://localhost/java","dbjava","java@123");
    psSelect=connection.prepareStatement("select * from products where catId=?");
    String tmpCatId=request.getParameter("catId");
	int catId=Integer.parseInt(tmpCatId);
	psSelect.setInt(1, catId);
    result = psSelect.executeQuery();
 %>
 <table border='1'>
    <tr>
   <!--  <th>catId</th>
    <th>prodId</th> -->
    <th>prodName</th>
    <th>ProdDesc</th>
    <th>ProdPrice</th>
    <th>Image</th>
    
    
    <%
        while(result.next())
        {
    %>
    <tr>
   <%--  <td><%= result.getInt("catId")%></td>
    <td><%= result.getInt("prodId")%></td> --%>
    <td><%=result.getString("prodName")%></td>
    <td><%=result.getString("prodDesc")%></td>
    <td><%=result.getString("prodPrice")%></td>
   <td><img src='Images/<%=result.getString("prodImgUrl") %>' height='60px' width='60px'/></td>
   </tr>
    <%
    }
    %>
    
    
    </table>
    
</body>
</html>