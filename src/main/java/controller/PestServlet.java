package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.MultipartConfig;

@MultipartConfig
public class PestServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {

        // ✅ Marathi fix
        req.setCharacterEncoding("UTF-8");
        res.setContentType("text/html;charset=UTF-8");

        String symptom = req.getParameter("symptom");

        String disease = "";
        String solution = "";

        // ✅ EXISTING LOGIC (UNCHANGED)
        if(symptom.equalsIgnoreCase("Yellow Leaves")){
            disease = "Nitrogen Deficiency";
            solution = "Apply Urea";
        }
        else if(symptom.equalsIgnoreCase("Spots on Leaf")){
            disease = "Fungal Infection";
            solution = "Spray Fungicide";
        }
        else if(symptom.equalsIgnoreCase("Holes in Leaf")){
            disease = "Insect Attack";
            solution = "Use Neem Oil";
        }
        else if(symptom.equalsIgnoreCase("Wilting")){
            disease = "Root Rot";
            solution = "Improve drainage";
        }
        else{
            disease = "Healthy Crop";
            solution = "No action needed";
        }

        // 🌐 Language
        HttpSession session = req.getSession();
        String lang = (String) session.getAttribute("lang");

        if("mr".equals(lang)){
            disease = translateDisease(disease);
            solution = translateSolution(solution);
        }

        // ✅ IMAGE SAVE (FIXED)
        Part filePart = req.getPart("image");
        String fileName = filePart.getSubmittedFileName();

        String uploadPath = getServletContext().getRealPath("/") + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        filePart.write(uploadPath + File.separator + fileName);

        // 👉 IMPORTANT (image display fix)
        String imagePath = req.getContextPath() + "/uploads/" + fileName;

        // ✅ EXTRA INFO (UNCHANGED)
        String symptomsInfo = "";
        String causeInfo = "";
        String preventionInfo = "";

        if(symptom.equalsIgnoreCase("Yellow Leaves")){
            symptomsInfo = "पानं पिवळी पडतात, वाढ कमी होते";
            causeInfo = "नायट्रोजनची कमतरता";
            preventionInfo = "योग्य खत व्यवस्थापन ठेवा";
        }
        else if(symptom.equalsIgnoreCase("Spots on Leaf")){
            symptomsInfo = "पानांवर तपकिरी/काळे डाग";
            causeInfo = "बुरशी संसर्ग";
            preventionInfo = "फंगिसाइड वापरा";
        }
        else if(symptom.equalsIgnoreCase("Holes in Leaf")){
            symptomsInfo = "पानांमध्ये छिद्रे";
            causeInfo = "कीटक हल्ला";
            preventionInfo = "नीम तेल वापरा";
        }
        else if(symptom.equalsIgnoreCase("Wilting")){
            symptomsInfo = "झाड कोमेजते";
            causeInfo = "मुळांचा रोग";
            preventionInfo = "ड्रेनेज सुधारणा करा";
        }
        else{
            symptomsInfo = "कोणतीही समस्या नाही";
            causeInfo = "पिक निरोगी आहे";
            preventionInfo = "नियमित निरीक्षण करा";
        }

        // ✅ SEND DATA
        req.setAttribute("disease", disease);
        req.setAttribute("solution", solution);
        req.setAttribute("imagePath", imagePath);

        req.setAttribute("symptomsInfo", symptomsInfo);
        req.setAttribute("causeInfo", causeInfo);
        req.setAttribute("preventionInfo", preventionInfo);

        RequestDispatcher rd = req.getRequestDispatcher("pest.jsp");
        rd.forward(req, res);
    }

    private String translateDisease(String d){
        if(d.contains("Nitrogen")) return "नायट्रोजन कमतरता";
        if(d.contains("Fungal")) return "बुरशीजन्य रोग";
        if(d.contains("Insect")) return "कीड हल्ला";
        if(d.contains("Root")) return "मुळांचा रोग";
        return "पिक निरोगी आहे";
    }

    private String translateSolution(String s){
        return "योग्य फवारणी / उपाय करा";
    }
}