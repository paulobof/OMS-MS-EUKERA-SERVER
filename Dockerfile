# Etapa 1: Construção da imagem com o Maven
FROM maven:3.9.8-eclipse-temurin-17 AS builder
COPY src /app/src
COPY pom.xml /app
WORKDIR /app
RUN mvn clean package -DskipTests

# Etapa 2: Criando a imagem final com o Java
FROM eclipse-temurin:17.0.11_9-jdk-alpine
RUN addgroup -S spring && adduser -S spring -G spring
USER spring
COPY --from=builder /app/target/*.jar /app/eureka-server.jar

EXPOSE 8761

ENTRYPOINT ["java", "-jar", "/app/eureka-server.jar"]
