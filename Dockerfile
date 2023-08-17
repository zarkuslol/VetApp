# BACK-END

# Use a imagem base do OpenJDK 17 para o Java
FROM openjdk:17-jdk-slim AS builder_back

# Diretório de trabalho dentro do container
WORKDIR /app

# Copiar o código-fonte do projeto para o diretório de trabalho
COPY . .

RUN chmod +x mvnw

# Build do projeto Spring Boot
RUN ./mvnw clean package -DskipTests

# Imagem final com a aplicação Spring Boot
FROM openjdk:17-jdk-slim

# Copiar o artefato construído do estágio anterior
COPY --from=builder_back /app/target/VetApp-0.0.1-SNAPSHOT.jar /app/target/VetApp-0.0.1-SNAPSHOT.jar

# Comando para executar a aplicação Spring Boot
CMD ["java", "-jar", "/app/target/VetApp-0.0.1-SNAPSHOT.jar"]
