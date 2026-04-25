package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class CropPredictServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {

        String lang = (String) req.getSession().getAttribute("lang");
        if(lang == null) lang = "en";

        int n = Integer.parseInt(req.getParameter("n"));
        int p = Integer.parseInt(req.getParameter("p"));
        int k = Integer.parseInt(req.getParameter("k"));
        double ph = Double.parseDouble(req.getParameter("ph"));
        int rainfall = Integer.parseInt(req.getParameter("rainfall"));

        String crop = "";

        // ✅ UPDATED LOGIC
        if(rainfall > 200 && ph >= 5.5 && ph <= 7){
            crop = "Rice";
        }
        else if(n > 80 && p > 40){
            crop = "Sugarcane";
        }
        else if(ph > 7.5){
            crop = "Cotton";
        }
        else if(k > 60){
            crop = "Jowar";
        }
        else if(rainfall < 100 && k < 40){
            crop = "Bajra";
        }
        else if(n < 40 && p < 40){
            crop = "Groundnut";   // ✅ NEW
        }
        else if(n >= 40 && n <= 70 && rainfall >= 100){
            crop = "Soybean";     // ✅ NEW
        }
        else if(n < 50 && p < 50){
            crop = "Wheat";
        }
        else{
            crop = "Maize";
        }

        System.out.println("Predicted Crop: " + crop);

        req.setAttribute("crop", crop);

        RequestDispatcher rd = req.getRequestDispatcher("result.jsp");
        rd.forward(req, res);
    }
}