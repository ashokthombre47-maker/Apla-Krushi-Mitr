<%@ page contentType="text/html;charset=UTF-8" %>

<%
String lang = (String) session.getAttribute("lang");
if(lang == null) lang = "en";
%>

<!DOCTYPE html>
<html>
<head>
<title>Soil Analysis</title>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="stylesheet" href="style.css">

<style>

.container{
    width: 420px;
    margin: 40px auto;
    text-align: center;

    /* 🔥 FIX */
    min-height: 650px;
    padding-bottom: 100px;
}

/* 📊 Graph fix */
canvas{
    margin-top:20px;
    height:320px !important;
}

/* Result */
.result{
    margin-top: 20px;
}

/* 🔙 Back button */
.back-btn{
    margin-top:10px;
    padding:8px 15px;
    background:#555;
    color:white;
    border:none;
    border-radius:6px;
    cursor:pointer;
}

/* 📱 Mobile */
@media(max-width:600px){
    .container{
        width: 95%;
        min-height: 700px;
    }

    canvas{
        height:260px !important;
    }
}

</style>

</head>

<body>

<!-- 🔹 Navbar -->
<header>
    <h2>🌱 APLA KRUSHI MITR</h2>

    <nav>
        <a href="index.jsp"><%= lang.equals("mr")?"मुख्यपृष्ठ":"Home" %></a>
        <a href="farmer-dashboard.jsp"><%= lang.equals("mr")?"डॅशबोर्ड":"Dashboard" %></a>

        <!-- 🌐 Language -->
        <a href="LanguageServlet?lang=en"><button>English</button></a>
        <a href="LanguageServlet?lang=mr"><button>मराठी</button></a>
    </nav>
</header>

<div class="container">

<h2>
<%= lang.equals("mr")?"📊 माती विश्लेषण":"📊 Soil Analysis" %>
</h2>

<!-- 🔹 FORM -->
<form onsubmit="showGraph(event)">
    <input type="number" id="n" placeholder="<%= lang.equals("mr")?"नायट्रोजन (N)":"Nitrogen (N)" %>" required><br><br>
    <input type="number" id="p" placeholder="<%= lang.equals("mr")?"फॉस्फरस (P)":"Phosphorus (P)" %>" required><br><br>
    <input type="number" id="k" placeholder="<%= lang.equals("mr")?"पोटॅशियम (K)":"Potassium (K)" %>" required><br><br>
    <input type="number" step="0.1" id="ph" placeholder="<%= lang.equals("mr")?"मातीचा pH":"Soil pH" %>" required><br><br>

    <button type="submit">
        <%= lang.equals("mr")?"विश्लेषण करा":"Analyze" %>
    </button>
</form>

<!-- 🔙 BACK -->
<button class="back-btn" onclick="goBack()">
    <%= lang.equals("mr")?"⬅ मागे जा":"⬅ Back" %>
</button>

<!-- 📊 GRAPH -->
<canvas id="soilChart"></canvas>

<!-- RESULT -->
<div id="resultBox" class="result"></div>

</div>

<footer>
<p>
<%= lang.equals("mr")?
"© 2026 आपला कृषी मित्र":
"© 2026 Apla Krushi Mitr" %>
</p>
</footer>

<script>

let chart;

function showGraph(e){
    e.preventDefault();

    let n = parseInt(document.getElementById("n").value);
    let p = parseInt(document.getElementById("p").value);
    let k = parseInt(document.getElementById("k").value);
    let ph = parseFloat(document.getElementById("ph").value);

    if(chart) chart.destroy();

    chart = new Chart(document.getElementById('soilChart'), {
        type: 'bar',
        data: {
            labels: ['N','P','K','pH'],
            datasets: [{
                data: [n,p,k,ph],
                backgroundColor:['#4caf50','#2196f3','#ff9800','#9c27b0']
            }]
        },
        options:{responsive:true}
    });

    let result = "";

    if("<%=lang%>" === "mr"){

        result += "<h3>📋 माती अहवाल</h3>";

        result += (n<50) ? "❌ नायट्रोजन कमी → युरिया वापरा<br>" :
                  (n>100) ? "⚠️ नायट्रोजन जास्त<br>" :
                  "✅ नायट्रोजन योग्य<br>";

        result += (p<30) ? "❌ फॉस्फरस कमी → DAP वापरा<br>" :
                  (p>60) ? "⚠️ फॉस्फरस जास्त<br>" :
                  "✅ फॉस्फरस योग्य<br>";

        result += (k<40) ? "❌ पोटॅशियम कमी → MOP वापरा<br>" :
                  (k>80) ? "⚠️ पोटॅशियम जास्त<br>" :
                  "✅ पोटॅशियम योग्य<br>";

        result += (ph<6) ? "❌ आम्लीय माती → चुना टाका<br>" :
                  (ph>7.5) ? "⚠️ क्षारीय माती → जिप्सम टाका<br>" :
                  "✅ pH योग्य<br>";

        result += "<hr>📌 योग्य मूल्ये:<br>N:50-100 | P:30-60 | K:40-80 | pH:6-7.5";

    } else {

        result += "<h3>📋 Soil Report</h3>";

        result += (n<50) ? "❌ Low Nitrogen → Use Urea<br>" :
                  (n>100) ? "⚠️ High Nitrogen<br>" :
                  "✅ Good Nitrogen<br>";

        result += (p<30) ? "❌ Low Phosphorus → Use DAP<br>" :
                  (p>60) ? "⚠️ High Phosphorus<br>" :
                  "✅ Good Phosphorus<br>";

        result += (k<40) ? "❌ Low Potassium → Use MOP<br>" :
                  (k>80) ? "⚠️ High Potassium<br>" :
                  "✅ Good Potassium<br>";

        result += (ph<6) ? "❌ Acidic Soil → Add Lime<br>" :
                  (ph>7.5) ? "⚠️ Alkaline Soil → Add Gypsum<br>" :
                  "✅ Good pH<br>";

        result += "<hr><b>Ideal Values:</b><br>N:50-100 | P:30-60 | K:40-80 | pH:6-7.5";
    }

    document.getElementById("resultBox").innerHTML = result;
}

// 🔙 BACK FUNCTION
function goBack(){
    window.history.back();
}

</script>

</body>
</html>