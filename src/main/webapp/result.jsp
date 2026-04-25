<%@ page contentType="text/html;charset=UTF-8" %>

<%
String lang = (String) session.getAttribute("lang");
if(lang == null) lang = "en";

String crop = (String) request.getAttribute("crop");
if(crop == null) crop = "";
else crop = crop.trim();

// default values
String season = "";
String duration = "";
String method = "";

// ✅ IMAGE NAME FIXED MAPPING
String imgName = "default.jpg";

if("Rice".equalsIgnoreCase(crop)){
    imgName = "rice.jpg";
    season = lang.equals("mr") ? "खरीप (जून - ऑक्टोबर)" : "Kharif (June - October)";
    duration = lang.equals("mr") ? "120-150 दिवस" : "120-150 days";
    method = lang.equals("mr") ? "पाण्यात रोपांतर" : "Transplanting method";
}
else if("Wheat".equalsIgnoreCase(crop)){
    imgName = "wheat.jpg";
    season = lang.equals("mr") ? "रब्बी" : "Rabi";
    duration = lang.equals("mr") ? "110-130 दिवस" : "110-130 days";
    method = lang.equals("mr") ? "कोरडी पेरणी" : "Dry sowing";
}
else if("Cotton".equalsIgnoreCase(crop)){
    imgName = "cotton.jpg";
    season = lang.equals("mr") ? "खरीप" : "Kharif";
    duration = lang.equals("mr") ? "150-180 दिवस" : "150-180 days";
    method = lang.equals("mr") ? "काळी माती" : "Black soil sowing";
}
else if("Maize".equalsIgnoreCase(crop)){
    imgName = "maize.jpg";
    season = lang.equals("mr") ? "खरीप/रब्बी" : "Kharif/Rabi";
    duration = lang.equals("mr") ? "90-120 दिवस" : "90-120 days";
    method = lang.equals("mr") ? "सरळ पेरणी" : "Direct sowing";
}
else if("Sugarcane".equalsIgnoreCase(crop)){
    imgName = "sugarcane.jpg";
    season = lang.equals("mr") ? "वार्षिक" : "Annual";
    duration = lang.equals("mr") ? "10-18 महिने" : "10-18 months";
    method = lang.equals("mr") ? "खोड लागवड" : "Stem cutting";
}
else if("Bajra".equalsIgnoreCase(crop)){
    imgName = "bajra.jpg";
    season = lang.equals("mr") ? "खरीप" : "Kharif";
    duration = lang.equals("mr") ? "75-90 दिवस" : "75-90 days";
    method = lang.equals("mr") ? "दुष्काळ सहनशील" : "Drought resistant";
}
else if("Jowar".equalsIgnoreCase(crop)){
    imgName = "jowar.jpg";
    season = lang.equals("mr") ? "खरीप/रब्बी" : "Kharif/Rabi";
    duration = lang.equals("mr") ? "90-110 दिवस" : "90-110 days";
    method = lang.equals("mr") ? "कमी पाणी" : "Low water requirement";
}
else if("Soybean".equalsIgnoreCase(crop)){
    imgName = "soybean.jpg";
    season = lang.equals("mr") ? "खरीप" : "Kharif";
    duration = lang.equals("mr") ? "80-100 दिवस" : "80-100 days";
    method = lang.equals("mr") ? "ओळींमध्ये पेरणी" : "Row sowing";
}
else if("Groundnut".equalsIgnoreCase(crop)){
    imgName = "groundnut.jpg";
    season = lang.equals("mr") ? "खरीप" : "Kharif";
    duration = lang.equals("mr") ? "100-120 दिवस" : "100-120 days";
    method = lang.equals("mr") ? "वालुकामय जमीन" : "Sandy soil";
}

// ✅ FINAL IMAGE PATH
String image = request.getContextPath() + "/images/" + imgName;
%>

<!DOCTYPE html>
<html>
<head>
<title>Result - Krushi Mitra</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background:#e8f5e9;
}
.card{
    border-radius:15px;
}
.crop-img{
    width:100%;
    height:260px;
    object-fit:cover;
    border-radius:10px;
}
</style>

</head>

<body>

<!-- ✅ NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">🌱 KRUSHI MITRA</a>
        <div>
            <a href="index.jsp" class="btn btn-light btn-sm">Home</a>
            <a href="predict.jsp" class="btn btn-light btn-sm">Predict</a>
        </div>
    </div>
</nav>

<!-- ✅ RESULT -->
<div class="container mt-5">
<div class="card p-4 shadow text-center">

<h2 class="text-success">
<%= lang.equals("mr") ? "सुचवलेले पीक" : "Recommended Crop" %>
</h2>

<% if(!crop.equals("")) { %>

<!-- IMAGE -->
<img src="<%=image%>" class="crop-img"
     onerror="this.src='<%=request.getContextPath()%>/images/default.jpg'">

<!-- NAME -->
<h3 class="mt-3 text-success">
<%= lang.equals("mr") ? 
    (crop.equals("Rice")?"भात":
     crop.equals("Wheat")?"गहू":
     crop.equals("Cotton")?"कापूस":
     crop.equals("Maize")?"मका":
     crop.equals("Sugarcane")?"ऊस":
     crop.equals("Bajra")?"बाजरी":
     crop.equals("Jowar")?"ज्वारी":
     crop.equals("Soybean")?"सोयाबीन":
     crop.equals("Groundnut")?"शेंगदाणे": crop)
: crop %>
</h3>

<hr>

<p><b><%= lang.equals("mr")?"हंगाम":"Season" %>:</b> <%=season%></p>
<p><b><%= lang.equals("mr")?"कालावधी":"Duration" %>:</b> <%=duration%></p>
<p><b><%= lang.equals("mr")?"पद्धत":"Method" %>:</b> <%=method%></p>

<% } else { %>

<h4>No Recommendation Found ❌</h4>

<% } %>

<a href="predict.jsp" class="btn btn-success mt-3">
<%= lang.equals("mr")?"पुन्हा प्रयत्न करा":"Try Again" %>
</a>

</div>
</div>

</body>
</html>