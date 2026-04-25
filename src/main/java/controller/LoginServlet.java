package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/krushi","root","Root");

            // ✅ Role column add केलेला असावा DB मध्ये
            ps = con.prepareStatement(
                "SELECT * FROM users WHERE email=? AND password=?"
            );

            ps.setString(1, email);
            ps.setString(2, password);

            rs = ps.executeQuery();

            if(rs.next()){

                // ✅ SESSION
                HttpSession session = req.getSession();
                session.setAttribute("user", rs.getString("name"));
                session.setAttribute("email", rs.getString("email"));

                // ✅ ROLE GET
                String role = rs.getString("role"); // admin / farmer
                session.setAttribute("role", role);

                // ✅ REDIRECT BASED ON ROLE
                if("admin".equalsIgnoreCase(role)){
                    res.sendRedirect("admin-dashboard.jsp");
                } 
                else {
                    res.sendRedirect("index.jsp"); // farmer
                }

            } else {
                res.sendRedirect("login.jsp?msg=invalid");
            }

        } catch(Exception e) {
            e.printStackTrace();
            res.sendRedirect("login.jsp?msg=exception");
        } finally {
            try { if(rs != null) rs.close(); } catch(Exception e){}
            try { if(ps != null) ps.close(); } catch(Exception e){}
            try { if(con != null) con.close(); } catch(Exception e){}
        }
    }
}