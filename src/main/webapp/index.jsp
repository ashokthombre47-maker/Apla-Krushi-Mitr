<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String lang = (String) session.getAttribute("lang");
    if(lang == null) lang = "en";

    String user = (String) session.getAttribute("user"); // ✅ added
%>

<!DOCTYPE html>
<html>
<head>
    <title>Apla Krushi Mitr</title>
    
    <!-- CSS Link -->
    <link rel="stylesheet" href="style.css">
</head>

<body>

<!-- 🔹 Navbar -->
<header>
    <h2>🌱 APLA KRUSHI MITR</h2>

    <nav>
        <a href="index.jsp"><%= lang.equals("mr")?"मुख्यपृष्ठ":"Home" %></a>

        <% if(user == null) { %>
            <!-- 🔓 BEFORE LOGIN -->
            <a href="login.jsp"><%= lang.equals("mr")?"लॉगिन":"Login" %></a>
            <a href="register.jsp"><%= lang.equals("mr")?"नोंदणी":"Register" %></a>
        <% } else { %>
            <!-- 🔐 AFTER LOGIN -->
            <a href="predict.jsp"><%= lang.equals("mr")?"पीक निवड":"Predict Crop" %></a>
            <a href="soil.jsp"><%= lang.equals("mr")?"माती परीक्षण":"Soil Analysis" %></a>
            

           <a href="pest.jsp">
            <%= lang.equals("mr")?"कीड ओळखा":"Pest Detection" %>
            </a>

            <a href="about.jsp"><%= lang.equals("mr")?"माहिती":"About" %></a>
            <a href="contact.jsp"><%= lang.equals("mr")?"संपर्क":"Contact" %></a>
            <a href="farming-guide.jsp"><%= lang.equals("mr")?"शेती मार्गदर्शक":"farming-guide" %></a>
            <a href="farmer-dashboard.jsp">farmer-dashboard</a>

            <a href="LogoutServlet"><%= lang.equals("mr")?"लॉगआउट":"Logout" %></a>
        <% } %>

        <!-- Language Buttons -->
        <a href="LanguageServlet?lang=en"><button>English</button></a>
        <a href="LanguageServlet?lang=mr"><button>मराठी</button></a>
    </nav>
</header>

<!-- 🔹 Hero Section -->
<section class="hero">

 

    <h1>
        <%= lang.equals("mr") ?
        "वैज्ञानिक शेती सोपी बनवा" :
        "Scientific Farming Made Simple" %>
    </h1>

    <p>
        <%= lang.equals("mr") ?
        "मातीचे विश्लेषण करून योग्य पीक निवडा" :
        "Analyze soil data and get crop recommendations" %>
    </p>

    <a href="predict.jsp">
        <button>
            <%= lang.equals("mr")?"सुरू करा":"Open Tool" %>
        </button>
    </a>

</section>



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