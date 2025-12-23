# 🛡️ Mini Cloud SOC (Security Operations Center)

## 📌 Overview
**Mini Cloud SOC** is a lightweight Security Operations Center simulation that demonstrates real-time monitoring, alerting, logging, and incident response at the endpoint level.  
The project continuously monitors the **Downloads folder**, detects suspicious files based on predefined indicators, generates SOC-style alerts, logs incidents, and quarantines potential threats.

This mini project is designed for **educational and demonstration purposes**, showcasing the fundamentals of SOC operations used in cloud and enterprise security environments.

---

## 🎯 Objectives
- Simulate real-time SOC monitoring
- Detect suspicious file downloads
- Generate security alerts
- Maintain incident logs
- Isolate potential threats using quarantine

---

## 🧰 Technologies Used
- **PowerShell**
- **Windows OS**
- **Windows Forms** (GUI alerts)
- **File System Monitoring**
- **Log Management**

---

## ⚙️ How It Works
1. Continuously monitors the user's **Downloads** directory  
2. Detects newly downloaded files  
3. Checks file extensions against a suspicious list  
4. Triggers an alert if a suspicious file is detected  
5. Moves the file to a **quarantine folder**  
6. Logs the incident with timestamp details  

---

## 🚨 Features
- 📡 Real-time folder monitoring
- 🚨 SOC-style popup alerts
- 🗂️ Automatic quarantine of suspicious files
- 📝 Incident logging for forensic reference
- 🛑 Continuous monitoring until manually stopped

---
