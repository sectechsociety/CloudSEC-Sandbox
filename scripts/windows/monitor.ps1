Write-Host "[SOC] Immediate Monitoring Active" -ForegroundColor Cyan

# Paths
$watchPath = "$env:USERPROFILE\Downloads"
$logFile = "C:\sandbox_logs\incident_log.txt"
$quarantinePath = "C:\sandbox_quarantine"

# Suspicious extensions
$suspiciousExtensions = @(".exe", ".dll", ".bat", ".ps1", ".vbs")

# Ensure folders exist
$logFolder = Split-Path $logFile
if (!(Test-Path $logFolder)) { New-Item -ItemType Directory -Path $logFolder | Out-Null }
if (!(Test-Path $logFile)) { New-Item -ItemType File -Path $logFile | Out-Null }
if (!(Test-Path $quarantinePath)) { New-Item -ItemType Directory -Path $quarantinePath | Out-Null }

# Load GUI support
Add-Type -AssemblyName System.Windows.Forms

Write-Host "[SOC] Watching Downloads Folder..." -ForegroundColor Green
Write-Host "Press CTRL + C to Stop" -ForegroundColor Yellow

$knownFiles = @()

while ($true) {

    $currentFiles = Get-ChildItem -Path $watchPath -File -ErrorAction SilentlyContinue

    foreach ($file in $currentFiles) {

        if ($knownFiles -notcontains $file.FullName) {

            $knownFiles += $file.FullName
            $ext = $file.Extension.ToLower()

            if ($suspiciousExtensions -contains $ext) {

                # Popup alert
                [System.Windows.Forms.MessageBox]::Show(
                    "🚨 Suspicious file detected and quarantined:`n$file",
                    "SOC Alert",
                    [System.Windows.Forms.MessageBoxButtons]::OK,
                    [System.Windows.Forms.MessageBoxIcon]::Warning
                )

                # Move to quarantine
                $destination = Join-Path $quarantinePath $file.Name
                Start-Sleep -Milliseconds 300
                Move-Item -Path $file.FullName -Destination $destination -Force -ErrorAction SilentlyContinue

                # Log incident
                $log = "[$(Get-Date)] ALERT — Suspicious file quarantined: $destination"
                Add-Content $logFile $log

                Write-Host "🚨 ALERT: File quarantined -> $destination" -ForegroundColor Red
            }
            else {
                Write-Host "[SAFE] Downloaded: $($file.Name)" -ForegroundColor Green
            }
        }
    }

    Start-Sleep -Milliseconds 500
}
