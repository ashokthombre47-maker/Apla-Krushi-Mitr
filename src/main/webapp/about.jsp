<%@ page contentType="text/html;charset=UTF-8" %>

<%
String lang = (String) session.getAttribute("lang");
if(lang == null) lang = "en";
%>

<!DOCTYPE html>
<html>
<head>
<title>About - Krushi Mitra</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

<style>
body{
    background: linear-gradient(to right, #d4fc79, #96e6a1);
}

/* Card Styling */
.card{
    border-radius:20px;
    transition:0.3s;
}
.card:hover{
    transform:translateY(-5px);
    box-shadow:0 10px 25px rgba(0,0,0,0.2);
}

/* Feature box */
.feature-box{
    text-align:center;
    padding:20px;
}
.feature-box i{
    font-size:40px;
    color:#198754;
}

/* Section spacing */
.section{
    margin-top:30px;
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
            <a href="predict.jsp" class="btn btn-light btn-sm">
                <%= lang.equals("mr")?"पीक निवड":"Predict" %>
            </a>
            <!-- ✅ NEW BUTTON -->
            <a href="contact.jsp" class="btn btn-warning btn-sm">
                <%= lang.equals("mr")?"संपर्क":"Contact" %>
            </a>
        </div>
    </div>
</nav>

<!-- ✅ MAIN CONTENT -->
<div class="container mt-5">

<!-- INTRO -->
<div class="card p-4 shadow text-center">
    <h2 class="text-success mb-3">
        <%= lang.equals("mr") ? "आमच्याबद्दल" : "About Us" %>
    </h2>

    <p>
    <%= lang.equals("mr") ? 
    "Krushi Mitra हे स्मार्ट वेब अ‍ॅप आहे जे शेतकऱ्यांना योग्य पीक निवडण्यात मदत करते." 
    :
    "Krushi Mitra is a smart web application that helps farmers choose the best crops based on soil data." %>
    </p>
</div>

<!-- FEATURES -->
<div class="card p-4 shadow section">
    <h4 class="text-success text-center mb-4">
        <%= lang.equals("mr") ? "वैशिष्ट्ये" : "Features" %>
    </h4>

    <div class="row">
        <div class="col-md-4 feature-box">
            <i class="bi bi-flower1"></i>
            <p><%= lang.equals("mr")?"योग्य पीक शिफारस":"Smart Crop Recommendation" %></p>
        </div>

        <div class="col-md-4 feature-box">
            <i class="bi bi-bar-chart"></i>
            <p><%= lang.equals("mr")?"माती विश्लेषण":"Soil Analysis" %></p>
        </div>

        <div class="col-md-4 feature-box">
            <i class="bi bi-cloud-rain"></i>
            <p><%= lang.equals("mr")?"पर्जन्यमान आधारित निर्णय":"Rainfall Based Prediction" %></p>
        </div>

        <div class="col-md-4 feature-box">
            <i class="bi bi-translate"></i>
            <p><%= lang.equals("mr")?"मराठी + इंग्रजी सपोर्ट":"Marathi & English Support" %></p>
        </div>

        <div class="col-md-4 feature-box">
            <i class="bi bi-images"></i>
            <p><%= lang.equals("mr")?"पीक माहिती व फोटो":"Crop Info & Images" %></p>
        </div>

        <div class="col-md-4 feature-box">
            <i class="bi bi-phone"></i>
            <p><%= lang.equals("mr")?"सोपे वापरणे":"Easy to Use" %></p>
        </div>
    </div>
</div>

<!-- MISSION -->
<div class="card p-4 shadow section">
    <h4 class="text-success">
        <%= lang.equals("mr") ? "आमचे उद्दिष्ट" : "Our Mission" %>
    </h4>

    <p>
    <%= lang.equals("mr") ? 
    "शेतकऱ्यांना आधुनिक तंत्रज्ञान वापरून योग्य निर्णय घेण्यास मदत करणे." 
    :
    "Our mission is to help farmers make better decisions using modern technology." %>
    </p>
</div>

<!-- DEVELOPER -->
<div class="card p-4 shadow section text-center">
    <h4 class="text-success">
        <%= lang.equals("mr") ? "विकसक" : "Developer" %>
    </h4>

   <p>
    <%= lang.equals("mr") ? 
    "हा प्रकल्प विद्यार्थ्यांनी विकसित केला आहे." 
    :
    "This project is developed by students." %>
    <br><br>

    <b><%= lang.equals("mr") ? "विद्यार्थ्याचे नाव" : "Student Name" %>:</b>
    Ashok Thombre <br>

    <b>Email:</b> ashokthombre47@gmail.com
</p>
</div>

</div>

<!-- FOOTER -->
<footer class="text-center mt-5 p-3 bg-success text-white">
    <p>
        <%= lang.equals("mr") ?
        "© 2026 कृषी मित्र | स्मार्ट शेती" :
        "© 2026 Krushi Mitra | Smart Farming" %>
    </p>
</footer>

</body>
</html>