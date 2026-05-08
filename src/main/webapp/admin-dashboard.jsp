<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // 🛡️ SECURITY CHECK: केवळ ॲडमिनलाच प्रवेश द्या
    String user = (String) session.getAttribute("user");
    String role = (String) session.getAttribute("role");

    if(user == null || !"admin".equalsIgnoreCase(role)){
        response.sendRedirect("login.jsp?msg=unauthorized");
        return; // पुढचा कोड एक्झिक्युट होण्यापासून थांबवण्यासाठी
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Krushi Mitr</title>
    <link rel="stylesheet" href="style.css">

    <style>
        table { width: 95%; margin: 20px auto; border-collapse: collapse; background: white; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        table th, table td { padding: 12px; border: 1px solid #ddd; text-align: center; }
        table th { background: #2e7d32; color: white; }
        tr:nth-child(even) { background-color: #f2f2f2; }
        
        .edit-btn { background: #0288d1; color: white; padding: 6px 12px; border: none; border-radius: 4px; cursor: pointer; }
        .delete-btn { background: #d32f2f; color: white; padding: 6px 12px; border: none; border-radius: 4px; cursor: pointer; }
        .edit-btn:hover { background: #01579b; }
        .delete-btn:hover { background: #b71c1c; }
        
        h3 { text-align: center; margin-top: 30px; color: #2e7d32; font-family: sans-serif; text-transform: uppercase; letter-spacing: 1px; }
        .status-msg { text-align: center; color: red; font-weight: bold; }
    </style>
</head>

<body>

<header>
    <h2>🛡️ ADMIN CONTROL PANEL</h2>
    <nav>
        <a href="index.jsp" style="color:white; margin-right:20px;">Home</a>
        <a href="LogoutServlet" class="logout-link">Logout</a>
    </nav>
</header>

<div class="container">
<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    // Railway वर localhost कदाचित null देईल, त्यामुळे safety check गरजेचा आहे
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/krushi","root","Root");

    if (con == null) {
        out.println("<p class='status-msg'>❌ Database Connection Failed (Cloud Mode)</p>");
    } else {
%>

    <h3>Registered Users Management</h3>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Role</th>
            <th>Action</th>
        </tr>

    <%
        ps = con.prepareStatement("SELECT id, name, email, role FROM users");
        rs = ps.executeQuery();

        while(rs.next()){
    %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("email") %></td>
            <td><span class="badge"><%= rs.getString("role") %></span></td>
            <td>
                <div style="display:flex; justify-content:center; gap:10px;">
                    <form action="edit-user.jsp" method="get">
                        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                        <button class="edit-btn">Edit</button>
                    </form>

                    <form action="DeleteUserServlet" method="post" onsubmit="return confirm('खरोखर डिलीट करायचे का?')">
                        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                        <button class="delete-btn">Delete</button>
                    </form>
                </div>
            </td>
        </tr>
    <%
        }
        rs.close(); ps.close();
    %>
    </table>

    <hr style="width:90%; margin:40px auto;">

    <h3>Farmer Activity Logs</h3>
    <table>
        <tr>
            <th>ID</th>
            <th>Farmer Name</th>
            <th>Action</th>
            <th>Time</th>
        </tr>

    <%
        ps = con.prepareStatement("SELECT * FROM user_activity ORDER BY activity_time DESC LIMIT 10");
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
    } // con null else end

} catch(Exception e) {
    out.println("<p class='status-msg'>Error: " + e.getMessage() + "</p>");
} finally {
    try { if(rs != null) rs.close(); } catch(Exception e){}
    try { if(ps != null) ps.close(); } catch(Exception e){}
    try { if(con != null) con.close(); } catch(Exception e){}
}
%>
    </table>
</div>

<footer>
    <p>© 2026 Krushi Mitr Admin Panel | Secured Access</p>
</footer>

</body>
</html>
