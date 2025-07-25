# ✂️ ClearCut

**ClearCut** is a full-stack AI-powered web application that removes image backgrounds and lets users download the output — all wrapped in a robust DevSecOps pipeline featuring CI/CD, security scanning, containerization, GitOps deployment, and monitoring.

---

## 🖼️ App Preview

<img src="https://raw.githubusercontent.com/Debjyoti2004/ClearCut/master/assets/Home-page.png" width="850" alt="ClearCut UI Preview" />

---

## 🧩 Architecture Overview

ClearCut is built with a **DevSecOps-first mindset**, ensuring secure, automated builds and deployments with visibility and control at every step.

<img src="https://raw.githubusercontent.com/Debjyoti2004/ClearCut/master/assets/Ci-CD-Architecture.gif" width="850" alt="CI/CD DevSecOps Pipeline" />

---

## 🚀 Features

- ✨ **AI-Powered Background Removal**
- 🖼️ Upload and preview images (PNG, JPG, etc.)
- ⚡ Fast and efficient processing
- 📥 One-click download of transparent images
- 🔐 Secure, automated CI/CD pipeline
- 🧪 Integrated scanning with **Trivy**, **OWASP**, and **SonarQube**
- 🚀 Dockerized and deployed using **ArgoCD + Kubernetes**
- 📊 Full observability with **Grafana + Prometheus**
- 📬 Gmail notifications on production deployments

---

## 🧠 Tech Stack

### 🛠️ Development

- **Frontend:** Vite / React / JavaScript / HTML / CSS
- **Backend:** Node.js / Express
- **Database:** MongoDB
- **Image Processing API:** ClipDrop
- **Authentication:** Clerk.dev

### ⚙️ DevOps & Infrastructure

- **CI/CD:** Jenkins (CI + CD Pipelines)
- **Security Scans:** Trivy, OWASP Dependency Check
- **Code Quality:** SonarQube
- **Containerization:** Docker
- **GitOps Deployment:** ArgoCD + Kubernetes (AWS EKS)
- **Infrastructure as Code:** Terraform, Helm
- **Monitoring (Helm) & Alerts:** Prometheus, Grafana, Gmail

---
## 🧑‍💻 Local Development

### 🧪Environment Variables Setup

Create the following `.env` files before starting the app:

### 📦 Backend: `backend/.env`
```env
MONGODB_URI = <YOUR MONGODB URI>
CLERK_WEBHOOK_SECRET = <YOUR CLERK WEBHOOK SECREL>
CLIPDROP_API = <YOUR CLIPDROP_API>
```
### 🎨 Frontend: `frontend/.env`
```env
VITE_CLERK_PUBLISHABLE_KEY= <YOUR CLERK PUBLISHABLE KEY>
VITE_BACKEND_URL = <YOUR BACKEND URL>
```

### 🔁 Clone the Repo
```bash
git clone https://github.com/Debjyoti2004/ClearCut.git
cd ClearCut
```

### 📦 Install Dependencies
```sh
npm install
```
## ▶️ Run Frontend & Backend (Dev Mode)
```sh
npm run dev
```
## 🐳 Run Using Docker Compose
```sh
docker-compose -up
```
Make sure Docker is installed and running.

---
## ⚙️ From Here, DevOps Takes Over 🚀

Once the app is developed and tested locally, the automated DevSecOps pipeline takes over to ensure quality, security, and smooth deployment.

### 🔐 CI/CD + GitOps Workflow:

1. ✅ **Code Commit:** Developer pushes code to GitHub.
2. ⚙️ **Jenkins CI:** Triggers automated build and testing pipeline.
   - Runs dependency checks (OWASP)
   - Scans vulnerabilities (Trivy)
   - Code quality analysis (SonarQube)
3. 🐳 **Docker:** Builds and pushes Docker image to registry.
4. 🔁 **Jenkins CD:** Updates version and triggers deployment.
5. 📦 **ArgoCD:** Pulls new version and deploys to Kubernetes.
6. 🧠 **Monitoring:** Prometheus + Grafana monitor live performance.
7. 📬 **Notifications:** Gmail alerts are sent post-deployment.

All steps are automated and version-controlled, ensuring production-ready, secure deployments with zero manual intervention.

---
## 🧬 CI/CD Pipeline Overview (Post-Deployment)

### 🔨 CI Pipeline – Build & Push Stage

The CI pipeline is triggered when code is pushed to GitHub. It builds the project, performs security scans, and pushes the Docker image to the container registry.

