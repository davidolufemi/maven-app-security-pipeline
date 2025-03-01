README for Maven App CI/CD Workflow
Maven App CI/CD Pipeline
This repository contains a Continuous Integration and Continuous Deployment (CI/CD) pipeline for a Maven-based Java application. The pipeline automates the following tasks:

Build: Builds a Maven package using the mvn clean package command.
Security Scanning: Runs security scans using Snyk to check for vulnerabilities in the codebase.
Docker Image Build: Builds a Docker image for the application and pushes it to Docker Hub.
Deployment to EC2: Deploys the Docker image to an AWS EC2 instance via SSH.
The workflow is triggered on each push to the main branch or manually through GitHub Actions (workflow_dispatch).

Workflow Details
1. Build Job
Objective: Builds the Maven project.
Actions:
Checkout the code from the repository.
Setup JDK 17.
Build the Maven project using mvn clean package.
Upload the built JAR artifact for later use.
2. Snyk Security Scanning Job
Objective: Scan the project for vulnerabilities in the code and dependencies.
Actions:
Checkout the code.
Install the Snyk CLI.
Authenticate with Snyk using a token.
Run a Snyk SAST (Static Application Security Testing) scan.
Run a Snyk SCA (Software Composition Analysis) scan for vulnerabilities in dependencies.
3. Build and Push Docker Image
Objective: Build a Docker image for the application and push it to Docker Hub.
Actions:
Download the previously built JAR file.
Build the Docker image.
Tag the image with the latest commit hash.
Login to Docker Hub using credentials stored in GitHub Secrets.
Push the Docker image to Docker Hub.
4. Deploy to EC2
Objective: Deploy the Docker image to an AWS EC2 instance.
Actions:
Set up SSH for accessing the EC2 instance securely.
SSH into the EC2 instance and pull the Docker image.
Deploy the application on the EC2 instance.
5. Trivy Vulnerability Scan
Objective: Run a vulnerability scan using Trivy for the Docker image built during the pipeline.
Actions:
Build the Docker image.
Run Trivy vulnerability scanner on the Docker image to check for security issues.
Upload the scan results to GitHub Security tab.
Requirements
GitHub Secrets: Ensure the following secrets are added to the repository’s GitHub Secrets:
SNYK_TOKEN - Your Snyk token for authentication.
DOCKER_USERNAME - Docker Hub username.
DOCKER_PASSWORD - Docker Hub password.
EC2_SSH_KEY - Your private SSH key for accessing EC2.
SONAR_TOKEN - Your SonarQube token for running the SonarQube scan.
Tools Used
Maven: Used for building and packaging the Java application.
Snyk: For performing static code analysis (SAST) and software composition analysis (SCA).
Docker: For containerizing the application.
AWS EC2: For deploying the Dockerized application.
Trivy: For vulnerability scanning in the Docker image.
SonarQube: For continuous inspection of code quality and security vulnerabilities.
