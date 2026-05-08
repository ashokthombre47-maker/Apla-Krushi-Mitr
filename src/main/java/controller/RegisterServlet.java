package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {

        // डेटा घेणे
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Railway वर localhost चालणार नाही, तरीही आपण ट्राय करतोय
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/krushi","root","Root");

            // ✅ SAFETY CHECK: जर कनेक्शन नसेल तर इथूनच परत जा
            if (con == null) {
                System.out.println("Database Connection Failed!");
                res.sendRedirect("register.jsp?msg=db_error");
                return;
            }

            // ✅ Duplicate email check
            ps = con.prepareStatement("SELECT * FROM users WHERE email=?");
            ps.setString(1, email);
            rs = ps.executeQuery();

            if(rs.next()){
                res.sendRedirect("register.jsp?msg=exists");
                return;
            }

            // ✅ Insert user
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
            e.printStackTrace(); // हे Logs मध्ये एरर दाखवेल
            // NullPointerException आल्यास युजरला रजिस्टर पेजवर पाठवेल
            res.sendRedirect("register.jsp?msg=exception");
        } finally {
            // Resources बंद करणे
            try { if(rs != null) rs.close(); } catch(Exception e){}
            try { if(ps != null) ps.close(); } catch(Exception e){}
            try { if(con != null) con.close(); } catch(Exception e){}
        }
    }
}
