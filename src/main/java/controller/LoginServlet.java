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

            // Railway वर localhost शोधताना अडचण येऊ शकते
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/krushi","root","Root");

            // ✅ SAFETY CHECK: जर कनेक्शन null असेल तर प्रोजेक्ट क्रॅश होऊ नये
            if (con == null) {
                System.out.println("Login Failed: Database connection is null.");
                res.sendRedirect("login.jsp?msg=db_error");
                return;
            }

            // Role column तपासून लॉगिन करणे
            ps = con.prepareStatement(
                "SELECT * FROM users WHERE email=? AND password=?"
            );

            ps.setString(1, email);
            ps.setString(2, password);

            rs = ps.executeQuery();

            if(rs.next()){

                // ✅ SESSION मॅनेजमेंट
                HttpSession session = req.getSession();
                session.setAttribute("user", rs.getString("name"));
                session.setAttribute("email", rs.getString("email"));

                // ✅ ROLE प्रमाणे रिडायरेक्ट करणे
                String role = rs.getString("role"); // admin / farmer
                session.setAttribute("role", role);

                if("admin".equalsIgnoreCase(role)){
                    res.sendRedirect("admin-dashboard.jsp");
                } 
                else {
                    res.sendRedirect("index.jsp"); // farmer
                }

            } else {
                // चुकीचा आयडी किंवा पासवर्ड
                res.sendRedirect("login.jsp?msg=invalid");
            }

        } catch(Exception e) {
            e.printStackTrace(); // Logs मध्ये त्रुटी तपासण्यासाठी
            res.sendRedirect("login.jsp?msg=exception");
        } finally {
            // सर्व रिसोर्सेस सुरक्षितपणे बंद करणे
            try { if(rs != null) rs.close(); } catch(Exception e){}
            try { if(ps != null) ps.close(); } catch(Exception e){}
            try { if(con != null) con.close(); } catch(Exception e){}
        }
    }
}
