FROM maven:3.8.4-openjdk-11 AS build
WORKDIR /usr/src/app
COPY . .
RUN mvn clean install
FROM tomcat:9-jre11-slim
COPY --from=build /usr/src/app/target/index.jsp /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
