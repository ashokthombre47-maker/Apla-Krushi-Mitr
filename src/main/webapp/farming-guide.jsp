<%@ page contentType="text/html;charset=UTF-8" %>

<%
String lang = (String) session.getAttribute("lang");
if(lang == null) lang = "en";
%>

<!DOCTYPE html>
<html>
<head>
<title>Farming Guide - Krushi Mitra</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background: linear-gradient(to right, #d4fc79, #96e6a1);
}
.card{
    border-radius:20px;
    transition:0.3s;
}
.card:hover{
    transform:translateY(-5px);
    box-shadow:0 10px 25px rgba(0,0,0,0.2);
}
.crop-img{
    width:100%;
    height:200px;
    object-fit:cover;
    border-radius:10px;
}
</style>

</head>

<body>

<nav class="navbar navbar-dark bg-success">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.jsp">🌱 KRUSHI MITRA</a>
 
     <a href="index.jsp" class="btn btn-light btn-sm">
                <%= lang.equals("mr")?"मुख्यपृष्ठ":"Home" %>
            </a>
</nav>

<div class="container mt-5">

<h2 class="text-center text-success">
<%= lang.equals("mr")?"पीक मार्गदर्शक":"Crop Farming Guide" %>
</h2>

<div class="row mt-4">

<!-- 🌾 RICE -->
<div class="col-md-4">
<div class="card p-3">
<img src="images/rice.jpg" class="crop-img">
<h4 class="text-success mt-2"><%= lang.equals("mr")?"भात":"Rice" %></h4>

<p>
<b><%= lang.equals("mr")?"हंगाम":"Season" %>:</b> Kharif <br>
<b><%= lang.equals("mr")?"कालावधी":"Duration" %>:</b> 120-150 days <br>
<b>Soil:</b> Clay soil <br>
<b>Irrigation:</b> High water (standing water required) <br>
<b>Fertilizer:</b> NPK + organic manure <br>
<b>Climate:</b> Warm & humid <br>
<b>Yield:</b> 20-30 quintal/acre <br>
</p>

</div>
</div>

<!-- 🌾 WHEAT -->
<div class="col-md-4">
<div class="card p-3">
<img src="images/wheat.jpg" class="crop-img">
<h4 class="text-success mt-2"><%= lang.equals("mr")?"गहू":"Wheat" %></h4>

<p>
<b>Season:</b> Rabi <br>
<b>Duration:</b> 110-130 days <br>
<b>Soil:</b> Loamy soil <br>
<b>Irrigation:</b> Moderate (4-5 watering) <br>
<b>Fertilizer:</b> Nitrogen rich fertilizers <br>
<b>Climate:</b> Cool climate <br>
<b>Yield:</b> 15-25 quintal/acre
</p>

</div>
</div>

<!-- 🌾 COTTON -->
<div class="col-md-4">
<div class="card p-3">
<img src="images/cotton.jpg" class="crop-img">
<h4 class="text-success mt-2"><%= lang.equals("mr")?"कापूस":"Cotton" %></h4>

<p>
<b>Season:</b> Kharif <br>
<b>Duration:</b> 150-180 days <br>
<b>Soil:</b> Black soil <br>
<b>Irrigation:</b> Moderate <br>
<b>Fertilizer:</b> NPK + potash <br>
<b>Climate:</b> Hot climate <br>
<b>Yield:</b> 10-15 quintal/acre
</p>

</div>
</div>

<!-- 🌽 MAIZE -->
<div class="col-md-4 mt-3">
<div class="card p-3">
<img src="images/maize.jpg" class="crop-img">
<h4 class="text-success mt-2"><%= lang.equals("mr")?"मका":"Maize" %></h4>

<p>
<b>Season:</b> Kharif/Rabi <br>
<b>Duration:</b> 90-120 days <br>
<b>Soil:</b> Well-drained soil <br>
<b>Irrigation:</b> Moderate <br>
<b>Fertilizer:</b> Nitrogen based <br>
<b>Climate:</b> Warm climate <br>
<b>Yield:</b> 20-25 quintal/acre
</p>

</div>
</div>

<!-- 🌱 SUGARCANE -->
<div class="col-md-4 mt-3">
<div class="card p-3">
<img src="images/sugarcane.jpg" class="crop-img">
<h4 class="text-success mt-2"><%= lang.equals("mr")?"ऊस":"Sugarcane" %></h4>

<p>
<b>Season:</b> Annual <br>
<b>Duration:</b> 10-18 months <br>
<b>Soil:</b> Fertile loamy soil <br>
<b>Irrigation:</b> High <br>
<b>Fertilizer:</b> Heavy manure + NPK <br>
<b>Climate:</b> Tropical <br>
<b>Yield:</b> 30-50 ton/acre
</p>

</div>
</div>

<!-- 🌾 BAJRA -->
<div class="col-md-4 mt-3">
<div class="card p-3">
<img src="images/bajra.jpg" class="crop-img">
<h4 class="text-success mt-2"><%= lang.equals("mr")?"बाजरी":"Bajra" %></h4>

<p>
<b>Season:</b> Kharif <br>
<b>Duration:</b> 75-90 days <br>
<b>Soil:</b> Sandy soil <br>
<b>Irrigation:</b> Low <br>
<b>Fertilizer:</b> Minimal fertilizers <br>
<b>Climate:</b> Dry climate <br>
<b>Yield:</b> 8-12 quintal/acre
</p>

</div>
</div>

<!-- 🌾 JOWAR -->
<div class="col-md-4 mt-3">
<div class="card p-3">
<img src="images/jowar.jpg" class="crop-img">
<h4 class="text-success mt-2"><%= lang.equals("mr")?"ज्वारी":"Jowar" %></h4>

<p>
<b>Season:</b> Kharif/Rabi <br>
<b>Duration:</b> 90-110 days <br>
<b>Soil:</b> Light soil <br>
<b>Irrigation:</b> Low <br>
<b>Fertilizer:</b> Organic + NPK <br>
<b>Climate:</b> Semi-arid <br>
<b>Yield:</b> 10-15 quintal/acre
</p>

</div>
</div>

<!-- 🌱 SOYBEAN -->
<div class="col-md-4 mt-3">
<div class="card p-3">
<img src="images/soybean.jpg" class="crop-img">
<h4 class="text-success mt-2"><%= lang.equals("mr")?"सोयाबीन":"Soybean" %></h4>

<p>
<b>Season:</b> Kharif <br>
<b>Duration:</b> 85-100 days <br>
<b>Soil:</b> Well-drained soil <br>
<b>Irrigation:</b> Moderate <br>
<b>Fertilizer:</b> Phosphorus rich <br>
<b>Climate:</b> Moderate rainfall <br>
<b>Yield:</b> 10-20 quintal/acre
</p>

</div>
</div>

<!-- 🥜 GROUNDNUT -->
<div class="col-md-4 mt-3">
<div class="card p-3">
<img src="images/groundnut.jpg" class="crop-img">
<h4 class="text-success mt-2"><%= lang.equals("mr")?"शेंगदाणे":"Groundnut" %></h4>

<p>
<b>Season:</b> Kharif <br>
<b>Duration:</b> 100-120 days <br>
<b>Soil:</b> Sandy soil <br>
<b>Irrigation:</b> Low <br>
<b>Fertilizer:</b> Calcium + phosphorus <br>
<b>Climate:</b> Warm climate <br>
<b>Yield:</b> 8-12 quintal/acre
</p>

</div>
</div>

</div>
</div>

<footer class="text-center mt-5 p-3 bg-success text-white">
<p>© 2026 Krushi Mitra</p>
</footer>

</body>
</html>