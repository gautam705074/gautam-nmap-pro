#!/bin/bash

# ==============================================
#    GAUTAM NMAP PRO - Complete Scanner
#    Admin: Gautam Kumar
#    Version: 3.0
#    Feature: Target Change + All Scans
# ==============================================

# =================== COLORS ===================
R='\033[0;31m'
G='\033[0;32m'
Y='\033[1;33m'
B='\033[0;34m'
P='\033[0;35m'
C='\033[0;36m'
W='\033[1;37m'
NC='\033[0m'
BL='\033[1m'

# =================== GLOBAL VARIABLE ===================
CURRENT_TARGET=""

# =================== BANNER ===================
show_banner() {
    clear
    echo -e "${R}╔══════════════════════════════════════════════════════════╗${NC}"
    echo -e "${R}║${NC}  ${C}███╗   ██╗███╗   ███╗ █████╗ ██████╗ ${R}║${NC}"
    echo -e "${R}║${NC}  ${C}████╗  ██║████╗ ████║██╔══██╗██╔══██╗${R}║${NC}"
    echo -e "${R}║${NC}  ${C}██╔██╗ ██║██╔████╔██║███████║██████╔╝${R}║${NC}"
    echo -e "${R}║${NC}  ${C}██║╚██╗██║██║╚██╔╝██║██╔══██║██╔═══╝ ${R}║${NC}"
    echo -e "${R}║${NC}  ${C}██║ ╚████║██║ ╚═╝ ██║██║  ██║██║     ${R}║${NC}"
    echo -e "${R}║${NC}  ${C}╚═╝  ╚═══╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ${R}║${NC}"
    echo -e "${R}║${NC}                                                          ${R}║${NC}"
    echo -e "${R}║${NC}  ${Y}⚡ ADMIN: GAUTAM KUMAR${NC}                          ${R}║${NC}"
    echo -e "${R}║${NC}  ${Y}🔰 VERSION: 3.0${NC}                                ${R}║${NC}"
    echo -e "${R}║${NC}  ${Y}🎯 TARGET: ${W}$CURRENT_TARGET${NC}                    ${R}║${NC}"
    echo -e "${R}║${NC}  ${Y}🔄 FEATURE: ${W}CHANGEABLE TARGET${NC}                ${R}║${NC}"
    echo -e "${R}║${NC}                                                          ${R}║${NC}"
    echo -e "${R}║${NC}  ${W}⚠ gautam kumar only use for ligal purpose${NC}     ${R}║${NC}"
    echo -e "${R}╚══════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

# =================== CHECK NMAP ===================
check_nmap() {
    echo -e "${Y}[*] Checking Nmap installation...${NC}"
    if ! command -v nmap &> /dev/null; then
        echo -e "${Y}[!] Nmap not found. Installing...${NC}"
        sudo apt update -q
        sudo apt install nmap -y -q
        echo -e "${G}[✓] Nmap installed successfully!${NC}"
    else
        echo -e "${G}[✓] Nmap is installed!${NC}"
    fi
    sleep 1
}

# =================== SET TARGET ===================
set_target() {
    echo -e "${Y}═══════════════════════════════════════════${NC}"
    echo -e "${B}🎯 CHANGE TARGET${NC}"
    echo -e "${Y}═══════════════════════════════════════════${NC}"
    echo -e "${W}Current Target: ${G}$CURRENT_TARGET${NC}"
    echo -e "${W}Current Target IP: ${G}$(dig +short $CURRENT_TARGET 2>/dev/null | head -1)${NC}"
    echo ""
    echo -e "${Y}📌 Examples:${NC}"
    echo -e "${W}  - Domain: ${G}google.com${NC}"
    echo -e "${W}  - IP: ${G}192.168.1.1${NC}"
    echo -e "${W}  - Range: ${G}192.168.1.0/24${NC}"
    echo ""
    read -p "$(echo -e ${G}"Enter new target: "${NC})" new_target
    
    if [ -z "$new_target" ]; then
        echo -e "${R}[!] Target cannot be empty!${NC}"
        sleep 1
        return
    fi
    
    CURRENT_TARGET="$new_target"
    echo -e "${G}═══════════════════════════════════════════${NC}"
    echo -e "${G}[✓] Target changed successfully!${NC}"
    echo -e "${G}[✓] New Target: ${W}$CURRENT_TARGET${NC}"
    
    # Show IP if domain
    IP=$(dig +short $CURRENT_TARGET 2>/dev/null | head -1)
    if [ ! -z "$IP" ]; then
        echo -e "${G}[✓] IP Address: ${W}$IP${NC}"
    fi
    
    # Check if alive
    if ping -c 1 -W 2 $CURRENT_TARGET &> /dev/null 2>&1; then
        echo -e "${G}[✓] Host is ${W}ALIVE${NC}"
    else
        echo -e "${R}[✗] Host is ${W}DOWN${NC}"
    fi
    echo -e "${G}═══════════════════════════════════════════${NC}"
    sleep 2
}

# =================== SCAN 1: BASIC PING SCAN ===================
basic_ping() {
    target=$1
    echo -e "${C}[+] BASIC PING SCAN${NC}"
    echo -e "${Y}[*] Checking if $target is alive...${NC}"
    
    mkdir -p results
    
    {
        echo "=========================================="
        echo "   GAUTAM NMAP PRO - BASIC PING SCAN"
        echo "=========================================="
        echo "Target: $target"
        echo "Date: $(date)"
        echo "=========================================="
        echo ""
        echo "[*] Ping Check:"
        echo ""
        ping -c 4 $target 2>&1
        echo ""
        echo "[*] Nmap Ping Sweep:"
        echo ""
        nmap -sn $target 2>&1
    } > results/ping_$target.txt
    
    echo -e "${G}[✓] Ping scan complete!${NC}"
    echo -e "${G}[✓] Results saved: results/ping_$target.txt${NC}"
    
    # Show live status
    if ping -c 1 -W 2 $target &> /dev/null; then
        echo -e "${G}[✓] Host is ALIVE!${NC}"
    else
        echo -e "${R}[✗] Host is DOWN!${NC}"
    fi
}

# =================== SCAN 2: COMMON PORTS ===================
common_ports() {
    target=$1
    echo -e "${C}[+] COMMON PORTS SCAN${NC}"
    echo -e "${Y}[*] Scanning: 20,21,22,23,25,53,80,443,8080${NC}"
    
    mkdir -p results
    
    {
        echo "=========================================="
        echo "   GAUTAM NMAP PRO - COMMON PORTS"
        echo "=========================================="
        echo "Target: $target"
        echo "Date: $(date)"
        echo "=========================================="
        echo ""
        echo "[*] Common Ports Scan:"
        echo ""
        nmap -p 20,21,22,23,25,53,80,443,8080 $target 2>&1
        echo ""
        echo "[*] Service Detection:"
        echo ""
        nmap -sV -p 20,21,22,23,25,53,80,443,8080 $target 2>&1
    } > results/common_ports_$target.txt
    
    echo -e "${G}[✓] Common ports scan complete!${NC}"
    echo -e "${G}[✓] Results saved: results/common_ports_$target.txt${NC}"
    
    echo ""
    echo -e "${Y}===== OPEN PORTS =====${NC}"
    nmap -p 20,21,22,23,25,53,80,443,8080 $target 2>&1 | grep -E "^[0-9]" | grep open || echo "No open ports found"
}

# =================== SCAN 3: TOP 10 PORTS ===================
top_ports() {
    target=$1
    echo -e "${C}[+] TOP 10 PORTS SCAN${NC}"
    echo -e "${Y}[*] Scanning top 10 ports...${NC}"
    
    mkdir -p results
    
    {
        echo "=========================================="
        echo "   GAUTAM NMAP PRO - TOP 10 PORTS"
        echo "=========================================="
        echo "Target: $target"
        echo "Date: $(date)"
        echo "=========================================="
        echo ""
        echo "[*] Top 10 Ports:"
        echo ""
        nmap --top-ports 10 $target 2>&1
        echo ""
        echo "[*] With Service Info:"
        echo ""
        nmap -sV --top-ports 10 $target 2>&1
    } > results/top10_$target.txt
    
    echo -e "${G}[✓] Top 10 ports scan complete!${NC}"
    echo -e "${G}[✓] Results saved: results/top10_$target.txt${NC}"
    
    echo ""
    echo -e "${Y}===== OPEN PORTS =====${NC}"
    nmap --top-ports 10 $target 2>&1 | grep -E "^[0-9]" | grep open || echo "No open ports found"
}

# =================== SCAN 4: HTTP/HTTPS CHECK ===================
http_check() {
    target=$1
    echo -e "${C}[+] HTTP/HTTPS CHECK${NC}"
    echo -e "${Y}[*] Checking web services...${NC}"
    
    mkdir -p results
    
    {
        echo "=========================================="
        echo "   GAUTAM NMAP PRO - HTTP CHECK"
        echo "=========================================="
        echo "Target: $target"
        echo "Date: $(date)"
        echo "=========================================="
        echo ""
        echo "[*] HTTP Port 80:"
        echo ""
        nmap -p 80 -sV --script http-headers $target 2>&1
        echo ""
        echo "[*] HTTPS Port 443:"
        echo ""
        nmap -p 443 -sV --script http-headers $target 2>&1
        echo ""
        echo "[*] Web Server Info:"
        echo ""
        nmap -p 80,443 --script http-server-header $target 2>&1
    } > results/http_check_$target.txt
    
    echo -e "${G}[✓] HTTP check complete!${NC}"
    echo -e "${G}[✓] Results saved: results/http_check_$target.txt${NC}"
}

# =================== SCAN 5: SERVICE VERSION ===================
service_version() {
    target=$1
    echo -e "${C}[+] SERVICE VERSION DETECTION${NC}"
    echo -e "${Y}[*] Detecting service versions...${NC}"
    
    mkdir -p results
    
    {
        echo "=========================================="
        echo "   GAUTAM NMAP PRO - SERVICE VERSION"
        echo "=========================================="
        echo "Target: $target"
        echo "Date: $(date)"
        echo "=========================================="
        echo ""
        echo "[*] Service Version Scan:"
        echo ""
        nmap -sV --top-ports 20 $target 2>&1
        echo ""
        echo "[*] Detailed Version Info:"
        echo ""
        nmap -sV --version-intensity 7 --top-ports 20 $target 2>&1
    } > results/service_version_$target.txt
    
    echo -e "${G}[✓] Service version scan complete!${NC}"
    echo -e "${G}[✓] Results saved: results/service_version_$target.txt${NC}"
}

# =================== SCAN 6: OS DETECTION ===================
os_detection() {
    target=$1
    echo -e "${C}[+] OS DETECTION${NC}"
    echo -e "${Y}[*] Detecting operating system...${NC}"
    
    mkdir -p results
    
    {
        echo "=========================================="
        echo "   GAUTAM NMAP PRO - OS DETECTION"
        echo "=========================================="
        echo "Target: $target"
        echo "Date: $(date)"
        echo "=========================================="
        echo ""
        echo "[*] OS Detection:"
        echo ""
        nmap -O $target 2>&1
        echo ""
        echo "[*] OS + Services:"
        echo ""
        nmap -O -sV --top-ports 10 $target 2>&1
    } > results/os_detection_$target.txt
    
    echo -e "${G}[✓] OS detection complete!${NC}"
    echo -e "${G}[✓] Results saved: results/os_detection_$target.txt${NC}"
}

# =================== SCAN 7: SCRIPT SCAN ===================
script_scan() {
    target=$1
    echo -e "${C}[+] SCRIPT SCAN${NC}"
    echo -e "${Y}[*] Running safe scripts...${NC}"
    
    mkdir -p results
    
    {
        echo "=========================================="
        echo "   GAUTAM NMAP PRO - SCRIPT SCAN"
        echo "=========================================="
        echo "Target: $target"
        echo "Date: $(date)"
        echo "=========================================="
        echo ""
        echo "[*] Default Scripts:"
        echo ""
        nmap -sC --top-ports 10 $target 2>&1
        echo ""
        echo "[*] Discovery Scripts:"
        echo ""
        nmap --script discovery --top-ports 10 $target 2>&1
    } > results/script_scan_$target.txt
    
    echo -e "${G}[✓] Script scan complete!${NC}"
    echo -e "${G}[✓] Results saved: results/script_scan_$target.txt${NC}"
}

# =================== SCAN 8: CUSTOM PORT RANGE ===================
port_range() {
    target=$1
    echo -e "${C}[+] CUSTOM PORT RANGE SCAN${NC}"
    echo -e "${Y}[*] Enter port range (e.g., 1-1000 or 80,443,8080)${NC}"
    read -p "Ports: " ports
    
    if [ -z "$ports" ]; then
        echo -e "${R}[!] Ports cannot be empty!${NC}"
        return
    fi
    
    mkdir -p results
    
    {
        echo "=========================================="
        echo "   GAUTAM NMAP PRO - PORT RANGE SCAN"
        echo "=========================================="
        echo "Target: $target"
        echo "Ports: $ports"
        echo "Date: $(date)"
        echo "=========================================="
        echo ""
        echo "[*] Scanning ports: $ports"
        echo ""
        nmap -p $ports $target 2>&1
        echo ""
        echo "[*] Service Detection:"
        echo ""
        nmap -sV -p $ports $target 2>&1
    } > results/port_range_$target.txt
    
    echo -e "${G}[✓] Port range scan complete!${NC}"
    echo -e "${G}[✓] Results saved: results/port_range_$target.txt${NC}"
}

# =================== SCAN 9: ALL IN ONE ===================
all_in_one() {
    target=$1
    echo -e "${C}[+] ALL IN ONE SCAN${NC}"
    echo -e "${Y}[!] This will run all scans (may take 3-5 minutes)${NC}"
    read -p "Continue? (y/n): " confirm
    
    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
        echo -e "${Y}[!] Cancelled${NC}"
        return
    fi
    
    mkdir -p results
    
    {
        echo "=========================================="
        echo "   GAUTAM NMAP PRO - ALL IN ONE SCAN"
        echo "=========================================="
        echo "Target: $target"
        echo "Date: $(date)"
        echo "=========================================="
        echo ""
        echo "========== 1. PING SCAN =========="
        echo ""
        nmap -sn $target 2>&1
        echo ""
        echo "========== 2. COMMON PORTS =========="
        echo ""
        nmap -p 20,21,22,23,25,53,80,443,8080 $target 2>&1
        echo ""
        echo "========== 3. TOP 10 PORTS =========="
        echo ""
        nmap --top-ports 10 -sV $target 2>&1
        echo ""
        echo "========== 4. HTTP CHECK =========="
        echo ""
        nmap -p 80,443 --script http-headers $target 2>&1
        echo ""
        echo "========== 5. SERVICE VERSION =========="
        echo ""
        nmap -sV --top-ports 20 $target 2>&1
        echo ""
        echo "========== 6. OS DETECTION =========="
        echo ""
        nmap -O $target 2>&1
        echo ""
        echo "========== 7. SCRIPT SCAN =========="
        echo ""
        nmap -sC --top-ports 10 $target 2>&1
        echo ""
        echo "=========================================="
        echo "   ALL SCANS COMPLETE"
        echo "=========================================="
    } > results/all_in_one_$target.txt
    
    echo -e "${G}[✓] All-in-one scan complete!${NC}"
    echo -e "${G}[✓] Results saved: results/all_in_one_$target.txt${NC}"
}

# =================== VIEW RESULTS ===================
view_results() {
    echo -e "${Y}═══════════════════════════════════════════${NC}"
    echo -e "${B}📁 AVAILABLE RESULTS${NC}"
    echo -e "${Y}═══════════════════════════════════════════${NC}"
    
    if [ ! -d "results" ] || [ -z "$(ls -A results 2>/dev/null)" ]; then
        echo -e "${Y}[!] No results found! Run a scan first.${NC}"
        sleep 1
        return
    fi
    
    echo -e "${W}Results for ${G}$CURRENT_TARGET${NC}"
    echo ""
    ls -lh results/ | grep -v "total"
    echo ""
    echo -e "${Y}═══════════════════════════════════════════${NC}"
    read -p "Enter filename to view (or 'q' to quit): " file
    
    if [ "$file" = "q" ]; then
        return
    fi
    
    if [ -f "results/$file" ]; then
        echo ""
        cat results/$file | less
    else
        echo -e "${R}[!] File not found!${NC}"
        sleep 1
    fi
}

# =================== DELETE RESULTS ===================
delete_results() {
    echo -e "${R}⚠️  WARNING: This will delete ALL scan results!${NC}"
    read -p "Are you sure? (y/n): " confirm
    
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        rm -rf results/*
        echo -e "${G}[✓] All results deleted!${NC}"
    else
        echo -e "${Y}[!] Cancelled${NC}"
    fi
    sleep 1
}

# =================== SHOW TARGET INFO ===================
show_target_info() {
    if [ -z "$CURRENT_TARGET" ]; then
        echo -e "${Y}[!] No target set! Use Option 1 to set target.${NC}"
        sleep 1
        return
    fi
    
    echo -e "${Y}═══════════════════════════════════════════${NC}"
    echo -e "${B}🎯 TARGET INFORMATION${NC}"
    echo -e "${Y}═══════════════════════════════════════════${NC}"
    echo -e "${W}Target: ${G}$CURRENT_TARGET${NC}"
    echo ""
    
    # Get IP
    IP=$(dig +short $CURRENT_TARGET 2>/dev/null | head -1)
    if [ ! -z "$IP" ]; then
        echo -e "${W}IP Address: ${G}$IP${NC}"
    fi
    
    # Ping test
    echo -e "${Y}[*] Checking if host is alive...${NC}"
    if ping -c 1 -W 2 $CURRENT_TARGET &> /dev/null; then
        echo -e "${G}[✓] Host is reachable!${NC}"
    else
        echo -e "${R}[✗] Host is not reachable!${NC}"
    fi
    
    echo ""
    read -p "Press Enter to continue..."
}

# =================== MAIN MENU ===================
main_menu() {
    while true; do
        show_banner
        echo -e "${Y}═══════════════════════════════════════════${NC}"
        echo -e "${B}🎯 CURRENT TARGET: ${G}${CURRENT_TARGET:-Not Set}${NC}"
        echo -e "${Y}═══════════════════════════════════════════${NC}"
        echo -e "${B}📌 SCAN OPTIONS:${NC}"
        echo -e "${Y}═══════════════════════════════════════════${NC}"
        echo -e "${B}1.${NC} ${G}${BL}CHANGE TARGET${NC}"
        echo -e "${B}2.${NC} ${W}Basic Ping Scan${NC}"
        echo -e "${B}3.${NC} ${W}Common Ports (20,21,22,23,25,53,80,443,8080)${NC}"
        echo -e "${B}4.${NC} ${W}Top 10 Ports${NC}"
        echo -e "${B}5.${NC} ${W}HTTP/HTTPS Check${NC}"
        echo -e "${B}6.${NC} ${W}Service Version Detection${NC}"
        echo -e "${B}7.${NC} ${W}OS Detection${NC}"
        echo -e "${B}8.${NC} ${W}Script Scan (Safe Scripts)${NC}"
        echo -e "${B}9.${NC} ${W}Custom Port Range${NC}"
        echo -e "${B}10.${NC} ${P}ALL IN ONE SCAN${NC}"
        echo -e "${B}11.${NC} ${W}View Results${NC}"
        echo -e "${B}12.${NC} ${W}Target Info${NC}"
        echo -e "${B}13.${NC} ${R}Delete Results${NC}"
        echo -e "${B}14.${NC} ${G}Exit${NC}"
        echo -e "${Y}═══════════════════════════════════════════${NC}"
        echo ""
        read -p "$(echo -e ${G}"Select Option [1-14]: "${NC})" choice
        
        case $choice in
            1)
                set_target
                ;;
            2)
                if [ -z "$CURRENT_TARGET" ]; then
                    echo -e "${R}[!] Please set target first! (Option 1)${NC}"
                    sleep 1
                    continue
                fi
                basic_ping "$CURRENT_TARGET"
                read -p "Press Enter to continue..."
                ;;
            3)
                if [ -z "$CURRENT_TARGET" ]; then
                    echo -e "${R}[!] Please set target first! (Option 1)${NC}"
                    sleep 1
                    continue
                fi
                common_ports "$CURRENT_TARGET"
                read -p "Press Enter to continue..."
                ;;
            4)
                if [ -z "$CURRENT_TARGET" ]; then
                    echo -e "${R}[!] Please set target first! (Option 1)${NC}"
                    sleep 1
                    continue
                fi
                top_ports "$CURRENT_TARGET"
                read -p "Press Enter to continue..."
                ;;
            5)
                if [ -z "$CURRENT_TARGET" ]; then
                    echo -e "${R}[!] Please set target first! (Option 1)${NC}"
                    sleep 1
                    continue
                fi
                http_check "$CURRENT_TARGET"
                read -p "Press Enter to continue..."
                ;;
            6)
                if [ -z "$CURRENT_TARGET" ]; then
                    echo -e "${R}[!] Please set target first! (Option 1)${NC}"
                    sleep 1
                    continue
                fi
                service_version "$CURRENT_TARGET"
                read -p "Press Enter to continue..."
                ;;
            7)
                if [ -z "$CURRENT_TARGET" ]; then
                    echo -e "${R}[!] Please set target first! (Option 1)${NC}"
                    sleep 1
                    continue
                fi
                os_detection "$CURRENT_TARGET"
                read -p "Press Enter to continue..."
                ;;
            8)
                if [ -z "$CURRENT_TARGET" ]; then
                    echo -e "${R}[!] Please set target first! (Option 1)${NC}"
                    sleep 1
                    continue
                fi
                script_scan "$CURRENT_TARGET"
                read -p "Press Enter to continue..."
                ;;
            9)
                if [ -z "$CURRENT_TARGET" ]; then
                    echo -e "${R}[!] Please set target first! (Option 1)${NC}"
                    sleep 1
                    continue
                fi
                port_range "$CURRENT_TARGET"
                read -p "Press Enter to continue..."
                ;;
            10)
                if [ -z "$CURRENT_TARGET" ]; then
                    echo -e "${R}[!] Please set target first! (Option 1)${NC}"
                    sleep 1
                    continue
                fi
                all_in_one "$CURRENT_TARGET"
                read -p "Press Enter to continue..."
                ;;
            11)
                view_results
                ;;
            12)
                show_target_info
                ;;
            13)
                delete_results
                ;;
            14)
                echo -e "${G}[✓] Thanks for using GAUTAM NMAP PRO!${NC}"
                echo -e "${Y}Admin: Gautam Kumar${NC}"
                exit 0
                ;;
            *)
                echo -e "${R}[!] Invalid option!${NC}"
                sleep 1
                ;;
        esac
    done
}

# =================== START ===================
clear
echo -e "${G}╔══════════════════════════════════════════╗${NC}"
echo -e "${G}║${NC}  ${BL}INITIALIZING GAUTAM NMAP PRO...${NC}    ${G}║${NC}"
echo -e "${G}╚══════════════════════════════════════════╝${NC}"
echo ""
check_nmap
echo ""
echo -e "${G}[✓] Tool is ready!${NC}"
echo -e "${Y}[!] Use Option 1 to set/change target${NC}"
echo -e "${Y}[!] All scans are safe and non-aggressive${NC}"
echo -e "${Y}[!] No full port scans (-p-) included${NC}"
sleep 2
main_menu
