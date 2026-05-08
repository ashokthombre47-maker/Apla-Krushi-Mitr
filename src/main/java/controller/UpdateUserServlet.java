package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class UpdateUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class UpdateUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {

        // डेटा घेणे
        String idParam = req.getParameter("id");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String role = req.getParameter("role");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            if (idParam != null && !idParam.isEmpty()) {
                int id = Integer.parseInt(idParam);

                Class.forName("com.mysql.cj.jdbc.Driver");

                con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/krushi", "root", "Root");

                // ✅ SAFETY CHECK: जर कनेक्शन नसेल तर इथूनच परत जा
                if (con == null) {
                    System.out.println("Update Failed: Database connection is null.");
                    res.sendRedirect("admin-dashboard.jsp?msg=db_error");
                    return;
                }

                // UPDATE क्वेरी
                ps = con.prepareStatement(
                    "UPDATE users SET name=?, email=?, role=? WHERE id=?"
                );

                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, role);
                ps.setInt(4, id);

                int i = ps.executeUpdate();
                
                if(i > 0) {
                    res.sendRedirect("admin-dashboard.jsp?msg=updated");
                } else {
                    res.sendRedirect("admin-dashboard.jsp?msg=not_found");
                }

            } else {
                res.sendRedirect("admin-dashboard.jsp?msg=invalid_id");
            }

        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("admin-dashboard.jsp?msg=exception");
        } finally {
            // ✅ रिसोर्सेस बंद करणे
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
    }
}
    throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String role = req.getParameter("role");

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/krushi","root","Root");

            PreparedStatement ps = con.prepareStatement(
                "UPDATE users SET name=?, email=?, role=? WHERE id=?"
            );

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, role);
            ps.setInt(4, id);

            ps.executeUpdate();

            res.sendRedirect("admin-dashboard.jsp");

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
