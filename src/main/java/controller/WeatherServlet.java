package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.net.*;

public class WeatherServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {

        String city = req.getParameter("city");
        
        // जर शहराचे नाव रिकामे असेल तर
        if(city == null || city.trim().isEmpty()){
            res.sendRedirect("weather.jsp?error=invalid_city");
            return;
        }

        // सुरक्षिततेसाठी शहराचे नाव एन्कोड करा (उदा. 'New York' -> 'New%20York')
        String encodedCity = URLEncoder.encode(city, "UTF-8");
        String apiKey = "9f6667606901e77a483ff8bc44599445";
        String urlStr = "https://api.openweathermap.org/data/2.5/weather?q="
                + encodedCity + "&appid=" + apiKey + "&units=metric";

        try {
            URL url = new URL(urlStr);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");
            con.setConnectTimeout(5000); // ५ सेकंदात कनेक्ट नाही झाले तर टाइमआउट

            if(con.getResponseCode() != 200){
                req.setAttribute("error", "❌ शहर सापडले नाही किंवा इंटरनेट समस्या!");
                req.getRequestDispatcher("weather.jsp").forward(req, res);
                return;
            }

            BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            StringBuilder responseBuilder = new StringBuilder();
            String line;
            while((line = br.readLine()) != null){
                responseBuilder.append(line);
            }
            br.close();
            
            String result = responseBuilder.toString();

            // डेटा पार्सिंग (Parsing)
            double temp = getDouble(result, "\"temp\":");
            double feelsLike = getDouble(result, "\"feels_like\":");
            int humidity = (int) getDouble(result, "\"humidity\":");
            double windSpeed = getDouble(result, "\"speed\":");
            String weather = getWeather(result);

            // पावसाचा अंदाज
            double rain = 0;
            if(result.contains("\"rain\"") && result.contains("\"1h\"")){
                rain = getDouble(result, "\"1h\":");
            }

            // सल्ला (Advice Logic)
            String advice = "";
            String statusIcon = "✅";

            if(rain > 0){
                statusIcon = "🌧️";
                advice = "⚠️ पाऊस सुरू आहे - पेरणी किंवा कापणी थांबवा. खत टाकू नका.";
            } else if(weather.equalsIgnoreCase("Clouds")){
                statusIcon = "☁️";
                advice = (humidity > 75) ? "👉 पावसाची दाट शक्यता - सतर्क राहा." : "✅ हवामान ढगाळ आहे, कामे सुरू ठेवू शकता.";
            } else if(temp > 35){
                statusIcon = "🔥";
                advice = "उष्णता वाढली आहे - पिकांना पाणी द्या, दुपारी काम टाळा.";
            } else if(windSpeed > 8){
                statusIcon = "🌬️";
                advice = "जोरात वारा सुटला आहे - फवारणी टाळा.";
            } else {
                advice = "हवामान अनुकूल आहे - शेतीची कामे वेळेत पूर्ण करा.";
            }

            // JSP कडे डेटा पाठवणे
            req.setAttribute("city", city.toUpperCase());
            req.setAttribute("temp", temp);
            req.setAttribute("humidity", humidity);
            req.setAttribute("weather", weather);
            req.setAttribute("statusIcon", statusIcon);
            req.setAttribute("advice", advice);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "API शी संपर्क होऊ शकला नाही.");
        }

        req.getRequestDispatcher("weather.jsp").forward(req, res);
    }

    // सुरक्षित नंबर पार्सर
    private double getDouble(String json, String key){
        try {
            String temp = json.split(key)[1];
            StringBuilder value = new StringBuilder();
            for(int i=0; i<temp.length(); i++){
                char c = temp.charAt(i);
                if((c >= '0' && c <= '9') || c == '.'){
                    value.append(c);
                } else {
                    break;
                }
            }
            return Double.parseDouble(value.toString());
        } catch(Exception e){
            return 0;
        }
    }

    // वेदर पार्सर
    private String getWeather(String json){
        try {
            if(json.contains("\"main\":\"")){
                return json.split("\"main\":\"")[1].split("\"")[0];
            }
        } catch(Exception e) {}
        return "N/A";
    }
}
