FROM maven:3.8.6-eclipse-temurin AS build
WORKDIR /mpr-java
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jdk
WORKDIR /mpr-java
COPY --from=build /mpr-java/target/*.jar mpr-java.jar
ENTRYPOINT ["java","-jar","mpr-java.jar"]