#!/bin/bash

# ==============================================
#   GAUTAM NMAP PRO - Bootstrap HTML Report
#   Admin: Gautam Kumar
#   Version: 3.0
# ==============================================

G='\033[0;32m'
Y='\033[1;33m'
R='\033[0;31m'
W='\033[1;37m'
NC='\033[0m'

generate_bootstrap_report() {
    local target=$1
    local scan_type=$2
    local result_file=$3
    local timestamp=$(date '+%Y%m%d_%H%M%S')
    local report_file="reports/bootstrap_report_${target}_${timestamp}.html"
    
    echo -e "${Y}[*] Generating Bootstrap HTML Report...${NC}"
    
    # Get IP
    IP=$(dig +short "$target" 2>/dev/null | head -1)
    
    # Read results
    if [ -f "$result_file" ]; then
        SCAN_RESULTS=$(cat "$result_file" 2>/dev/null | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g')
        OPEN_PORTS=$(grep -E "^[0-9]" "$result_file" | grep open | wc -l)
    else
        SCAN_RESULTS="No results found"
        OPEN_PORTS=0
    fi
    
    # Status check
    if ping -c 1 -W 2 "$target" &> /dev/null 2>&1; then
        STATUS="🟢 Alive"
        STATUS_BADGE="badge bg-success"
    else
        STATUS="🔴 Down"
        STATUS_BADGE="badge bg-danger"
    fi
    
    cat > "$report_file" << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GAUTAM NMAP PRO - Bootstrap Report</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome 6 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-bg: #0a0e17;
            --secondary-bg: #121a2a;
            --accent: #00ff88;
            --accent-dark: #00cc77;
            --text: #ccddee;
            --card-bg: #1a2438;
        }
        body {
            background: var(--primary-bg);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: var(--text);
            padding: 20px;
        }
        .main-container {
            max-width: 1400px;
            margin: 0 auto;
        }
        /* Header */
        .header-section {
            background: linear-gradient(135deg, var(--secondary-bg), var(--card-bg));
            border-radius: 20px;
            padding: 40px;
            margin-bottom: 30px;
            border: 1px solid rgba(0, 255, 136, 0.2);
            box-shadow: 0 0 60px rgba(0, 255, 136, 0.05);
        }
        .header-section h1 {
            font-size: 3em;
            font-weight: 800;
            background: linear-gradient(135deg, #00ff88, #00ccff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .header-section .subtitle {
            color: #8899aa;
            font-size: 1.1em;
        }
        /* Cards */
        .stat-card {
            background: var(--card-bg);
            border-radius: 15px;
            padding: 20px;
            border: 1px solid rgba(0, 255, 136, 0.1);
            transition: all 0.3s ease;
            text-align: center;
        }
        .stat-card:hover {
            transform: translateY(-5px);
            border-color: var(--accent);
            box-shadow: 0 0 30px rgba(0, 255, 136, 0.1);
        }
        .stat-card .icon {
            font-size: 2.5em;
            color: var(--accent);
            margin-bottom: 10px;
        }
        .stat-card .number {
            font-size: 2.5em;
            font-weight: 700;
            color: #ffffff;
        }
        .stat-card .label {
            color: #8899aa;
            font-size: 0.9em;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        /* Results Table */
        .results-section {
            background: var(--secondary-bg);
            border-radius: 20px;
            padding: 30px;
            border: 1px solid rgba(0, 255, 136, 0.1);
        }
        .results-section h2 {
            color: var(--accent);
            margin-bottom: 20px;
        }
        .table {
            color: var(--text);
        }
        .table thead {
            background: rgba(0, 255, 136, 0.1);
        }
        .table thead th {
            color: var(--accent);
            border-bottom: 2px solid var(--accent);
            font-weight: 600;
        }
        .table tbody tr {
            border-bottom: 1px solid rgba(0, 255, 136, 0.05);
            transition: all 0.2s;
        }
        .table tbody tr:hover {
            background: rgba(0, 255, 136, 0.05);
        }
        .badge-open {
            background: #00ff88;
            color: #0a0e17;
            font-weight: 600;
            padding: 5px 15px;
            border-radius: 20px;
        }
        .badge-closed {
            background: #ff4444;
            color: #ffffff;
            font-weight: 600;
            padding: 5px 15px;
            border-radius: 20px;
        }
        .badge-filtered {
            background: #ffaa00;
            color: #0a0e17;
            font-weight: 600;
            padding: 5px 15px;
            border-radius: 20px;
        }
        /* Raw Results */
        .raw-results {
            background: #0d1520;
            padding: 20px;
            border-radius: 10px;
            white-space: pre-wrap;
            font-size: 0.9em;
            line-height: 1.6;
            color: #ccddee;
            overflow-x: auto;
            max-height: 500px;
            overflow-y: auto;
            border: 1px solid rgba(0, 255, 136, 0.1);
            font-family: 'Courier New', monospace;
        }
        .raw-results::-webkit-scrollbar {
            width: 8px;
            height: 8px;
        }
        .raw-results::-webkit-scrollbar-track {
            background: #0d1520;
            border-radius: 10px;
        }
        .raw-results::-webkit-scrollbar-thumb {
            background: var(--accent);
            border-radius: 10px;
        }
        /* Export Buttons */
        .export-btn {
            background: rgba(0, 255, 136, 0.1);
            border: 1px solid rgba(0, 255, 136, 0.3);
            color: var(--accent);
            padding: 8px 20px;
            border-radius: 25px;
            transition: all 0.3s;
            cursor: pointer;
        }
        .export-btn:hover {
            background: var(--accent);
            color: #0a0e17;
            transform: scale(1.05);
        }
        /* Footer */
        .footer-section {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid rgba(0, 255, 136, 0.1);
            color: #556677;
        }
        .footer-section .highlight {
            color: var(--accent);
        }
        /* Responsive */
        @media (max-width: 768px) {
            .header-section h1 { font-size: 2em; }
            .stat-card .number { font-size: 1.8em; }
            .header-section { padding: 20px; }
        }
        /* DataTables */
        .dataTables_wrapper .dataTables_filter input {
            background: #0d1520;
            color: #ffffff;
            border: 1px solid rgba(0, 255, 136, 0.2);
            border-radius: 8px;
            padding: 5px 15px;
        }
        .dataTables_wrapper .dataTables_length select {
            background: #0d1520;
            color: #ffffff;
            border: 1px solid rgba(0, 255, 136, 0.2);
            border-radius: 8px;
            padding: 5px;
        }
        .dataTables_wrapper .dataTables_info {
            color: #8899aa;
        }
        .dataTables_wrapper .dataTables_paginate .paginate_button {
            color: #8899aa !important;
            border: 1px solid rgba(0, 255, 136, 0.1) !important;
            border-radius: 8px !important;
        }
        .dataTables_wrapper .dataTables_paginate .paginate_button.current {
            background: var(--accent) !important;
            color: #0a0e17 !important;
            border-color: var(--accent) !important;
        }
        .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
            background: rgba(0, 255, 136, 0.1) !important;
            color: var(--accent) !important;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <!-- HEADER -->
        <div class="header-section">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h1><i class="fas fa-shield-alt"></i> GAUTAM NMAP PRO</h1>
                    <p class="subtitle">Professional Network Security Scanner <i class="fas fa-chevron-right"></i> Bootstrap Report</p>
                </div>
                <div class="col-md-4 text-md-end">
                    <span class="badge bg-success fs-6 p-2"><i class="fas fa-check-circle"></i> Scan Complete</span>
                </div>
            </div>
        </div>

        <!-- STATS CARDS -->
        <div class="row g-3 mb-4">
            <div class="col-md-3 col-sm-6">
                <div class="stat-card">
                    <div class="icon"><i class="fas fa-bullseye"></i></div>
                    <div class="number">TARGET_PLACEHOLDER</div>
                    <div class="label">Target</div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="stat-card">
                    <div class="icon"><i class="fas fa-globe"></i></div>
                    <div class="number">IP_PLACEHOLDER</div>
                    <div class="label">IP Address</div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="stat-card">
                    <div class="icon"><i class="fas fa-plug"></i></div>
                    <div class="number">OPEN_PORTS_PLACEHOLDER</div>
                    <div class="label">Open Ports</div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="stat-card">
                    <div class="icon"><i class="fas fa-heartbeat"></i></div>
                    <div class="number">STATUS_PLACEHOLDER</div>
                    <div class="label">Status</div>
                </div>
            </div>
        </div>

        <!-- SCAN TYPE BADGE -->
        <div class="mb-4">
            <span class="badge bg-info fs-6 p-2 me-2"><i class="fas fa-tag"></i> Scan Type</span>
            <span class="badge bg-light text-dark fs-6 p-2">SCAN_TYPE_PLACEHOLDER</span>
            <span class="badge bg-secondary fs-6 p-2 ms-2"><i class="far fa-clock"></i> DATE_PLACEHOLDER</span>
        </div>

        <!-- RESULTS TABLE -->
        <div class="results-section">
            <div class="d-flex justify-content-between align-items-center mb-3 flex-wrap">
                <h2><i class="fas fa-table me-2"></i>Port Scan Results</h2>
                <div>
                    <button class="export-btn me-2" onclick="exportCSV()"><i class="fas fa-file-csv"></i> CSV</button>
                    <button class="export-btn me-2" onclick="exportJSON()"><i class="fas fa-file-code"></i> JSON</button>
                    <button class="export-btn" onclick="window.print()"><i class="fas fa-print"></i> Print</button>
                </div>
            </div>
            
            <div class="table-responsive">
                <table id="resultsTable" class="table table-hover">
                    <thead>
                        <tr>
                            <th><i class="fas fa-hashtag"></i> Port</th>
                            <th><i class="fas fa-circle"></i> State</th>
                            <th><i class="fas fa-cog"></i> Service</th>
                            <th><i class="fas fa-code-branch"></i> Version</th>
                            <th><i class="fas fa-info-circle"></i> Info</th>
                        </tr>
                    </thead>
                    <tbody>
TABLE_BODY_PLACEHOLDER
                    </tbody>
                </table>
            </div>
        </div>

        <!-- RAW RESULTS -->
        <div class="results-section mt-4">
            <h2><i class="fas fa-terminal me-2"></i>Raw Nmap Output</h2>
            <div class="raw-results">
RAW_RESULTS_PLACEHOLDER
            </div>
        </div>

        <!-- FOOTER -->
        <div class="footer-section">
            <p>🛡️ Developed by <span class="highlight">Gautam Kumar</span> | 
            🔒 For Educational & Legal Use Only | 
            ⚡ Version 3.0</p>
            <p><i class="fas fa-star text-warning"></i> If you like this tool, give it a star on GitHub!</p>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#resultsTable').DataTable({
                pageLength: 10,
                order: [[0, 'asc']],
                language: {
                    search: "🔍 Search:",
                    lengthMenu: "Show _MENU_ entries",
                    info: "Showing _START_ to _END_ of _TOTAL_ ports",
                }
            });
        });

        function exportCSV() {
            let csv = "Port,State,Service,Version,Info\n";
            $('#resultsTable tbody tr').each(function() {
                let row = $(this).find('td');
                csv += row.eq(0).text() + ",";
                csv += row.eq(1).text() + ",";
                csv += row.eq(2).text() + ",";
                csv += row.eq(3).text() + ",";
                csv += row.eq(4).text() + "\n";
            });
            let blob = new Blob([csv], { type: 'text/csv' });
            let link = document.createElement('a');
            link.href = URL.createObjectURL(blob);
            link.download = 'nmap_report.csv';
            link.click();
        }

        function exportJSON() {
            let data = [];
            $('#resultsTable tbody tr').each(function() {
                let row = $(this).find('td');
                data.push({
                    port: row.eq(0).text(),
                    state: row.eq(1).text(),
                    service: row.eq(2).text(),
                    version: row.eq(3).text(),
                    info: row.eq(4).text()
                });
            });
            let blob = new Blob([JSON.stringify(data, null, 2)], { type: 'application/json' });
            let link = document.createElement('a');
            link.href = URL.createObjectURL(blob);
            link.download = 'nmap_report.json';
            link.click();
        }
    </script>
