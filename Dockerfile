# Build stage for ClaireBot
FROM eclipse-temurin:25-jdk-noble AS bot-build
ARG BOT_VERSION=main
WORKDIR /build
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/Sidpatchy/ClaireBot.git
WORKDIR /build/ClaireBot
RUN git checkout ${BOT_VERSION}
RUN chmod +x ./gradlew
RUN ./gradlew shadowJar

# Build stage for ClaireData (Spring Boot)
FROM eclipse-temurin:25-jdk-noble AS api-build
ARG API_VERSION=main
WORKDIR /build
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/Sidpatchy/ClaireData.git
WORKDIR /build/ClaireData
RUN git checkout ${API_VERSION}
RUN chmod +x ./gradlew
RUN ./gradlew bootJar

# Final runtime stage
FROM eclipse-temurin:25-jdk-noble

WORKDIR /app

# Copy specific jar files
COPY --from=bot-build /build/ClaireBot/build/libs/ClaireBot-*-all.jar /app/bot.jar
COPY --from=api-build /build/ClaireData/build/libs/ClaireData-*.jar /app/api.jar

# Create config directory
RUN mkdir -p /app/config
