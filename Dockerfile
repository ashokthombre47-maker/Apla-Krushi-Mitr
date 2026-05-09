FROM tomcat:9.0-jdk17-openjdk
# तुझ्या फोल्डर स्ट्रक्चरनुसार हे कमांड वेब कंटेंट कॉपी करेल
COPY src/main/webapp/ /usr/local/tomcat/webapps/ROOT/

EXPOSE 8080
CMD ["catalina.sh", "run"]
