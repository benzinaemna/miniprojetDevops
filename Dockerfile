# Utiliser une image de base avec Java et Maven
FROM maven:3.8-openjdk-17 AS build

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier le fichier pom.xml pour télécharger les dépendances
COPY pom.xml .

# Télécharger les dépendances Maven
RUN mvn dependency:go-offline

# Copier les fichiers source dans le conteneur
COPY src ./src

# Compiler l'application
RUN mvn package

# Utiliser une image JRE légère pour exécuter l'application
FROM openjdk:17-jdk-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier le fichier JAR construit à partir de l'étape précédente
COPY --from=build /app/target/jpa-spring-boot-Thymeleaf-0.0.1-SNAPSHOT.jar .

# Exposer le port sur lequel l'application écoute
EXPOSE 8888

# Commande pour démarrer l'application lorsque le conteneur démarre
CMD ["java", "-jar", "jpa-spring-boot-Thymeleaf-0.0.1-SNAPSHOT.jar"]
