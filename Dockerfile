FROM maven:3.8.4-openjdk-11 AS build
WORKDIR src/main/webapp
COPY . .
RUN mvn clean install
FROM tomcat:9-jre11-slim
COPY --from=build src/main/webapp/index.jsp /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
