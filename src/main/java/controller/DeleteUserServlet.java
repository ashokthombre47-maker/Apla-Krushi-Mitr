package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class DeleteUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {

        // ID मिळवणे
        String idParam = req.getParameter("id");
        Connection con = null;
        PreparedStatement ps = null;

        try {
            if (idParam != null) {
                int id = Integer.parseInt(idParam);

                Class.forName("com.mysql.cj.jdbc.Driver");

                con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/krushi", "root", "Root");

                // ✅ SAFETY CHECK: जर कनेक्शन नसेल तर एरर टाळण्यासाठी
                if (con == null) {
                    System.out.println("Delete Failed: Database connection is null.");
                    res.sendRedirect("admin-dashboard.jsp?msg=db_error");
                    return;
                }

                ps = con.prepareStatement("DELETE FROM users WHERE id=?");
                ps.setInt(1, id);
                ps.executeUpdate();
            }

            res.sendRedirect("admin-dashboard.jsp?msg=deleted");

        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("admin-dashboard.jsp?msg=exception");
        } finally {
            // ✅ RESOURCES बंद करणे (Memory Leak टाळण्यासाठी)
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
    }
}
