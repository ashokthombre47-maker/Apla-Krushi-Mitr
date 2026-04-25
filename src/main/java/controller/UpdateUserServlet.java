package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class UpdateUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
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