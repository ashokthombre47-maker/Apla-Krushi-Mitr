<%@ page import="java.sql.*" %>

<%
String user = (String) session.getAttribute("user");
String role = (String) session.getAttribute("role");

if(user == null || !"admin".equals(role)){
    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="style.css">

    <style>
        /* ✅ EXISTING UI SAME */

        table {
            width: 90%;
            margin: 40px auto;
            border-collapse: collapse;
            background: white;
        }

        table th, table td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: center;
        }

        table th {
            background: #2e7d32;
            color: white;
        }

        .edit-btn {
            background: #0288d1;
            color: white;
            padding: 6px 12px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .delete-btn {
            background: red;
            color: white;
            padding: 6px 12px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        h3 {
            text-align: center;
            margin-top: 40px;
            color: #2e7d32;
        }

        /* 📱 MOBILE RESPONSIVE */
        @media(max-width: 768px){

            table {
                font-size: 12px;
            }

            table th, table td {
                padding: 8px;
            }

            .edit-btn, .delete-btn {
                padding: 4px 8px;
                font-size: 12px;
            }

        }
    </style>
</head>

<body>

<header>
    <h2>ADMIN DASHBOARD</h2>
    <nav>
        <a href="LogoutServlet">Logout</a>
    </nav>
</header>

<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/krushi","root","Root");
%>

<!-- 🔥 USER TABLE -->
<h3>Registered Users</h3>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Role</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>

<%
    ps = con.prepareStatement("SELECT * FROM users");
    rs = ps.executeQuery();

    while(rs.next()){
%>

<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("email") %></td>
    <td><%= rs.getString("role") %></td>

    <!-- ✏️ EDIT -->
    <td>
        <form action="edit-user.jsp" method="get">
            <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
            <button class="edit-btn">Edit</button>
        </form>
    </td>

    <!-- ❌ DELETE -->
    <td>
        <form action="DeleteUserServlet" method="post">
            <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
            <button class="delete-btn">Delete</button>
        </form>
    </td>

</tr>

<%
    }

    rs.close();
    ps.close();
%>

</table>

<!-- 🔥 FARMER ACTIVITY TABLE -->
<h3>Farmer Activity History</h3>

<table>
    <tr>
        <th>ID</th>
        <th>Farmer Name</th>
        <th>Checked Feature</th>
        <th>Date & Time</th>
    </tr>

<%
    ps = con.prepareStatement(
        "SELECT * FROM user_activity ORDER BY activity_time DESC"
    );

    rs = ps.executeQuery();

    while(rs.next()){
%>

<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("username") %></td>
    <td><%= rs.getString("activity") %></td>
    <td><%= rs.getTimestamp("activity_time") %></td>
</tr>

<%
    }

}catch(Exception e){
    e.printStackTrace();
} finally {
    try { if(rs != null) rs.close(); } catch(Exception e){}
    try { if(ps != null) ps.close(); } catch(Exception e){}
    try { if(con != null) con.close(); } catch(Exception e){}
}
%>

</table>

</body>
</html>