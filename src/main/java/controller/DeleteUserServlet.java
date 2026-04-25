package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class DeleteUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/krushi","root","Root");

            PreparedStatement ps = con.prepareStatement(
                "DELETE FROM users WHERE id=?"
            );

            ps.setInt(1, id);
            ps.executeUpdate();

            res.sendRedirect("admin-dashboard.jsp");

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}