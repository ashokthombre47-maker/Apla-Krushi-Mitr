<%@ page contentType="text/html;charset=UTF-8" %>

<%
String lang = (String) session.getAttribute("lang");
if(lang == null) lang = "en";
%>

<!DOCTYPE html>
<html>
<head>
<title>Contact - Krushi Mitra</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

<style>
body{
    background: linear-gradient(to right, #56ab2f, #a8e063);
}

/* Card */
.contact-card{
    border-radius:20px;
    padding:30px;
    background:white;
    box-shadow:0px 10px 30px rgba(0,0,0,0.1);
}

/* Inputs */
.form-control{
    border-radius:10px;
    padding:12px;
}

/* Button */
.btn-submit{
    border-radius:12px;
    font-weight:bold;
    padding:12px;
    transition:0.3s;
}
.btn-submit:hover{
    transform:scale(1.05);
}

/* Icons */
.contact-icon{
    font-size:22px;
    color:#198754;
    margin-right:10px;
}
</style>

</head>

<body>

<!-- ✅ NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-success shadow">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.jsp">🌱 KRUSHI MITRA</a>
        <div>
            <a href="index.jsp" class="btn btn-light btn-sm">
                <%= lang.equals("mr")?"मुख्यपृष्ठ":"Home" %>
            </a>
            <a href="LanguageServlet?lang=en" class="btn btn-light btn-sm"><button>English</button></a>
            <a href="LanguageServlet?lang=mr" class="btn btn-light btn-sm"><button>मराठी</button></a>
            <a href="predict.jsp" class="btn btn-light btn-sm">
                <%= lang.equals("mr")?"पीक निवड":"Predict" %>
            </a>
        </div>
    </div>
</nav>

<!-- ✅ CONTACT SECTION -->
<div class="container mt-5 mb-5">
<div class="row justify-content-center">

<div class="col-lg-8">
<div class="contact-card">

<h2 class="text-center text-success mb-4">
    <%= lang.equals("mr") ? "📞 संपर्क करा" : "📞 Contact Us" %>
</h2>

<!-- ✅ CONTACT INFO -->
<div class="mb-4 text-center">

<p>
<i class="bi bi-geo-alt-fill contact-icon"></i>
<%= lang.equals("mr")?"पुणे, महाराष्ट्र":"Pune, Maharashtra" %>
</p>

<p>
<i class="bi bi-envelope-fill contact-icon"></i>
support@krushimitra.com
</p>

<p>
<i class="bi bi-telephone-fill contact-icon"></i>
+91 9284632700
</p>

</div>

<hr>

<!-- ✅ FORM -->
<form>

<div class="mb-3">
<label>
<%= lang.equals("mr")?"तुमचे नाव":"Your Name" %>
</label>
<input type="text" class="form-control" placeholder="Enter name" required>
</div>

<div class="mb-3">
<label>
<%= lang.equals("mr")?"ईमेल":"Email" %>
</label>
<input type="email" class="form-control" placeholder="Enter email" required>
</div>

<div class="mb-3">
<label>
<%= lang.equals("mr")?"संदेश":"Message" %>
</label>
<textarea class="form-control" rows="4" placeholder="Type message..." required></textarea>
</div>
<!-- ✅ GOOGLE MAP SECTION -->
<div class="container mt-5">
    <div class="card p-4 shadow">

        <h4 class="text-success text-center mb-3">
            <%= lang.equals("mr") ? "आमचे स्थान" : "Our Location" %>
        </h4>

        <!-- MAP -->
        <iframe 
            src="https://www.google.com/maps?q=Pune,Maharashtra&output=embed"
            width="100%" 
            height="350" 
            style="border:0; border-radius:15px;" 
            allowfullscreen="" 
            loading="lazy">
        </iframe>

    </div>
</div>

<button type="submit" class="btn btn-success w-100 btn-submit">
<%= lang.equals("mr")?"संदेश पाठवा":"Send Message" %>
</button>

</form>

</div>
</div>

</div>
</div>

<!-- ✅ FOOTER -->
<footer class="text-center p-3 bg-success text-white">
<p>
<%= lang.equals("mr") ?
"© 2026 कृषी मित्र | स्मार्ट शेती" :
"© 2026 Krushi Mitra | Smart Farming" %>
</p>
</footer>

</body>
</html>