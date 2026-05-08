<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // भाषा निवड (Language Selection)
    String lang = (String) session.getAttribute("lang");
    if(lang == null) lang = "en";

    // युजर लॉगिन तपासणे
    String user = (String) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="<%= lang %>">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apla Krushi Mitr</title>
    
    <link rel="stylesheet" href="style.css">
</head>

<body>

<header>
    <h2>🌱 APLA KRUSHI MITR</h2>

    <nav>
        <a href="index.jsp"><%= lang.equals("mr")?"मुख्यपृष्ठ":"Home" %></a>

        <% if(user == null) { %>
            <a href="login.jsp"><%= lang.equals("mr")?"लॉगिन":"Login" %></a>
            <a href="register.jsp"><%= lang.equals("mr")?"नोंदणी":"Register" %></a>
        <% } else { %>
            <a href="predict.jsp"><%= lang.equals("mr")?"पीक निवड":"Predict Crop" %></a>
            <a href="weather.jsp"><%= lang.equals("mr")?"हवामान":"Weather" %></a>
            <a href="pest.jsp"><%= lang.equals("mr")?"कीड ओळखा":"Pest Detection" %></a>
            <a href="farming-guide.jsp"><%= lang.equals("mr")?"शेती मार्गदर्शक":"Guide" %></a>
            
            <a href="farmer-dashboard.jsp" style="font-weight:bold; color:#4CAF50;">
                👤 <%= user %>
            </a>

            <a href="LogoutServlet" class="logout-btn"><%= lang.equals("mr")?"लॉगआउट":"Logout" %></a>
        <% } %>

        <div class="lang-switch">
            <a href="LanguageServlet?lang=en"><button>EN</button></a>
            <a href="LanguageServlet?lang=mr"><button>MR</button></a>
        </div>
    </nav>
</header>

<section class="hero">
    <div class="hero-content">
        <h1>
            <%= lang.equals("mr") ? "वैज्ञानिक शेती सोपी बनवा" : "Scientific Farming Made Simple" %>
        </h1>

        <p>
            <%= lang.equals("mr") ? 
                "तुमच्या मातीचे अचूक विश्लेषण करा आणि भरघोस उत्पन्नासाठी योग्य पीक निवडा." : 
                "Accurately analyze your soil and choose the right crop for maximum yield." %>
        </p>

        <% if(user != null) { %>
            <a href="predict.jsp">
                <button class="main-btn">
                    <%= lang.equals("mr")?"सुरू करा":"Get Started" %>
                </button>
            </a>
        <% } else { %>
            <a href="login.jsp">
                <button class="main-btn">
                    <%= lang.equals("mr")?"लॉगिन करा":"Login to Start" %>
                </button>
            </a>
        <% } %>
    </div>
</section>

<footer>
    <p>
        <%= lang.equals("mr") ? 
        "© 2026 आपला कृषी मित्र | शेतकऱ्यांसाठी स्मार्ट शेती" : 
        "© 2026 Apla Krushi Mitr | Smart Farming for Farmers" %>
    </p>
</footer>

</body>
</html>
