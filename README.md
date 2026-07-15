# 🔍 GAUTAM NMAP PRO - Professional Network Security Scanner

> **Advanced Network Scanning Tool with Automated HTML Reports & Bootstrap Dashboard**

Analyzing network security, identifying open ports, detecting services, and generating professional reports using Nmap, Bash, and HTML/CSS.

---

## 📋 Table of Contents

---

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Business Problem](#business-problem)
- [Dataset](#dataset)
- [Tools & Technologies](#tools--technologies)
- [Project Structure](#project-structure)
- [Data Cleaning & Preparation](#data-cleaning--preparation)
- [Exploratory Data Analysis (EDA)](#exploratory-data-analysis-eda)
- [Research Questions & Key Findings](#research-questions--key-findings)
- [Dashboard](#dashboard)
- [How to Run This Project](#how-to-run-this-project)
- [Final Recommendations](#final-recommendations)
- [Author & Contact](#author--contact)
- [Disclaimer](#disclaimer)

---

## 🔍 Overview

This project evaluates **network security and vulnerability assessment** through comprehensive port scanning, service detection, and automated report generation. A complete security scanning pipeline was built using:

- **Nmap** for network scanning
- **Bash** for automation
- **HTML/CSS/Bootstrap** for professional reporting
- **Git** for version control

The tool provides **10+ scan types**, **automatic HTML reports**, and an **interactive Bootstrap dashboard** for visualizing security findings.

---

## 🎯 Business Problem

Effective network security management is critical in today's digital landscape. This project aims to:

- ✅ Identify **open ports** and **vulnerable services**
- ✅ Detect **unauthorized services** running on the network
- ✅ Analyze **service versions** for potential exploits
- ✅ Provide **actionable security insights**
- ✅ Generate **professional reports** for stakeholders
- ✅ Statistically validate **security findings**

---

## 📊 Dataset

### Project Files Structure:

- [Overview](#overview)
- [Features](#features)
- [Business Problem](#business-problem)
- [Dataset](#dataset)
- [Tools & Technologies](#tools--technologies)

---

## 🛠️ Tools & Technologies

| Tool/Technology | Purpose |
|-----------------|---------|
| **Bash Scripting** | Main automation and logic |
| **Nmap** | Network scanning engine |
| **HTML/CSS** | Report generation |
| **Bootstrap 5** | Professional UI framework |
| **DataTables** | Interactive tables with search/filter |
| **Font Awesome** | Icons for better UI |
| **Git** | Version control |
| **GitHub** | Repository hosting |

---
gautam-nmap-pro/
│
├── 📄 gautam_nmap.sh # Main scanning script
├── 📄 install.sh # One-click setup script
├── 📄 README.md # Documentation
├── 📄 LICENSE # MIT License
├── 📄 .gitignore # Git ignore file
├── 📄 index.html # Latest HTML report
│
├── 📁 templates/ # HTML templates
│ └── index_template.html # Report template
│
├── 📁 results/ # Scan results (.txt)
│ ├── ping_scan_google.com_20260715.txt
│ ├── common_ports_google.com_20260715.txt
│ └── ...
│
├── 📁 reports/ # HTML reports
│ ├── report_google.com_ping_scan_20260715.html
│ └── ...
│
└── 📁 logs/ # Activity logs
└── scan.log



## 📁 Project Structure

- [Project Structure](#project-structure)
- [Data Cleaning & Preparation](#data-cleaning--preparation)

### Scan Results Include:

- **Open Ports** - Which ports are accessible on the target
- **Service Names** - What services are running on each port
- **Version Numbers** - Service version details for vulnerability assessment
- **OS Information** - Operating system fingerprinting and detection
- **Script Outputs** - NSE script findings and additional information
- **HTTP Headers** - Web server headers and response information
- **SSL/TLS Info** - Certificate details and encryption information

---

## 🧹 Data Cleaning & Preparation

The raw scan data undergoes several cleaning and preparation steps:

- Removed duplicate entries and invalid responses
- Filtered out closed and filtered ports
- Standardized service names and version formats
- Created summary tables with host-level metrics
- Converted data types for analysis
- Handled outliers in service version data
- Merged multiple scan results for comparison

---

## 📊 Exploratory Data Analysis (EDA)

### Key EDA Steps:

1. **Port Distribution Analysis** - Most common open ports
2. **Service Frequency Analysis** - Most commonly running services
3. **Version Analysis** - Distribution of service versions
4. **OS Detection Analysis** - OS distribution across hosts
5. **Correlation Analysis** - Ports and services correlations
6. **Outlier Detection** - Unusual service configurations

### Tools Used:
- **Python (Pandas, Matplotlib, Seaborn)** for analysis
- **Jupyter Notebooks** for interactive exploration
- **Power BI** for visual dashboards

---

## 📈 Research Questions & Key Findings

### Research Questions:

| # | Question | Answer |
|---|----------|--------|
| 1 | What are the most common open ports? | Port 80 (HTTP) and 443 (HTTPS) |
| 2 | Which services are vulnerable? | Outdated versions identified |
| 3 | What OS is running? | OS fingerprinting successful |
| 4 | Are there any web servers? | HTTP/HTTPS detection |
| 5 | What are the security risks? | Open ports & vulnerable services |

### Key Findings:

- ✅ **Open Ports:** Identified critical open ports
- ✅ **Service Versions:** Detected outdated services
- ✅ **OS Detection:** Successfully fingerprinted OS
- ✅ **Web Servers:** Identified running web servers
- ✅ **Security Risks:** Highlighted vulnerable services

---

## 📊 Dashboard

### Power BI Dashboard Shows:

- **Host-wise Port Distribution**
- **Service and Version Analysis**
- **OS Detection Results**
- **Security Risk Heatmaps**
- **Vulnerability Assessment**
- **Open Ports Trend Analysis**

### HTML Dashboard Features:

- **Interactive Tables** with search and filter
- **Visual Statistics** with cards and charts
- **Export Options** (CSV, JSON, Print)
- **Responsive Design** for all devices

---

## 🚀 How to Run This Project

### Step 1: Clone the Repository

```bash
git clone https://github.com/gautam705074/gautam-nmap-pro.git
cd gautam-nmap-pro
- [Exploratory Data Analysis (EDA)](#exploratory-data-analysis-eda)
- [Research Questions & Key Findings](#research-questions--key-findings)
- [Dashboard](#dashboard)
- [How to Run This Project](#how-to-run-this-project)
- [Final Recommendations](#final-recommendations)
- [Author & Contact](#author--contact)
- [Disclaimer](#disclaimer)

---

## 🔍 Overview

This project evaluates **network security and vulnerability assessment** through comprehensive port scanning, service detection, and automated report generation. A complete security scanning pipeline was built using:

- **Nmap** for network scanning
- **Bash** for automation
- **HTML/CSS/Bootstrap** for professional reporting
- **Git** for version control

The tool provides **10+ scan types**, **automatic HTML reports**, and an **interactive Bootstrap dashboard** for visualizing security findings.

---

## 🚀 Features

### Core Scanning Capabilities

| Feature | Description |
|---------|-------------|
| **Changeable Target** | Scan any IP address or domain in real-time |
| **Basic Ping Scan** | Check if host is alive on the network |
| **Common Ports Scan** | Scan 20,21,22,23,25,53,80,443,8080 |
| **Top 10 Ports Scan** | Scan most common vulnerable ports |
| **HTTP/HTTPS Check** | Web server detection & header analysis |
| **Service Version Detection** | Identify running services with versions |
| **OS Detection** | Operating system fingerprinting |
| **Script Scan (NSE)** | Run safe Nmap scripts for vulnerability detection |
| **Custom Port Range** | User-defined port ranges |
| **All-in-One Scan** | Comprehensive scan (3-5 minutes) |

### Reporting Features

| Feature | Description |
|---------|-------------|
| **Professional HTML Reports** | Auto-generated with dark theme |
| **Bootstrap Dashboard** | Interactive, responsive, modern UI |
| **CSV Export** | Download results as CSV |
| **JSON Export** | Download results as JSON |
| **Print Ready** | Print-friendly report format |
| **Search & Filter** | DataTables integration for easy searching |
| **Real-time Status** | Live host status indicators |

---

## 🎯 Business Problem

Effective network security management is critical in today's digital landscape. This project aims to:

- ✅ Identify **open ports** and **vulnerable services**
- ✅ Detect **unauthorized services** running on the network
- ✅ Analyze **service versions** for potential exploits
- ✅ Provide **actionable security insights**
- ✅ Generate **professional reports** for stakeholders
- ✅ Statistically validate **security findings**

---

## 📊 Dataset

### Project Files Structure:

