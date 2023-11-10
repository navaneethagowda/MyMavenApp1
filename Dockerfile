FROM tomcat:8-jdk11-corretto-al2
COPY src/main/webapp/index.jsp /usr/local/tomcat/webapps/MyMavenApp.war
