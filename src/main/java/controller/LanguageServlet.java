package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LanguageServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {

        String lang = req.getParameter("lang");

        HttpSession session = req.getSession();
        session.setAttribute("lang", lang);

        // previous page la parat ja
        String referer = req.getHeader("referer");
        if(referer != null){
            res.sendRedirect(referer);
        } else {
            res.sendRedirect("index.jsp");
        }
    }
}