![CI Build Stage](https://raw.githubusercontent.com/Debjyoti2004/ClearCut/master/assets/ClearCut-CI-build.png)

---

### 🚀 CD Pipeline – Update Application Version

The CD pipeline pulls the latest Docker image, updates the version in GitHub, and triggers ArgoCD to deploy the application to the Kubernetes cluster.

![CD Build Stage](https://raw.githubusercontent.com/Debjyoti2004/ClearCut/master/assets/ClearCut-CD.png)

---

## ☁️ Infrastructure Setup with Terraform on AWS

### 🔑 Step 1: Create an SSH Key Pair

```bash
ssh-keygen -f ClearCut-key
```
This will generate ClearCut-key and ClearCut-key.pub. You'll use this to access your AWS EC2 instance.

### 🌱 Initialize Terraform 
```sh
terrafrom init
terrafrom plan
terrafrom apply
```
After applying, Terraform will create:

1 EC2 instance (Ubuntu) in us-east-1 region  
Instance type: t2.large (2 vCPU, 8 GB RAM)  
Storage: 29 GB SSD

![Before-file-permission-change](https://raw.githubusercontent.com/Debjyoti2004/ClearCut/master/assets/All-the-secrityGroup-port.png)

### 🔗 Connect to the EC2 Instance
```sh
ssh -i ClearCut-key ubuntu@<EC2_PUBLIC_IP>
```
## 🛠️ Initial Server Setup

### 🔄 Update Package Index (for Ubuntu)
```sh
sudo apt-get update -y
```
## 📂 Clone the Repository & Prepare Automation Scripts

### 📥 Clone the Repo Inside Your EC2 Instance
```sh 
git clone https://github.com/Debjyoti2004/ClearCut.git
cd ClearCut/scripts

```
## 🔐 Script Permissions & Execution

### 🧾 Before Changing Permissions
Here’s how the files look before applying execution permissions:

![Before-file-permission-change](https://raw.githubusercontent.com/Debjyoti2004/ClearCut/master/assets/Before-file-permission-change.png)

### ✅ Apply Permissions & Run Automation Script 
```sh
chmod +x permissionexecute.sh
./permissionexecute.sh
```
This script grants executable permissions to all necessary setup scripts in the folder.
### 🔓 After Changing Permissions
You’ll see that all scripts now have executable permission:

![After-file-permission](https://raw.githubusercontent.com/Debjyoti2004/ClearCut/master/assets/After-file-permission.png)

---

## 🐳 Installing Docker & SonarQube

Let's begin by installing our very first DevOps tool: **Docker**.  
All necessary steps are scripted inside the `docker.sh` file — including the setup for **SonarQube** using Docker.

## 🚀 Run the Docker setup script:

```bash
./docker.sh
```

### ✅ Post-Installation (Important Step):
To run Docker without using sudo every time:
```sh
sudo usermod -aG docker $USER && newgrp docker

```
### 🌐 Access SonarQube in Your Browser:
```sh 
http://<EC2_PUBLIC_IP>:9000
```
## ⚙️ Installing Jenkins
Once Docker is up and running, install Jenkins using the provided script.
### ▶️ Run the Jenkins setup script:
```sh 
./jenkins.sh
```

### 🌐 Access Jenkins in Your Browser:
```sh 
http://<EC2_PUBLIC_IP>:8080
```
Tip: If the page doesn't load immediately, give it a minute or two — Jenkins takes some time on the first startup.

## ☁️ AWS & Kubernetes CLI Setup

Before provisioning the EKS cluster and node groups, we need to configure some AWS tools and credentials.

---

### 🔑 Create a Key Pair for EKS Node Group

This key pair will be used later to access nodes provisioned inside your EKS cluster.

![Create-keypair-eks](https://raw.githubusercontent.com/Debjyoti2004/ClearCut/master/assets/Create-keypair-eks.png)

---

### 🔐 Create IAM User with Full Access

- Go to the AWS Console → IAM → Create a user with **programmatic access**
- Attach the **AdministratorAccess** policy
- Download and store the **Access Key ID** and **Secret Access Key** securely  
  (You'll use them to configure the AWS CLI)

---

### 🛠️ Install AWS CLI

```bash
./awscli.sh
 ```
### ⚙️ Configure AWS CLI 
 ```sh
aws configure
 ```
Provide the following when prompted:

AWS Access Key ID [None]: <YOUR_ACCESS_KEY_ID>
AWS Secret Access Key [None]: <YOUR_SECRET_ACCESS_KEY>
Default region name [None]: us-east-1
Default output format [None]: json

 ## 🧰 Kubernetes CLI Tools Setup
 ### 📦 Install kubectl
 ```sh
./kubectl.sh
 ```
 ### 📦 Install eksctl
 ```sh
 ./eksctl.sh
 ```
---

## ☸️ Provisioning Amazon EKS Cluster & Node Group

Once your AWS CLI, `kubectl`, and `eksctl` are installed and configured, you can create your EKS cluster and attach a node group.

---

### 🚀 Create the EKS Cluster (Without Node Group)

```bash
eksctl create cluster --name=ClearCut \
                      --region=us-east-1 \
                      --version=1.30 \
                      --without-nodegroup
```
This command will create an empty EKS control plane named ClearCut in us-east-1 without any worker nodes.

### 🔗 Associate IAM OIDC Provider
OIDC is required for fine-grained IAM roles and service account integration with tools like ArgoCD, ALB Ingress Controller, etc.
```sh 
eksctl utils associate-iam-oidc-provider \
  --region us-east-1 \
  --cluster ClearCut \
  --approve
```
#### 🧱 Create the EKS Node Group
This will provision 2 EC2 instances (t2.large) and attach them to the ClearCut cluster.
```sh 
eksctl create nodegroup --cluster=ClearCut \
                     --region=us-east-1 \
                     --name=ClearCut \
                     --node-type=t2.large \
                     --nodes=2 \
                     --nodes-min=2 \
                     --nodes-max=2 \
                     --node-volume-size=29 \
                     --ssh-access \
                     --ssh-public-key=eks-nodegroup-key 
````
⚠️ Ensure you've created the key pair named eks-nodegroup-key in AWS EC2 → Key Pairs before running this command.

## Your EKS cluster and node group should now be ready!
### 👇🏻 verify nodes using:
```sh 
kubectl get nodes
```