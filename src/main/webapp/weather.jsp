
<%@ page contentType="text/html;charset=UTF-8" %>

<%
String lang = (String) session.getAttribute("lang");
if(lang == null) lang = "en";
%>

<!DOCTYPE html>
<html>
<head>
    <title>Weather Report</title>

    <!-- CSS -->
    <link rel="stylesheet" href="style.css">

    <style>
    body {
    font-family: Arial;
    background:
        linear-gradient(rgba(0,0,0,0.2), rgba(0,0,0,0.2)),
        url('images/weather.jpg');
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    text-align: center;
}
        .card {
            width: 420px;
            margin: 50px auto;
            padding: 25px;
            border-radius: 15px;
            background: white;
            box-shadow: 0px 5px 20px rgba(0,0,0,0.2);
        }

        h2 {
            color: #2e7d32;
        }

        .alert {
            font-size: 20px;
            color: red;
            margin-top: 15px;
        }

        .advice {
            font-size: 18px;
            color: green;
            margin-top: 10px;
        }

        .info {
            margin: 8px 0;
            font-size: 16px;
        }

        button {
            margin-top: 15px;
            padding: 10px 20px;
            background: #4caf50;
            border: none;
            color: white;
            border-radius: 8px;
            cursor: pointer;
        }

        button:hover {
            background: #2e7d32;
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
        <a href="login.jsp"><%= lang.equals("mr")?"लॉगिन":"Login" %></a>
        <a href="register.jsp"><%= lang.equals("mr")?"नोंदणी":"Register" %></a>

        <!-- Language -->
        <a href="LanguageServlet?lang=en"><button>English</button></a>
        <a href="LanguageServlet?lang=mr"><button>मराठी</button></a>
    </nav>
</header>

<!-- 🔹 Weather Card -->
<div class="card">

    <h2>🌦️ <%= lang.equals("mr")?"हवामान अहवाल":"Weather Report" %></h2>

    <p class="info"><b><%= lang.equals("mr")?"शहर":"City" %>:</b> ${city}</p>
    <p class="info"><b><%= lang.equals("mr")?"तापमान":"Temperature" %>:</b> ${temp} °C</p>
    <p class="info"><b><%= lang.equals("mr")?"आर्द्रता":"Humidity" %>:</b> ${humidity} %</p>
    <p class="info"><b><%= lang.equals("mr")?"हवामान":"Weather" %>:</b> ${weather}</p>

    <div class="alert">
        ${rainAlert}
    </div>

    <div class="advice">
        ${advice}
    </div>

    <a href="index.jsp">
        <button>⬅ <%= lang.equals("mr")?"मागे जा":"Back" %></button>
    </a>

</div>

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