<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
int id = Integer.parseInt(request.getParameter("id"));

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

String name="", email="", role="";

try{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/krushi","root","Root");

    ps = con.prepareStatement("SELECT * FROM users WHERE id=?");
    ps.setInt(1, id);
    rs = ps.executeQuery();

    if(rs.next()){
        name = rs.getString("name");
        email = rs.getString("email");
        role = rs.getString("role");
    }
}catch(Exception e){
    e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<form action="UpdateUserServlet" method="post">

    <h2>Edit User</h2>

    <input type="hidden" name="id" value="<%= id %>">

    <input type="text" name="name" value="<%= name %>" required>
    <input type="email" name="email" value="<%= email %>" required>

    <select name="role">
        <option <%= role.equals("admin")?"selected":"" %>>admin</option>
        <option <%= role.equals("farmer")?"selected":"" %>>farmer</option>
    </select>

    <button type="submit">Update</button>

</form>

</body>
</html>