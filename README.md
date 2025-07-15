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
- **GitOps Deployment:** ArgoCD + Kubernetes
- **Infrastructure as Code:** Terraform, Helm
- **Monitoring & Alerts:** Prometheus, Grafana, Gmail

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
npm install

## ▶️ Run Frontend & Backend (Dev Mode)
npm run dev

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

### Ctrate the private key

```sh
ssh-keygen -f ClearCut-key
```