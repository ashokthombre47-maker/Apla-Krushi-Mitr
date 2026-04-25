package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/krushi","root","Root");

            // ✅ duplicate email check
            ps = con.prepareStatement("SELECT * FROM users WHERE email=?");
            ps.setString(1, email);
            rs = ps.executeQuery();

            if(rs.next()){
                res.sendRedirect("register.jsp?msg=exists");
                return;
            }

            // ✅ insert user
            ps = con.prepareStatement(
            	    "INSERT INTO users(name,email,password,role) VALUES(?,?,?,?)"
            	);

            	ps.setString(1, name);
            	ps.setString(2, email);
            	ps.setString(3, password);
            	ps.setString(4, role);
            int i = ps.executeUpdate();

            if(i > 0){
                res.sendRedirect("login.jsp?msg=success");
            } else {
                res.sendRedirect("register.jsp?msg=error");
            }

        } catch(Exception e) {
            e.printStackTrace();
            res.sendRedirect("register.jsp?msg=exception");
        } finally {
            try { if(rs != null) rs.close(); } catch(Exception e){}
            try { if(ps != null) ps.close(); } catch(Exception e){}
            try { if(con != null) con.close(); } catch(Exception e){}
        }
    }
}