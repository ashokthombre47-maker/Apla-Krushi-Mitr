package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {

        // जर सेशन अस्तित्वात असेल तरच ते मिळवा, नवीन तयार करू नका (false)
        HttpSession session = req.getSession(false);

        if (session != null) {
            // सेशन नष्ट करा
            session.invalidate();
        }

        // लॉगिन पेजवर किंवा होमपेजवर रिडायरेक्ट करा
        res.sendRedirect("login.jsp?msg=logout");
    }

    // सुरक्षिततेसाठी doPost मधून सुद्धा doGet ला कॉल करा
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {
        doGet(req, res);
    }
}
