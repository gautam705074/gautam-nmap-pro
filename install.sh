#!/bin/bash

# ==============================================
#   GAUTAM NMAP PRO - Installation Script
#   Admin: Gautam Kumar
# ==============================================

G='\033[0;32m'
Y='\033[1;33m'
W='\033[1;37m'
NC='\033[0m'

echo -e "${G}═══════════════════════════════════════════${NC}"
echo -e "${G}  GAUTAM NMAP PRO - Installation${NC}"
echo -e "${G}═══════════════════════════════════════════${NC}"

# Check Nmap
echo -e "${Y}[*] Checking Nmap...${NC}"
if ! command -v nmap &> /dev/null; then
    echo -e "${Y}[!] Installing Nmap...${NC}"
    sudo apt update -q
    sudo apt install nmap -y -q
fi

# Create directories
echo -e "${Y}[*] Creating directories...${NC}"
mkdir -p logs reports results templates

# Set permissions
echo -e "${Y}[*] Setting permissions...${NC}"
chmod +x gautam_nmap.sh

# Create README
echo -e "${Y}[*] Creating README...${NC}"
cat > README.md << 'EOF'
# GAUTAM NMAP PRO 🔍

## 🚀 Features
- Target Change Option
- 10+ Scan Types
- Automatic HTML Reports
- Professional UI

## 📦 Installation
```bash
./install.sh