</body>
</html>
EOF

    # Replace placeholders
    sed -i "s/TARGET_PLACEHOLDER/$target/g" "$report_file"
    sed -i "s/IP_PLACEHOLDER/${IP:-N/A}/g" "$report_file"
    sed -i "s/OPEN_PORTS_PLACEHOLDER/$OPEN_PORTS/g" "$report_file"
    sed -i "s/STATUS_PLACEHOLDER/$STATUS/g" "$report_file"
    sed -i "s/SCAN_TYPE_PLACEHOLDER/$scan_type/g" "$report_file"
    sed -i "s/DATE_PLACEHOLDER/$(date '+%Y-%m-%d %H:%M:%S')/g" "$report_file"
    
    # Generate table body from results
    if [ -f "$result_file" ]; then
        TABLE_BODY=""
        grep -E "^[0-9]" "$result_file" | while read line; do
            PORT=$(echo "$line" | awk '{print $1}')
            STATE=$(echo "$line" | awk '{print $2}')
            SERVICE=$(echo "$line" | awk '{print $3}')
            VERSION=$(echo "$line" | awk '{print $4}')
            INFO=$(echo "$line" | cut -d' ' -f5-)
            
            if [ "$STATE" == "open" ]; then
                BADGE="badge-open"
            elif [ "$STATE" == "filtered" ]; then
                BADGE="badge-filtered"
            else
                BADGE="badge-closed"
            fi
            
            TABLE_BODY+="<tr>
                <td><strong>$PORT</strong></td>
                <td><span class=\"badge $BADGE\">$STATE</span></td>
                <td>$SERVICE</td>
                <td>${VERSION:-N/A}</td>
                <td>${INFO:-N/A}</td>
            </tr>"
        done
        sed -i "s|TABLE_BODY_PLACEHOLDER|$TABLE_BODY|g" "$report_file"
    else
        sed -i "s|TABLE_BODY_PLACEHOLDER|<tr><td colspan='5' class='text-center'>No results found</td></tr>|g" "$report_file"
    fi
    
    # Replace raw results
    if [ -f "$result_file" ]; then
        ESCAPED_RESULTS=$(cat "$result_file" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g')
        sed -i "s|RAW_RESULTS_PLACEHOLDER|$ESCAPED_RESULTS|g" "$report_file"
    else
        sed -i "s|RAW_RESULTS_PLACEHOLDER|No results found|g" "$report_file"
    fi
    
    echo -e "${G}[✓] Bootstrap Report generated: $report_file${NC}"
    
    # Copy to main directory
    cp "$report_file" "$SCRIPT_DIR/index.html"
    echo -e "${G}[✓] index.html updated with Bootstrap design${NC}"
    
    # Open in browser
    if command -v xdg-open &> /dev/null; then
        xdg-open "$report_file" 2>/dev/null
    elif command -v open &> /dev/null; then
        open "$report_file" 2>/dev/null
    fi
}

# Call function if script run directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    generate_bootstrap_report "$1" "$2" "$3"
fi
