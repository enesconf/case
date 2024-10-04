#!/bin/bash
minikube start --memory 6096 --cpus 4


echo "Initializing Terraform..."
terraform init


echo "loading..."
terraform apply -auto-approve > /dev/null 2>&1

echo "Terraform apply completed."


echo "Setting up port forwarding for SonarQube..."
echo "Run the following command in a new terminal:"
echo "kubectl port-forward svc/my-sonarqube 9000:80"


echo "To view the Sonarqube secret, run:"
SONARQUBE_PASSWORD=$(kubectl get secret my-sonarqube -o jsonpath="{.data.sonarqube-password}" | base64 --decode)
echo "SonarQube Password: $SONARQUBE_PASSWORD"

echo "Setup completed!"