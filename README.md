# 🔍 GAUTAM NMAP PRO - Professional Network Security Scanner

> **Advanced Network Scanning Tool with Automated HTML Reports & Bootstrap Dashboard**

Analyzing network security, identifying open ports, detecting services, and generating professional reports using Nmap, Bash, and HTML/CSS.

---

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
## 🚀 Features

### 🔥 Core Scanning Capabilities

| # | Feature | Description |
|---|---------|-------------|
| 1 | **Changeable Target** | Scan any IP address, domain, or IP range in real-time |
| 2 | **Basic Ping Scan** | Check if host is alive on the network (ICMP echo) |
| 3 | **Common Ports Scan** | Scan 20,21,22,23,25,53,80,443,8080 |
| 4 | **Top 10 Ports Scan** | Scan most common vulnerable ports |
| 5 | **HTTP/HTTPS Check** | Web server detection & header analysis |
| 6 | **Service Version Detection** | Identify running services with version numbers |
| 7 | **OS Detection** | Operating system fingerprinting (TTL, TCP/IP stack) |
| 8 | **Script Scan (NSE)** | Run safe Nmap scripts for vulnerability detection |
| 9 | **Custom Port Range** | User-defined port ranges (e.g., 1-1000, 80,443) |
| 10 | **All-in-One Scan** | Comprehensive scan combining all scans (3-5 mins) |

---

### 📊 Reporting & Visualization Features

| # | Feature | Description |
|---|---------|-------------|
| 1 | **Professional HTML Reports** | Auto-generated with dark theme and modern design |
| 2 | **Bootstrap Dashboard** | Interactive, responsive, and mobile-friendly UI |
| 3 | **CSV Export** | Download scan results as CSV for analysis |
| 4 | **JSON Export** | Download scan results as JSON for API integration |
| 5 | **Print Ready** | Print-friendly report format |
| 6 | **Search & Filter** | DataTables integration for easy searching and sorting |
| 7 | **Real-time Status** | Live host status indicators (🟢 Alive / 🔴 Down) |
| 8 | **Color-coded Status** | Open (🟢), Closed (🔴), Filtered (🟡) |

---

### 🛡️ Security & Management Features

| # | Feature | Description |
|---|---------|-------------|
| 1 | **Logging System** | All activities logged with timestamps |
| 2 | **Results Management** | View, delete, and manage scan results |
| 3 | **Target Information** | Display detailed target info (IP, hostname, status) |
| 4 | **Legal Disclaimer** | Built-in disclaimer for educational use |
| 5 | **Cross-Platform** | Works on Kali Linux, Ubuntu, and Termux (Android) |
| 6 | **One-Click Setup** | Automated installation script |

---

### 💡 Advanced Features (Coming Soon)

| # | Feature | Status |
|---|---------|--------|
| 1 | **Email Reports** | 📅 Planned |
| 2 | **Database Storage** | 📅 Planned |
| 3 | **Vulnerability Scanning** | 📅 Planned |
| 4 | **Multi-Target Scanning** | 📅 Planned |
| 5 | **Real-time Alerts** | 📅 Planned |
| 6 | **PDF Export** | 📅 Planned |

---

### 🎯 Why Choose GAUTAM NMAP PRO?

| Benefit | Description |
|---------|-------------|
| ✅ **Beginner Friendly** | Simple menu-driven interface |
| ✅ **Professional Output** | HTML reports with Bootstrap UI |
| ✅ **Time Saving** | All-in-One scan option |
| ✅ **Educational** | Learn network security concepts |
| ✅ **Customizable** | Flexible port range and scan types |
| ✅ **Open Source** | MIT License - Free to use and modify |

---

### 📸 Feature Preview

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

## 📁 Project Structure

- [Project Structure](#project-structure)
- [Installation](#installation)

### Scan Results Include:

- **Open Ports** - Which ports are accessible on the target
- **Service Names** - What services are running on each port
- **Version Numbers** - Service version details for vulnerability assessment
- **OS Information** - Operating system fingerprinting and detection
- **Script Outputs** - NSE script findings and additional information
- **HTTP Headers** - Web server headers and response information
- **SSL/TLS Info** - Certificate details and encryption information

---

## 🚀 Installation

### For Kali Linux / Ubuntu / Debian

```bash
# Step 1: Clone the repository
git clone https://github.com/gautam705074/gautam-nmap-pro.git

# Step 2: Navigate to project directory
cd gautam-nmap-pro

# Step 3: Make scripts executable
chmod +x install.sh gautam_nmap.sh

# Step 4: Run installation script
./install.sh

# Step 5: Run the main tool
./gautam_nmap.sh
- [How to Run This Project](#how-to-run-this-project)
- [Scan Types](#scan-types)
- [Dashboard & Reports](#dashboard--reports)
- [Research Questions & Key Findings](#research-questions--key-findings)
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
