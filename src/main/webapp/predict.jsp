<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String lang = (String) session.getAttribute("lang");
if(lang == null) lang = "en";
%>

<!DOCTYPE html>
<html>
<head>
    <title>Crop Prediction - Apla Krushi Mitr</title>

    <!-- CSS -->
    <link rel="stylesheet" href="style.css">
</head>

<body>

<!-- 🔹 Navbar -->
<header>
    <h2>🌱 APLA KRUSHI MITR</h2>

    <nav>
        <a href="index.jsp"><%= lang.equals("mr")?"मुख्यपृष्ठ":"Home" %></a>
       
        <a href="login.jsp"><%= lang.equals("mr")?"लॉगिन":"Login" %></a>
        <a href="register.jsp"><%= lang.equals("mr")?"नोंदणी":"Register" %></a>

        <!-- Language Buttons -->
        <a href="LanguageServlet?lang=en"><button>English</button></a>
        <a href="LanguageServlet?lang=mr"><button>मराठी</button></a>
    </nav>
</header>

<!-- 🔹 🌦️ Weather Check Form (NEW ADD) -->
<form action="WeatherServlet" method="get">
    <h2><%= lang.equals("mr")?"आजचे हवामान तपासा":"Check Today's Weather" %></h2>

    <input type="text" name="city" 
           placeholder="<%= lang.equals("mr")?"शहराचे नाव टाका":"Enter City" %>" required>

    <button type="submit">
        <%= lang.equals("mr")?"हवामान पहा":"Get Weather" %>
    </button>
</form>

<!-- 🔹 Prediction Form -->
<form action="CropPredictServlet" method="post">
    <h2><%= lang.equals("mr")?"पीक निवड":"Crop Prediction" %></h2>

    <label><%= lang.equals("mr")?"नायट्रोजन (N)":"Nitrogen (N)" %></label>
    <input type="number" name="n" placeholder="Enter Nitrogen value" required>

    <label><%= lang.equals("mr")?"फॉस्फरस (P)":"Phosphorus (P)" %></label>
    <input type="number" name="p" placeholder="Enter Phosphorus value" required>

    <label><%= lang.equals("mr")?"पोटॅशियम (K)":"Potassium (K)" %></label>
    <input type="number" name="k" placeholder="Enter Potassium value" required>

    <!-- Soil pH -->
    <label><%= lang.equals("mr")?"मातीचा pH स्तर":"Soil pH Level" %></label>
    <input type="number" step="0.1" name="ph" 
           placeholder="<%= lang.equals("mr")?"0 ते 14 दरम्यान":"Range 0 - 14" %>" required>

    <!-- Rainfall -->
    <label><%= lang.equals("mr")?"पर्जन्यमान (मिमी)":"Rainfall (mm)" %></label>
    <input type="number" name="rainfall" 
           placeholder="<%= lang.equals("mr")?"वार्षिक पाऊस":"Annual rainfall" %>" required>

    <button type="submit">
        <%= lang.equals("mr")?"भविष्यवाणी करा":"Predict" %>
    </button>
</form>

<!-- 🔹 Footer -->
<footer>
    <p>
        <%= lang.equals("mr") ?
        "© 2026 आपला कृषी मित्र | शेतकऱ्यांसाठी स्मार्ट शेती" :
        "© 2026 Apla Krushi Mitr | Smart Farming for Farmers" %>
    </p>
</footer>

</body>
</html>