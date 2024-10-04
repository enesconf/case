# SonarQube Deployment on Minikube

This project provides an automated deployment of SonarQube and a separate PostgreSQL database using Terraform on Minikube. The deployment is managed via Helm charts, ensuring a modular and smooth setup and configuration process.

## Table of Contents

- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Deployment Instructions](#deployment-instructions)
- [Accessing SonarQube](#accessing-sonarqube)
- [Viewing Secrets](#viewing-secrets)
- [Contributing](#contributing)
- [License](#license)

## Project Structure

```plaintext
.
├── terraform-minikube/           # Directory for Terraform configuration
│   ├── modules/                  # Contains separate modules for PostgreSQL and SonarQube
│   │   ├── postgresql/           # PostgreSQL module
│   │   │   ├── main.tf           # Main Terraform configuration for PostgreSQL
│   │   │   ├── variables.tf      # Variables for PostgreSQL module
│   │   │   └── outputs.tf        # Outputs for PostgreSQL module
│   │   └── sonarqube/            # SonarQube module
│   │       ├── main.tf           # Main Terraform configuration for SonarQube
│   │       ├── variables.tf      # Variables for SonarQube module
│   │       └── outputs.tf        # Outputs for SonarQube module
│   ├── main.tf                   # Root Terraform configuration file
│   ├── variables.tf              # Root Terraform variable definitions
│   └── outputs.tf                # Root Terraform output definitions
└── setup-sonarqube.sh            # Shell script to deploy SonarQube and PostgreSQL
```

## Prerequisites

Before you begin, ensure you have the following installed:

- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [Terraform](https://www.terraform.io/downloads.html)
- [Helm](https://helm.sh/docs/intro/install/)

## Deployment Instructions

1. **Start Minikube**: Ensure your Minikube cluster is running with sufficient resources.

   ```bash
   minikube start --memory 4096 --cpus 2
   ```

2. **Clone the Repository**: Clone the repository containing the Terraform configuration.

   ```bash
   git clone https://github.com/enesconf/case.git
   cd terraform-minikube
   ```

3. **Run the Deployment Script**: Execute the provided shell script to set up SonarQube and PostgreSQL. This script will manage the entire deployment process, including configuring the database separately.

   ```bash
   chmod +x setup-sonarqube.sh
   ./setup-sonarqube.sh
   ```

   - This script initializes Terraform, applies the configurations, and sets up the necessary resources.

4. **Modular Architecture**: The project is structured in a modular way, with separate modules for PostgreSQL and SonarQube, allowing for easier management and updates in the future.

## Accessing SonarQube

Once the deployment is complete, set up port forwarding to access the SonarQube dashboard:

```bash
kubectl port-forward svc/my-sonarqube 80:9000
```

You can then access SonarQube at:

```plaintext
http://localhost:9000
```

## Viewing Secrets

To view the Sonarqube password or any other secrets created during the deployment, you can use the following command:

```bash
kubectl get secret my-sonarqube -o jsonpath="{.data.sonarqube-password}" | base64 --decode
```

This will output the SonarQube password in plain text.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request if you have improvements or suggestions.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
