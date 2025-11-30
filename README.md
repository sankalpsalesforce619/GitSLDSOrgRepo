# Salesforce Developer Portfolio & Org Repository

## 👤 Author
**Sankalp Lokhande** Salesforce Developer | PD1 Certified | B.Tech (Electrical Engineering)  
[LinkedIn Profile](https://linkedin.com/in/sankalp08) | [Email Me](mailto:sankalpsalesforce619@gmail.com)

---

## 📖 About This Repository
This repository contains the source code for my Salesforce development projects. It demonstrates my ability to design, develop, and deploy scalable solutions on the Salesforce Platform, reflecting the skills acquired during my internship and PD1 certification journey.

### 🎯 Objective
To showcase practical implementation of **Apex**, **Lightning Web Components (LWC)**, and **Salesforce Design System (SLDS)**.

---

## 🛠️ Key Projects & Features

### 1. Recruitment Management System
* **Overview:** A custom application to streamline the hiring process from application to onboarding.
* **Key Technical Implementations:**
    * **LWC:** Created a custom "Candidate Search" interface utilizing **SLDS** for a native look and feel.
    * **Apex:** Implemented SOQL relationship queries to fetch data across objects efficiently.
    * **Automation:** Apex Triggers handling status automation and email alerts.

### 2. Inventory Tracking Application
* **Overview:** A tool for tracking stock levels and automating reorder requests.
* **Key Technical Implementations:**
    * **Asynchronous Apex:** Implemented **Schedulable Apex** to run nightly checks on low-stock items.
    * **Data Integrity:** Enforced complex logic using Validation Rules and Triggers.
    * **Security:** Implemented Sharing Rules to ensure record-level security compliance.

---

## 💻 Technical Stack

| Category | Skills |
|----------|--------|
| **Development** | Apex (Triggers, Batch, Future, Queueable), SOQL, SOSL |
| **UI Frameworks** | Lightning Web Components (LWC), Visualforce, HTML5, CSS3, JavaScript |
| **Salesforce Tools** | Validation Rules, Flows, Process Builder, Approval Processes |
| **Integration** | REST API, OAuth 2.0 |
| **DevOps** | Git, GitHub, VS Code, Salesforce CLI (SFDX) |

---

## 🚀 How to Deploy (SFDX)

To deploy this code to a Scratch Org or Developer Sandbox:

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/sankalpsalesforce619/GitSLDSOrgRepo.git](https://github.com/sankalpsalesforce619/GitSLDSOrgRepo.git)
    cd GitSLDSOrgRepo
    ```

2.  **Authorize your Org:**
    ```bash
    sfdx force:auth:web:login -a MyDevOrg
    ```

3.  **Deploy Source:**
    ```bash
    sfdx force:source:deploy -p force-app -u MyDevOrg
    ```

---

## 🔒 Security & Best Practices
* **Governor Limits:** Code is optimized to handle bulk data without hitting limits.
* **Security:** Apex classes use `with sharing` to respect user permissions.
* **Testing:** Apex Test classes included with >85% code coverage.

---
*Created by Sankalp Lokhande*
