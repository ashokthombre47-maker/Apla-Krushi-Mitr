<%@ page contentType="text/html;charset=UTF-8" %>

<%
String user = (String) session.getAttribute("user");
String role = (String) session.getAttribute("role");

if(user == null || !"farmer".equals(role)){
    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Farmer Dashboard</title>
    <link rel="stylesheet" href="style.css">

    <style>
        .dashboard {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 25px;
            margin-top: 40px;
            padding: 10px;
        }

        .card {
            width: 260px;
            padding: 30px;
            border-radius: 18px;
            color: white;
            text-align: center;
            font-size: 18px;
            cursor: pointer;
            transition: 0.3s;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
        }

        .card:hover {
            transform: translateY(-8px) scale(1.05);
        }

        .card span {
            font-size: 40px;
            display: block;
            margin-bottom: 10px;
        }

        /* Gradient Cards */
        .weather { background: linear-gradient(45deg,#03a9f4,#0288d1); }
        .crop { background: linear-gradient(45deg,#4caf50,#2e7d32); }
        .pest { background: linear-gradient(45deg,#ef5350,#c62828); }
        .calendar { background: linear-gradient(45deg,#ff9800,#f57c00); }
        .soil { background: linear-gradient(45deg,#8d6e63,#5d4037); }

        /* Welcome Box */
        .welcome-box {
            width: 90%;
            max-width: 600px;
            margin: 30px auto;
            padding: 20px;
            text-align: center;
            background: rgba(255,255,255,0.2);
            border-radius: 15px;
            backdrop-filter: blur(10px);
            color: #2e7d32;
            box-shadow: 0 5px 20px rgba(0,0,0,0.2);
        }

        /* 📱 Mobile */
        @media(max-width:768px){
            .card {
                width: 90%;
            }
        }
    </style>
</head>

<body>

<!-- 🔹 Navbar -->
<header>
    <h2>🌱 APLA KRUSHI MITR</h2>

    <nav>
        <a href="index.jsp">Home</a>
        <a href="LogoutServlet">Logout</a>
    </nav>
</header>

<!-- 🔥 Welcome Box -->
<div class="welcome-box">
    <h2>👋 Welcome, <%= user %></h2>
    <p>Smart Farming Dashboard 🚜</p>
</div>

<!-- 🔥 DASHBOARD CARDS -->
<div class="dashboard">

    <div class="card weather" onclick="location.href='predict.jsp'">
        <span>🌦️</span>
        Weather Check
    </div>

    <div class="card crop" onclick="location.href='predict.jsp'">
        <span>🌾</span>
        Crop Prediction
    </div>

    <div class="card pest" onclick="location.href='pest.jsp'">
        <span>🐛</span>
        Pest Detection
    </div>

    <!-- 🔥 NEW FEATURES -->
    <div class="card calendar" onclick="location.href='farming-guide.jsp'">
    <span>📅</span>
    Crop Calendar
</div>

    <div class="card soil" onclick="location.href='soil.jsp'">
        <span>📊</span>
        Soil Analysis
    </div>

</div>


<!-- 🔹 Footer -->
<footer>
    <p>
        © 2026 Apla Krushi Mitr | Smart Farming for Farmers
    </p>
</footer>

</body>
</html>