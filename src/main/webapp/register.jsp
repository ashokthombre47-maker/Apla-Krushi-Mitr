<%@ page contentType="text/html;charset=UTF-8" %>

<%
String lang = (String) session.getAttribute("lang");
if(lang == null) lang = "en";

String msg = request.getParameter("msg");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Register - Apla Krushi Mitr</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- CSS -->
    <link rel="stylesheet" href="style.css">

    <style>
        .msg {
            text-align:center;
            margin-top:10px;
            font-weight:bold;
            color:green;
        }
    </style>

    <script>
        function togglePassword(){
            let pass = document.getElementById("password");
            pass.type = pass.type === "password" ? "text" : "password";
        }

        function validateForm(){
            let p1 = document.getElementById("password").value;
            let p2 = document.getElementById("confirmPassword").value;

            if(p1 !== p2){
                alert("Passwords do not match!");
                return false;
            }
            return true;
        }
    </script>
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

        <a href="LanguageServlet?lang=en"><button>English</button></a>
        <a href="LanguageServlet?lang=mr"><button>मराठी</button></a>
    </nav>
</header>

<!-- 🔥 SUCCESS MESSAGE -->
<% if("success".equals(msg)){ %>
<p class="msg">
    <%= lang.equals("mr")?"नोंदणी यशस्वी झाली ✅":"Registration Successful ✅" %>
</p>
<% } %>

<!-- 🔹 Register Form -->
<form action="RegisterServlet" method="post" onsubmit="return validateForm()">

    <h2><%= lang.equals("mr")?"नोंदणी":"Register" %></h2>

    <!-- Name -->
    <label><%= lang.equals("mr")?"नाव":"Name" %></label>
    <input type="text" name="name" placeholder="Enter Name" required>

    <!-- Email -->
    <label><%= lang.equals("mr")?"ईमेल":"Email" %></label>
    <input type="email" name="email" placeholder="Enter Email" required>

    <!-- Password -->
    <label><%= lang.equals("mr")?"पासवर्ड":"Password" %></label>
    <input type="password" id="password" name="password" placeholder="Enter Password" required>

    <!-- Confirm Password -->
    <label><%= lang.equals("mr")?"पासवर्ड पुन्हा टाका":"Confirm Password" %></label>
    <input type="password" id="confirmPassword" placeholder="Confirm Password" required>

    <!-- Show Password -->
    <p style="font-size:13px;">
        <input type="checkbox" onclick="togglePassword()">
        <%= lang.equals("mr")?"पासवर्ड दाखवा":"Show Password" %>
    </p>

    <!-- Role Selection (NEW) -->
    <label><%= lang.equals("mr")?"वापरकर्ता प्रकार":"User Role" %></label>
    <select name="role" required>
        <option value="farmer">
            <%= lang.equals("mr")?"शेतकरी":"Farmer" %>
        </option>
        <option value="admin">Admin</option>
    </select>

    <button type="submit">
        <%= lang.equals("mr")?"नोंदणी करा":"Register" %>
    </button>

    <!-- Login Link -->
    <p style="text-align:center; margin-top:10px;">
        <%= lang.equals("mr")?"आधीच खाते आहे?":"Already have an account?" %>
        <a href="login.jsp">
            <%= lang.equals("mr")?"लॉगिन करा":"Login Here" %>
        </a>
    </p>

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