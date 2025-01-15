# IDN News Static Website Deployment

Welcome to the IDN News Static Website Deployment project! 🚀 This project demonstrates the creation of a static site hosted on AWS S3, integrated with CloudFront for content delivery, Route 53 for DNS management, and deployed using Terraform as the Infrastructure as Code (IaC) tool. Additionally, a GitHub Actions pipeline is set up to automate deployment whenever changes are made. 🎉

---

## Case Study Overview 📋

1. **Static Site Creation**:
   - Subdomain: `new-timmy-7.serverless.my.id`
   - Hosted using an AWS S3 bucket.
   - Located in the **`ap-southeast-1`** region.

2. **Infrastructure as Code (IaC)**:
   - The entire infrastructure is deployed using **Terraform**.

3. **CI/CD Pipeline**:
   - A GitHub Actions pipeline is configured to automatically deploy changes to AWS services.

---

## Project Structure 🗂️

The project is organized into two main folders:

### 1. `terraform/`
This folder contains the Terraform configuration files for setting up the AWS infrastructure:

- **`cloudfront_distribution/`**: Manages the CloudFront distribution for caching and secure delivery.
- **`route53/`**: Configures DNS records for the `new-timmy-7.serverless.my.id` subdomain.
- **`s3/`**: Provisions the S3 buckets for hosting the static website and error handling.

### 2. `web/`
This folder contains the static website files:

- **`index.html`**: The homepage of the IDN News site.
- **`error.html`**: Custom error page displayed for invalid or missing routes.
- **`news.html`**: A secondary page showcasing the latest news articles.

---

## How It Works 💡

### Static Website Hosting
1. **AWS S3**:
   - Two S3 buckets are created:
     - One for hosting the static website.
     - Another for error handling and asset storage.

2. **CloudFront**:
   - Configured to serve the website and assets securely with caching for improved performance.

3. **Route 53**:
   - Manages DNS records for the subdomain `new-timmy-7.serverless.my.id`.

### CI/CD Pipeline
A GitHub Actions pipeline is configured to:

1. Check for changes in the repository.
2. Deploy updated files to S3 buckets.
3. Update CloudFront and Route 53 configurations as needed.

---

## Deployment Instructions 📦

### Prerequisites
- AWS CLI installed and configured.
- Terraform installed.
- GitHub repository with write access.

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/idn-news-site.git
   ```
2. Navigate to the `terraform/` directory:
   ```bash
   cd terraform
   ```
3. Initialize Terraform:
   ```bash
   terraform init
   ```
4. Apply the Terraform configuration:
   ```bash
   terraform apply
   ```
5. Verify the deployment:
   - Access the subdomain: [new-timmy-7.serverless.my.id](http://new-timmy-7.serverless.my.id).

---

## Features ✨
- **Responsive Design**: The website adjusts beautifully across devices.
- **Custom Error Handling**: Displays a friendly error page for invalid routes.
- **Automated Deployments**: Changes are automatically deployed via GitHub Actions.

---

## Future Enhancements 🔮
- Add support for additional pages and features.
- Enhance CI/CD pipeline with testing workflows.
- Optimize caching policies for better performance.
- Integrate with Terragrunt for modular and reusable infrastructure configurations if additional IAM roles become accessible.

---

## Author ✍️
Developed with ❤️ by **Lendy Pradhana**. If you have questions or suggestions, feel free to reach out! 😊