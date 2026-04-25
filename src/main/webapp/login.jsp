<%@ page contentType="text/html;charset=UTF-8" %>

<%
String lang = (String) session.getAttribute("lang");
if(lang == null) lang = "en";
%>

<%
String msg = request.getParameter("msg");

if("error".equals(msg)){
%>
<p style="color:red;">Invalid Email or Password ❌</p>
<% } else if("exception".equals(msg)){ %>
<p style="color:red;">Server Error ❌</p>
<% } else if("login_success".equals(msg)){ %>
<p style="color:green;">Login Successful ✅</p>
<% } %>

<!DOCTYPE html>
<html>
<head>
    <title>Login - Apla Krushi Mitr</title>

    <!-- ✅ CSS इथे add -->
    <link rel="stylesheet" href="style.css">
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

        <!-- Language Buttons -->
        <a href="LanguageServlet?lang=en"><button>English</button></a>
        <a href="LanguageServlet?lang=mr"><button>मराठी</button></a>
    </nav>
</header>

<!-- 🔹 Login Form -->
<form action="LoginServlet" method="post">

    <h2><%= lang.equals("mr")?"लॉगिन":"Login" %></h2>

    <label><%= lang.equals("mr")?"ईमेल":"Email" %></label>
    <input type="email" name="email" required>

    <label><%= lang.equals("mr")?"पासवर्ड":"Password" %></label>
    <input type="password" name="password" required>

    <button type="submit">
        <%= lang.equals("mr")?"लॉगिन करा":"Login" %>
    </button>

</form>

<!-- 🔹 Footer -->
<footer>
    <p>
        <%= lang.equals("mr") ?
        "© 2026 आपला कृषी मित्र" :
        "© 2026 Apla Krushi Mitr" %>
    </p>
</footer>

</body>
</html>