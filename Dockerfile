# You can change this base image to anything else
# But make sure to use the correct version of Java
FROM adoptopenjdk/openjdk11:alpine-jre

# Simply the artifact path
ARG artifact=/home/runner/work/Jenkins-Zero-To-Hero/Jenkins-Zero-To-Hero/java-maven-sonar-argocd-helm-k8s/spring-boot-app/target/spring-boot-web.jar

WORKDIR /opt/app

COPY ${artifact} app.jar

# This should not be changed
ENTRYPOINT ["java","-jar","app.jar"]
