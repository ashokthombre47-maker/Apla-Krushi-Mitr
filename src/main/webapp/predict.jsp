<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // भाषा निवड
    String lang = (String) session.getAttribute("lang");
    if(lang == null) lang = "en";

    // लॉगिन चेक (जर युजर लॉगिन नसेल, तर त्याला लॉगिन पेजवर पाठवणे चांगले)
    String user = (String) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="<%= lang %>">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Predict Crop - Apla Krushi Mitr</title>
    
    <link rel="stylesheet" href="style.css">
</head>

<body>

<header>
    <h2>🌱 APLA KRUSHI MITR</h2>
    <nav>
        <a href="index.jsp"><%= lang.equals("mr")?"मुख्यपृष्ठ":"Home" %></a>
        
        <% if(user == null) { %>
            <a href="login.jsp"><%= lang.equals("mr")?"लॉगिन":"Login" %></a>
        <% } else { %>
            <a href="farmer-dashboard.jsp">👤 <%= user %></a>
            <a href="LogoutServlet"><%= lang.equals("mr")?"लॉगआउट":"Logout" %></a>
        <% } %>

        <div class="lang-switch">
            <a href="LanguageServlet?lang=en"><button>EN</button></a>
            <a href="LanguageServlet?lang=mr"><button>MR</button></a>
        </div>
    </nav>
</header>

<div class="container">
    
    <section class="form-section">
        <form action="WeatherServlet" method="get" class="weather-form">
            <h2><%= lang.equals("mr")?"आजचे हवामान":"Check Weather" %></h2>
            <div class="input-group">
                <input type="text" name="city" 
                       placeholder="<%= lang.equals("mr")?"शहराचे नाव टाका":"Enter City Name" %>" required>
                <button type="submit" class="weather-btn">
                    <%= lang.equals("mr")?"पहा":"Search" %>
                </button>
            </div>
        </form>
    </section>

    <section class="form-section">
        <form action="CropPredictServlet" method="post" class="predict-form">
            <h2><%= lang.equals("mr")?"पीक निवड (NPK आधारित)":"Crop Prediction" %></h2>
            
            <div class="grid-inputs">
                <div class="field">
                    <label><%= lang.equals("mr")?"नायट्रोजन (N)":"Nitrogen (N)" %></label>
                    <input type="number" name="n" placeholder="Value" required>
                </div>

                <div class="field">
                    <label><%= lang.equals("mr")?"फॉस्फरस (P)":"Phosphorus (P)" %></label>
                    <input type="number" name="p" placeholder="Value" required>
                </div>

                <div class="field">
                    <label><%= lang.equals("mr")?"पोटॅशियम (K)":"Potassium (K)" %></label>
                    <input type="number" name="k" placeholder="Value" required>
                </div>

                <div class="field">
                    <label><%= lang.equals("mr")?"मातीचा pH स्तर":"Soil pH" %></label>
                    <input type="number" step="0.1" name="ph" placeholder="0 - 14" required>
                </div>
            </div>

            <label><%= lang.equals("mr")?"सरासरी पर्जन्यमान (मिमी)":"Annual Rainfall (mm)" %></label>
            <input type="number" name="rainfall" placeholder="Ex: 1200" required>

            <button type="submit" class="predict-btn">
                <%= lang.equals("mr")?"पीक सुचवा":"Predict Best Crop" %>
            </button>
        </form>
    </section>

</div>

<footer>
    <p>
        <%= lang.equals("mr") ? 
        "© 2026 आपला कृषी मित्र | शेतकऱ्यांसाठी स्मार्ट शेती" : 
        "© 2026 Apla Krushi Mitr | Smart Farming for Farmers" %>
    </p>
</footer>

</body>
</html>
