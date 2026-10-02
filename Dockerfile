FROM maven:3.9-eclipse-temurin-21 AS builder
WORKDIR /app
COPY . .
# maven defaults to compile files in src/main/java
RUN mvn package

FROM eclipse-temurin:21-jre
COPY --from=builder /app/target/*.jar app.jar
CMD ["java", "-jar", "app.jar"]