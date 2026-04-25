<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

<%
request.setCharacterEncoding("UTF-8");

String lang = (String) session.getAttribute("lang");
if(lang == null) lang = "en";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pest Detection</title>
    <link rel="stylesheet" href="style.css">

    <style>
        .result-box {
            width: 500px;
            margin: 30px auto;
            padding: 20px;
            border-radius: 15px;
            background: rgba(255,255,255,0.95);
            box-shadow: 0px 5px 20px rgba(0,0,0,0.3);
            text-align: center;
        }

        .result-box img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            border-radius: 10px;
            margin-top: 10px;
        }

        .info {
            margin-top: 10px;
            font-size: 16px;
        }
    </style>
</head>

<body>

<!-- 🔹 Navbar -->
<header>
    <h2>🌱 APLA KRUSHI MITR</h2>

    <nav>
        <a href="index.jsp"><%= lang.equals("mr")?"मुख्यपृष्ठ":"Home" %></a>
        <a href="predict.jsp"><%= lang.equals("mr")?"पीक निवड":"Predict Crop" %></a>
        <a href="crop-calendar.jsp"><%= lang.equals("mr")?"पेरणी कॅलेंडर":"Crop Calendar" %></a>
        <a href="pest.jsp"><%= lang.equals("mr")?"कीड ओळखा":"Pest Detection" %></a>
        <a href="login.jsp"><%= lang.equals("mr")?"लॉगिन":"Login" %></a>
        <a href="register.jsp"><%= lang.equals("mr")?"नोंदणी":"Register" %></a>

        <a href="LanguageServlet?lang=en"><button>English</button></a>
        <a href="LanguageServlet?lang=mr"><button>मराठी</button></a>
    </nav>
</header>

<!-- 🔹 Form -->
<form action="PestServlet" method="post" enctype="multipart/form-data">

    <h2><%= lang.equals("mr")?"🐛 कीड/रोग ओळखा":"🐛 Pest Detection" %></h2>

    <input type="file" name="image" required>

    <select name="symptom" required>
        <option value="">
            <%= lang.equals("mr")?"लक्षण निवडा":"Select Symptom" %>
        </option>
        <option>Yellow Leaves</option>
        <option>Spots on Leaf</option>
        <option>Holes in Leaf</option>
        <option>Wilting</option>
    </select>

    <button type="submit">
        <%= lang.equals("mr")?"तपासा":"Detect" %>
    </button>

</form>

<%
String disease = (String) request.getAttribute("disease");
String solution = (String) request.getAttribute("solution");
String imagePath = (String) request.getAttribute("imagePath");

String symptomsInfo = (String) request.getAttribute("symptomsInfo");
String causeInfo = (String) request.getAttribute("causeInfo");
String preventionInfo = (String) request.getAttribute("preventionInfo");
%>

<% if(disease != null){ %>

<div class="result-box">

    <h3>
        <%= lang.equals("mr")?"रोग":"Disease" %>:
        <%= disease %>
    </h3>

    <p class="info">
        <%= lang.equals("mr")?"उपाय":"Solution" %>:
        <%= solution %>
    </p>

    <p class="info">📌 <b>Symptoms:</b> <%= symptomsInfo %></p>
    <p class="info">⚠️ <b>Cause:</b> <%= causeInfo %></p>
    <p class="info">🛡️ <b>Prevention:</b> <%= preventionInfo %></p>

    <% if(imagePath != null){ %>
        <img src="<%= imagePath %>" alt="Uploaded Image">
    <% } %>

</div>

<% } %>

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