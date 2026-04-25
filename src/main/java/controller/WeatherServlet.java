package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.net.*;

public class WeatherServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {

        String city = req.getParameter("city");

        String apiKey = "9f6667606901e77a483ff8bc44599445";
        String urlStr = "https://api.openweathermap.org/data/2.5/weather?q="
                + city + "&appid=" + apiKey + "&units=metric";

        URL url = new URL(urlStr);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");

        if(con.getResponseCode() != 200){
            req.setAttribute("error", "❌ City not found / API issue");
            RequestDispatcher rd = req.getRequestDispatcher("weather.jsp");
            rd.forward(req, res);
            return;
        }

        BufferedReader br = new BufferedReader(
                new InputStreamReader(con.getInputStream()));

        String line, result = "";
        while((line = br.readLine()) != null){
            result += line;
        }

        // ✅ FIXED parsing (more accurate)

        double temp = getDouble(result, "\"temp\":");
        double feelsLike = getDouble(result, "\"feels_like\":");
        int humidity = (int) getDouble(result, "\"humidity\":");
        double windSpeed = getDouble(result, "\"speed\":");

        // 🔥 FIX: weather extraction improved
        String weather = getWeather(result);

        // 🌧️ Rain (more stable)
        double rain = 0;
        try {
            if(result.contains("\"rain\"") && result.contains("\"1h\"")){
                rain = getDouble(result, "\"1h\":");
            }
        } catch(Exception e){
            rain = 0;
        }

        String advice = "";
        String rainAlert = "";

        if(rain > 0){
            rainAlert = "🌧️ सध्या पाऊस पडतोय (" + rain + " mm)";
            advice = "⚠️ पेरणी थांबवा | खत टाकू नका | कापणी टाळा";
        }
        else if(weather.equalsIgnoreCase("Clouds")){
            rainAlert = "☁️ ढगाळ वातावरण";

            if(humidity > 75 && windSpeed < 3){
                advice = "👉 पावसाची शक्यता आहे – तयारी ठेवा";
            } else {
                advice = "✅ सध्या पाऊस नाही – शेती काम सुरू ठेवा";
            }
        }
        else if(temp > 35 || feelsLike > 38){
            rainAlert = "🔥 उष्णता जास्त आहे";
            advice = "पिकांना पाणी द्या | दुपारी सिंचन टाळा";
        }
        else if(temp < 15){
            rainAlert = "❄️ थंडी जास्त आहे";
            advice = "पिकांचे संरक्षण करा";
        }
        else if(humidity > 85){
            rainAlert = "💧 आर्द्रता खूप जास्त आहे";
            advice = "रोगांचा धोका – फवारणी करा";
        }
        else if(windSpeed > 8){
            rainAlert = "🌬️ जोरदार वारा";
            advice = "फवारणी टाळा | पिकांचे संरक्षण करा";
        }
        else{
            rainAlert = "✅ हवामान सामान्य आहे";
            advice = "शेती कामे सुरू ठेवा";
        }

        req.setAttribute("city", city);
        req.setAttribute("temp", temp);
        req.setAttribute("humidity", humidity);
        req.setAttribute("weather", weather);
        req.setAttribute("rainAlert", rainAlert);
        req.setAttribute("advice", advice);

        RequestDispatcher rd = req.getRequestDispatcher("weather.jsp");
        rd.forward(req, res);
    }

    // 🔒 SAFE NUMBER PARSER
    private double getDouble(String json, String key){
        try {
            String temp = json.split(key)[1];
            String value = "";

            for(int i=0; i<temp.length(); i++){
                char c = temp.charAt(i);

                if((c >= '0' && c <= '9') || c == '.'){
                    value += c;
                } else {
                    break;
                }
            }

            return Double.parseDouble(value);
        } catch(Exception e){
            return 0;
        }
    }

    // 🔥 FIXED WEATHER PARSER
    private String getWeather(String json){
        try {
            if(json.contains("\"main\":\"")){
                return json.split("\"main\":\"")[1].split("\"")[0];
            }
        } catch(Exception e){
        }
        return "N/A";
    }
}