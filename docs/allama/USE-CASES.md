# 📋 Allama Use Cases

<p align="center">
  <img src="https://img.shields.io/badge/Document-Use%20Cases-8B5CF6?style=for-the-badge" alt="Use Cases">
  <img src="https://img.shields.io/badge/Status-Available-success?style=for-the-badge" alt="Available">
</p>

<p align="center">
  <a href="../../README.md">🏠 Home</a> •
  <a href="../../PRODUCTS.md">📦 Products</a> •
  <a href="README.md">📖 Overview</a> •
  <a href="ARCHITECTURE.md">🏗️ Architecture</a> •
  <a href="QUICKSTART.md">🚀 Quick Start</a>
</p>

---

## Overview

This document showcases real-world **security automation scenarios** that demonstrate how Allama transforms security operations. From automated phishing response to complex incident workflows, these use cases illustrate the power of AI-driven security automation.

---

## 📋 Table of Contents

- [Security Automation Scenarios](#-security-automation-scenarios)
  - [Phishing Response Automation](#1-phishing-response-automation)
  - [Malware Containment](#2-malware-containment)
  - [Suspicious Login Detection](#3-suspicious-login-detection)
  - [Data Exfiltration Prevention](#4-data-exfiltration-prevention)
- [Incident Response Examples](#-incident-response-examples)
  - [Ransomware Incident Response](#1-ransomware-incident-response)
  - [Insider Threat Investigation](#2-insider-threat-investigation)
  - [DDoS Attack Mitigation](#3-ddos-attack-mitigation)
- [Integration Examples](#-integration-examples)
  - [SIEM Integration](#1-siem-integration)
  - [EDR Integration](#2-edr-integration)
  - [Ticketing System Integration](#3-ticketing-system-integration)
  - [Cloud Platform Integration](#4-cloud-platform-integration)
- [Workflow Templates](#-workflow-templates)

---

## 🔐 Security Automation Scenarios

### 1. Phishing Response Automation

<p align="center">
  <img src="https://img.shields.io/badge/Scenario-Phishing%20Response-3B82F6?style=for-the-badge" alt="Phishing Response">
  <img src="https://img.shields.io/badge/Time%20Saved-95%25-success?style=for-the-badge" alt="95% Time Saved">
</p>

**Challenge:** Security teams receive hundreds of reported phishing emails daily, requiring manual analysis of each message, extraction of indicators, and response actions.

**Solution:** Allama automates the entire phishing response workflow from initial report to remediation.

#### Workflow Diagram

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                        Phishing Response Workflow                           │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐                   │
│  │   User       │    │   Email      │    │   AI         │                   │
│  │   Reports    │───▶│   Analysis   │───▶│   Triage     │                   │
│  │   Phishing   │    │   Engine     │    │   Module     │                   │
│  └──────────────┘    └──────────────┘    └───────┬──────┘                   │
│                                                  │                          │
│                           ┌──────────────────────┼──────────────────────┐   │
│                           │                      │                      │   │
│                           ▼                      ▼                      ▼   │
│                    ┌──────────────┐       ┌──────────────┐      ┌──────────┐│
│                    │   Extract    │       │   Check      │      │  Query   ││
│                    │   URLs &     │       │   Sender     │      │  Threat  ││
│                    │   Attachments│       │   Reputation │      │  Intel   ││
│                    └──────┬───────┘       └──────┬───────┘      └────┬─────┘│
│                           │                      │                   │      │
│                           └──────────────────────┼───────────────────┘      │
│                                                  │                          │
│                                                  ▼                          │
│                                          ┌──────────────┐                   │
│                                          │   Decision   │                   │
│                                          │   Engine     │                   │
│                                          └──────┬───────┘                   │
│                                                 │                           │
│                    ┌────────────────────────────┼───────────────────────┐   │
│                    │                            │                       │   │
│                    ▼                            ▼                       ▼   │
│             ┌──────────────┐            ┌──────────────┐        ┌──────────┐│
│             │   Block      │            │   Quarantine │        │  Alert   ││
│             │   Malicious  │            │   Similar    │        │  User &  ││
│             │   URLs       │            │   Emails     │        │  Create  ││
│             └──────────────┘            └──────────────┘        │  Ticket  ││
│                                                                 └──────────┘│
└─────────────────────────────────────────────────────────────────────────────┘
```

#### Automated Actions

| Action | Description |
|--------|-------------|
| **Email Analysis** | Parse email headers, body, and attachments for indicators of compromise (IOCs) |
| **URL Scanning** | Check extracted URLs against threat intelligence feeds and sandbox analysis |
| **Sender Verification** | Validate sender domain, SPF/DKIM/DMARC records, and reputation |
| **Attachment Analysis** | Submit attachments to sandbox for dynamic analysis |
| **Threat Correlation** | Cross-reference IOCs with known threat campaigns |
| **Automated Blocking** | Block malicious URLs at proxy/firewall level |
| **Email Quarantine** | Remove similar phishing emails from all mailboxes |
| **User Notification** | Inform reporting user of outcome and provide guidance |

#### Results

- ⚡ **95% reduction** in phishing response time (from 45 minutes to 2 minutes)
- 🔄 **Automated handling** of 90% of reported phishing emails
- 📉 **Reduced analyst workload** by eliminating repetitive tasks
- 🎯 **Improved accuracy** through consistent analysis methodology

---

### 2. Malware Containment

<p align="center">
  <img src="https://img.shields.io/badge/Scenario-Malware%20Containment-3B82F6?style=for-the-badge" alt="Malware Containment">
  <img src="https://img.shields.io/badge/Response%20Time-90%25%20Faster-success?style=for-the-badge" alt="90% Faster">
</p>

**Challenge:** When malware is detected on an endpoint, security teams must quickly contain the threat, investigate the scope, and remediate affected systems—often under significant time pressure.

**Solution:** Allama provides automated malware containment workflows that isolate threats within seconds of detection.

#### Workflow Diagram

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                       Malware Containment Workflow                           │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐                   │
│  │   EDR        │    │   AI        │    │   Severity   │                   │
│  │   Alert      │───▶│   Analysis   │───▶│   Assessment │                   │
│  │   Received   │    │              │    │              │                   │
│  └──────────────┘    └──────────────┘    └──────┬───────┘                   │
│                                                  │                           │
│                           ┌──────────────────────┴──────────────────────┐   │
│                           │                                             │   │
│                           ▼                                             ▼   │
│                    ┌──────────────┐                              ┌──────────┐│
│                    │   Critical   │                              │   Low/   ││
│                    │   Severity   │                              │   Medium ││
│                    └──────┬───────┘                              └────┬─────┘│
│                           │                                           │      │
│         ┌─────────────────┼─────────────────┐                        │      │
│         │                 │                 │                        │      │
│         ▼                 ▼                 ▼                        ▼      │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐        ┌──────────┐  │
│  │   Isolate    │  │   Kill       │  │   Block      │        │  Queue   │  │
│  │   Endpoint   │  │   Process    │  │   Network    │        │  for     │  │
│  │              │  │              │  │   Comms      │        │  Review  │  │
│  └──────────────┘  └──────────────┘  └──────────────┘        └──────────┘  │
│         │                 │                 │                              │
│         └─────────────────┼─────────────────┘                              │
│                           │                                                 │
│                           ▼                                                 │
│                    ┌──────────────┐                                         │
│                    │   Collect    │                                         │
│                    │   Forensics  │                                         │
│                    └──────┬───────┘                                         │
│                           │                                                 │
│                           ▼                                                 │
│                    ┌──────────────┐                                         │
│                    │   Create     │                                         │
│                    │   Incident   │                                         │
│                    │   Ticket     │                                         │
│                    └──────────────┘                                         │
└─────────────────────────────────────────────────────────────────────────────┘
```

#### Automated Actions

| Action | Description |
|--------|-------------|
| **Endpoint Isolation** | Immediately isolate infected endpoint from network via EDR |
| **Process Termination** | Kill malicious processes identified by EDR |
| **Network Blocking** | Block command-and-control (C2) communications at firewall |
| **Hash Blocking** | Add malware hashes to blocklists across all endpoints |
| **Forensic Collection** | Automatically collect memory dumps, logs, and artefacts |
| **Lateral Movement Check** | Scan for indicators of lateral movement to other systems |
| **User Notification** | Inform affected user and IT support of containment actions |
| **Incident Creation** | Create detailed incident ticket with all collected evidence |

#### Results

- ⚡ **90% faster containment** (from 30 minutes to 3 minutes)
- 🛡️ **Prevented lateral movement** through immediate isolation
- 📊 **Complete forensic evidence** collected automatically
- 🔄 **Consistent response** regardless of analyst availability

---

### 3. Suspicious Login Detection

<p align="center">
  <img src="https://img.shields.io/badge/Scenario-Suspicious%20Login-3B82F6?style=for-the-badge" alt="Suspicious Login">
  <img src="https://img.shields.io/badge/False%20Positives-80%25%20Reduced-success?style=for-the-badge" alt="80% Reduced">
</p>

**Challenge:** Identity-based attacks are increasingly common, but distinguishing between legitimate unusual logins and actual compromises requires significant context and analysis.

**Solution:** Allama correlates login events with user behaviour patterns, threat intelligence, and contextual data to accurately identify compromised accounts.

#### Workflow Diagram

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    Suspicious Login Detection Workflow                       │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐                   │
│  │   Login      │    │   Behaviour  │    │   Risk       │                   │
│  │   Event      │───▶│   Analysis   │───▶│   Scoring    │                   │
│  │   Detected   │    │              │    │              │                   │
│  └──────────────┘    └──────────────┘    └──────┬───────┘                   │
│                                                  │                           │
│                    ┌─────────────────────────────┼─────────────────────────┐ │
│                    │                             │                         │ │
│                    ▼                             ▼                         ▼ │
│             ┌──────────────┐             ┌──────────────┐           ┌────────┐│
│             │   High Risk  │             │   Medium     │           │  Low   ││
│             │   (Score>80) │             │   Risk       │           │  Risk  ││
│             └──────┬───────┘             └──────┬───────┘           └────────┘│
│                    │                            │                            │
│         ┌──────────┼──────────┐                 │                            │
│         │          │          │                 │                            │
│         ▼          ▼          ▼                 ▼                            │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────────┐                    │
│  │  Force   │ │  Notify  │ │  Create  │ │   Send       │                    │
│  │  MFA     │ │  User    │ │  Urgent  │ │   Verification│                    │
│  │  Reset   │ │  & SOC   │ │  Ticket  │ │   Email      │                    │
│  └──────────┘ └──────────┘ └──────────┘ └──────────────┘                    │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

#### Risk Scoring Factors

| Factor | Weight | Description |
|--------|--------|-------------|
| **Impossible Travel** | High | Login from geographically distant location within short timeframe |
| **New Device** | Medium | First-time login from unrecognised device |
| **Unusual Time** | Medium | Login outside user's normal working hours |
| **Failed Attempts** | High | Multiple failed attempts before successful login |
| **VPN/Proxy Usage** | Medium | Login through anonymising services |
| **Known Bad IP** | Critical | Source IP on threat intelligence blocklists |
| **Sensitive Account** | High | Login to privileged or service account |

#### Automated Actions

| Action | Description |
|--------|-------------|
| **Risk Calculation** | Score login based on multiple behavioural and contextual factors |
| **MFA Challenge** | Force additional authentication for high-risk logins |
| **Session Termination** | Terminate active sessions for confirmed compromises |
| **Password Reset** | Force password reset for compromised accounts |
| **User Verification** | Send verification request to user's known contact methods |
| **Access Review** | Trigger review of recent account activity |

#### Results

- 📉 **80% reduction** in false positive alerts
- ⚡ **Immediate response** to high-risk logins
- 🎯 **Accurate identification** of compromised accounts
- 🔒 **Proactive protection** before damage occurs

---

### 4. Data Exfiltration Prevention

<p align="center">
  <img src="https://img.shields.io/badge/Scenario-Data%20Exfiltration-3B82F6?style=for-the-badge" alt="Data Exfiltration">
  <img src="https://img.shields.io/badge/Detection%20Time-85%25%20Faster-success?style=for-the-badge" alt="85% Faster">
</p>

**Challenge:** Detecting data exfiltration requires correlating signals across multiple systems—network traffic, endpoint activity, cloud services, and user behaviour—making manual detection nearly impossible.

**Solution:** Allama monitors data movement patterns and automatically responds to potential exfiltration attempts.

#### Workflow Diagram

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    Data Exfiltration Prevention Workflow                     │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  ┌──────────────────────────────────────────────────────────────────────┐   │
│  │                        Data Movement Signals                          │   │
│  ├──────────────┬──────────────┬──────────────┬──────────────┬──────────┤   │
│  │   Large      │   Cloud      │   USB        │   Email      │  Network │   │
│  │   File       │   Upload     │   Activity   │   Attachment │  Traffic │   │
│  │   Transfer   │   Detected   │   Detected   │   Anomaly    │  Spike   │   │
│  └──────┬───────┴──────┬───────┴──────┬───────┴──────┬───────┴────┬─────┘   │
│         │              │              │              │            │         │
│         └──────────────┴──────────────┴──────────────┴────────────┘         │
│                                       │                                      │
│                                       ▼                                      │
│                              ┌─────────────────┐                             │
│                              │   Correlation   │                             │
│                              │   Engine        │                             │
│                              └────────┬────────┘                             │
│                                       │                                      │
│                                       ▼                                      │
│                              ┌─────────────────┐                             │
│                              │   Risk          │                             │
│                              │   Assessment    │                             │
│                              └────────┬────────┘                             │
│                                       │                                      │
│                    ┌──────────────────┼──────────────────┐                   │
│                    │                  │                  │                   │
│                    ▼                  ▼                  ▼                   │
│             ┌──────────────┐   ┌──────────────┐   ┌──────────────┐          │
│             │   Block      │   │   Alert      │   │   Log &      │          │
│             │   Transfer   │   │   & Notify   │   │   Monitor    │          │
│             └──────────────┘   └──────────────┘   └──────────────┘          │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

#### Automated Actions

| Action | Description |
|--------|-------------|
| **Transfer Blocking** | Block suspicious file transfers in real-time |
| **Cloud Access Control** | Revoke cloud storage access for compromised accounts |
| **USB Disabling** | Disable USB ports on affected endpoints |
| **Network Segmentation** | Isolate user from sensitive network segments |
| **Evidence Preservation** | Capture and preserve forensic evidence |
| **Manager Notification** | Alert user's manager and HR for insider threat cases |

#### Results

- ⚡ **85% faster detection** of exfiltration attempts
- 🛡️ **Real-time blocking** of data transfers
- 📊 **Complete audit trail** for investigations
- 🔄 **Automated correlation** across multiple data sources

---

## 🚨 Incident Response Examples

### 1. Ransomware Incident Response

<p align="center">
  <img src="https://img.shields.io/badge/Incident-Ransomware-8B5CF6?style=for-the-badge" alt="Ransomware">
  <img src="https://img.shields.io/badge/Containment-Under%205%20Minutes-success?style=for-the-badge" alt="Under 5 Minutes">
</p>

**Scenario:** A ransomware attack is detected on multiple endpoints within the organisation. Time is critical to prevent encryption of additional systems and data.

#### Incident Response Workflow

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      Ransomware Incident Response                            │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  PHASE 1: DETECTION & ALERTING                                              │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐                   │
│  │   EDR        │    │   File       │    │   Network    │                   │
│  │   Detection  │    │   Integrity  │    │   Anomaly    │                   │
│  │              │    │   Alert      │    │   Detection  │                   │
│  └──────┬───────┘    └──────┬───────┘    └──────┬───────┘                   │
│         │                   │                   │                            │
│         └───────────────────┼───────────────────┘                            │
│                             │                                                │
│                             ▼                                                │
│  PHASE 2: IMMEDIATE CONTAINMENT                                             │
│  ┌──────────────────────────────────────────────────────────────────────┐   │
│  │                    Automated Containment Actions                      │   │
│  ├──────────────┬──────────────┬──────────────┬──────────────┬──────────┤   │
│  │   Isolate    │   Block      │   Disable    │   Snapshot   │  Alert   │   │
│  │   Infected   │   C2         │   Network    │   Critical   │  SOC &   │   │
│  │   Endpoints  │   Domains    │   Shares     │   Systems    │  CISO    │   │
│  └──────────────┴──────────────┴──────────────┴──────────────┴──────────┘   │
│                                                                              │
│  PHASE 3: INVESTIGATION                                                      │
│  ┌──────────────────────────────────────────────────────────────────────┐   │
│  │                    Automated Investigation                            │   │
│  ├──────────────┬──────────────┬──────────────┬──────────────────────────┤   │
│  │   Identify   │   Map        │   Collect    │   Determine              │   │
│  │   Patient    │   Lateral    │   Forensic   │   Ransomware             │   │
│  │   Zero       │   Movement   │   Evidence   │   Variant                │   │
│  └──────────────┴──────────────┴──────────────┴──────────────────────────┘   │
│                                                                              │
│  PHASE 4: COMMUNICATION                                                      │
│  ┌──────────────────────────────────────────────────────────────────────┐   │
│  │                    Automated Notifications                            │   │
│  ├──────────────┬──────────────┬──────────────┬──────────────────────────┤   │
│  │   Executive  │   Legal &    │   IT         │   External               │   │
│  │   Briefing   │   Compliance │   Teams      │   Partners               │   │
│  └──────────────┴──────────────┴──────────────┴──────────────────────────┘   │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

#### Response Timeline

| Time | Action | Automation Level |
|------|--------|------------------|
| **0-30 sec** | Detection and initial alert | Fully Automated |
| **30-60 sec** | Endpoint isolation initiated | Fully Automated |
| **1-2 min** | Network shares disabled, C2 blocked | Fully Automated |
| **2-3 min** | Critical system snapshots created | Fully Automated |
| **3-5 min** | SOC and CISO notified with initial assessment | Fully Automated |
| **5-15 min** | Patient zero identified, lateral movement mapped | AI-Assisted |
| **15-30 min** | Executive briefing prepared | AI-Assisted |

#### Key Outcomes

- 🛡️ **Containment in under 5 minutes** prevents widespread encryption
- 📊 **Automated evidence collection** supports investigation
- 📋 **Pre-built communication templates** accelerate stakeholder notification
- 🔄 **Consistent response** regardless of time of day or analyst availability

---

### 2. Insider Threat Investigation

<p align="center">
  <img src="https://img.shields.io/badge/Incident-Insider%20Threat-8B5CF6?style=for-the-badge" alt="Insider Threat">
  <img src="https://img.shields.io/badge/Investigation%20Time-70%25%20Reduced-success?style=for-the-badge" alt="70% Reduced">
</p>

**Scenario:** Behavioural analytics detect unusual activity from an employee account, suggesting potential data theft or policy violation. A thorough but discreet investigation is required.

#### Investigation Workflow

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      Insider Threat Investigation                            │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  PHASE 1: DETECTION                                                          │
│  ┌──────────────────────────────────────────────────────────────────────┐   │
│  │                    Behavioural Anomaly Signals                        │   │
│  ├──────────────┬──────────────┬──────────────┬──────────────────────────┤   │
│  │   Unusual    │   After-Hours│   Access to  │   Large Data             │   │
│  │   Data       │   Activity   │   Sensitive  │   Downloads              │   │
│  │   Access     │   Increase   │   Systems    │                          │   │
│  └──────────────┴──────────────┴──────────────┴──────────────────────────┘   │
│                             │                                                │
│                             ▼                                                │
│  PHASE 2: SILENT MONITORING                                                  │
│  ┌──────────────────────────────────────────────────────────────────────┐   │
│  │                    Enhanced Monitoring (Covert)                       │   │
│  ├──────────────┬──────────────┬──────────────┬──────────────────────────┤   │
│  │   Email      │   File       │   Cloud      │   Network                │   │
│  │   Activity   │   Access     │   Activity   │   Traffic                │   │
│  │   Logging    │   Logging    │   Logging    │   Capture                │   │
│  └──────────────┴──────────────┴──────────────┴──────────────────────────┘   │
│                             │                                                │
│                             ▼                                                │
│  PHASE 3: EVIDENCE COMPILATION                                               │
│  ┌──────────────────────────────────────────────────────────────────────┐   │
│  │                    Automated Evidence Package                         │   │
│  ├──────────────┬──────────────┬──────────────┬──────────────────────────┤   │
│  │   Activity   │   Data       │   Policy     │   Risk                   │   │
│  │   Timeline   │   Access     │   Violations │   Assessment             │   │
│  │              │   Report     │   Summary    │                          │   │
│  └──────────────┴──────────────┴──────────────┴──────────────────────────┘   │
│                             │                                                │
│                             ▼                                                │
│  PHASE 4: ESCALATION                                                         │
│  ┌──────────────────────────────────────────────────────────────────────┐   │
│  │                    Confidential Notification                          │   │
│  ├──────────────┬──────────────┬──────────────────────────────────────────┤   │
│  │   Security   │   HR         │   Legal                                 │   │
│  │   Leadership │   Department │   Counsel                               │   │
│  └──────────────┴──────────────┴──────────────────────────────────────────┘   │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

#### Automated Evidence Collection

| Evidence Type | Source | Automation |
|---------------|--------|------------|
| **Email Activity** | Exchange/O365 | Full audit log extraction |
| **File Access** | DLP, File Servers | Access pattern analysis |
| **Cloud Usage** | CASB, Cloud Logs | Upload/download tracking |
| **Badge Access** | Physical Security | Location correlation |
| **Web Activity** | Proxy Logs | Site categorisation |
| **USB Activity** | Endpoint Logs | Device and file tracking |

#### Key Outcomes

- 🔍 **70% reduction** in investigation time
- 📋 **Court-ready evidence packages** generated automatically
- 🔒 **Discreet monitoring** without alerting the subject
- ⚖️ **Compliance-aligned** evidence handling

---

### 3. DDoS Attack Mitigation

<p align="center">
  <img src="https://img.shields.io/badge/Incident-DDoS%20Attack-8B5CF6?style=for-the-badge" alt="DDoS Attack">
  <img src="https://img.shields.io/badge/Mitigation%20Time-95%25%20Faster-success?style=for-the-badge" alt="95% Faster">
</p>

**Scenario:** A distributed denial-of-service attack targets the organisation's public-facing services. Rapid response is essential to maintain service availability.

#### Mitigation Workflow

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                        DDoS Attack Mitigation                                │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  PHASE 1: DETECTION                                                          │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐                   │
│  │   Traffic    │    │   Service    │    │   Network    │                   │
│  │   Anomaly    │    │   Degradation│    │   Saturation │                   │
│  │   Detection  │    │   Alert      │    │   Alert      │                   │
│  └──────┬───────┘    └──────┬───────┘    └──────┬───────┘                   │
│         │                   │                   │                            │
│         └───────────────────┼───────────────────┘                            │
│                             │                                                │
│                             ▼                                                │
│  PHASE 2: CLASSIFICATION                                                     │
│  ┌──────────────────────────────────────────────────────────────────────┐   │
│  │                    Attack Classification                              │   │
│  ├──────────────┬──────────────┬──────────────┬──────────────────────────┤   │
│  │   Volumetric │   Protocol   │   Application│   Multi-Vector           │   │
│  │   Attack     │   Attack     │   Layer      │   Attack                 │   │
│  └──────────────┴──────────────┴──────────────┴──────────────────────────┘   │
│                             │                                                │
│                             ▼                                                │
│  PHASE 3: AUTOMATED MITIGATION                                               │
│  ┌──────────────────────────────────────────────────────────────────────┐   │
│  │                    Mitigation Actions                                 │   │
│  ├──────────────┬──────────────┬──────────────┬──────────────────────────┤   │
│  │   Enable     │   Activate   │   Scale      │   Geo-Block              │   │
│  │   Rate       │   CDN        │   Infrastructure│   Attack              │   │
│  │   Limiting   │   Protection │              │   Sources                │   │
│  └──────────────┴──────────────┴──────────────┴──────────────────────────┘   │
│                             │                                                │
│                             ▼                                                │
│  PHASE 4: MONITORING & COMMUNICATION                                         │
│  ┌──────────────────────────────────────────────────────────────────────┐   │
│  │                    Ongoing Response                                   │   │
│  ├──────────────┬──────────────┬──────────────┬──────────────────────────┤   │
│  │   Real-Time  │   Status     │   ISP        │   Executive              │   │
│  │   Dashboard  │   Page       │   Coordination│   Updates               │   │
│  │   Updates    │   Updates    │              │                          │   │
│  └──────────────┴──────────────┴──────────────┴──────────────────────────┘   │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

#### Automated Mitigation Actions

| Action | Trigger | Description |
|--------|---------|-------------|
| **Rate Limiting** | Traffic spike detected | Apply request rate limits at edge |
| **CDN Activation** | Volumetric attack confirmed | Route traffic through DDoS protection CDN |
| **Geo-Blocking** | Attack source identified | Block traffic from attacking regions |
| **Auto-Scaling** | Resource exhaustion imminent | Scale infrastructure to absorb traffic |
| **ISP Notification** | Upstream mitigation needed | Automated notification to ISP/upstream providers |
| **Status Updates** | Attack ongoing | Update public status page automatically |

#### Key Outcomes

- ⚡ **95% faster mitigation** (from 30 minutes to under 2 minutes)
- 🌐 **Maintained service availability** during attacks
- 📊 **Real-time visibility** into attack patterns
- 🔄 **Automated coordination** with upstream providers

---

## 🔗 Integration Examples

Allama's power comes from its ability to connect and orchestrate actions across your entire security stack. Below are detailed integration examples showing how Allama works with common security tools.

### 1. SIEM Integration

<p align="center">
  <img src="https://img.shields.io/badge/Integration-SIEM-3B82F6?style=for-the-badge" alt="SIEM Integration">
  <img src="https://img.shields.io/badge/Supported-Splunk%20|%20Elastic%20|%20QRadar-8B5CF6?style=flat-square" alt="Supported SIEMs">
</p>

#### Splunk Integration Example

Allama integrates with Splunk to ingest alerts, enrich events, and trigger automated responses.

**Configuration:**

```yaml
# Allama Splunk Integration Configuration
integration:
  name: splunk-production
  type: siem
  vendor: splunk
  
connection:
  host: splunk.example.com
  port: 8089
  protocol: https
  ssl_verify: true
  
authentication:
  method: token
  token: ${SPLUNK_HEC_TOKEN}
  
capabilities:
  - alert_ingestion
  - event_enrichment
  - search_execution
  - notable_event_update
```

**Use Case: Alert Enrichment and Triage**

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    Splunk Alert Enrichment Workflow                          │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐                   │
│  │   Splunk     │    │   Allama     │    │   Enrichment │                   │
│  │   Notable    │───▶│   Receives   │───▶│   Pipeline   │                   │
│  │   Event      │    │   Alert      │    │              │                   │
│  └──────────────┘    └──────────────┘    └──────┬───────┘                   │
│                                                  │                           │
│                    ┌─────────────────────────────┼─────────────────────────┐ │
│                    │                             │                         │ │
│                    ▼                             ▼                         ▼ │
│             ┌──────────────┐             ┌──────────────┐           ┌────────┐│
│             │   Asset      │             │   Threat     │           │  User  ││
│             │   Lookup     │             │   Intel      │           │  Context││
│             └──────────────┘             └──────────────┘           └────────┘│
│                    │                             │                         │ │
│                    └─────────────────────────────┼─────────────────────────┘ │
│                                                  │                           │
│                                                  ▼                           │
│                                          ┌──────────────┐                    │
│                                          │   Update     │                    │
│                                          │   Notable    │                    │
│                                          │   Event      │                    │
│                                          └──────────────┘                    │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

**Automated Actions:**

| Action | Description |
|--------|-------------|
| **Alert Ingestion** | Receive notable events via webhook or polling |
| **Asset Enrichment** | Look up affected assets in CMDB |
| **Threat Intel Lookup** | Query threat intelligence for IOCs |
| **User Context** | Retrieve user information from directory |
| **Notable Update** | Update Splunk notable event with findings |
| **Disposition** | Set alert status based on triage results |

---

### 2. EDR Integration

<p align="center">
  <img src="https://img.shields.io/badge/Integration-EDR-3B82F6?style=for-the-badge" alt="EDR Integration">
  <img src="https://img.shields.io/badge/Supported-CrowdStrike%20|%20SentinelOne%20|%20Carbon%20Black-8B5CF6?style=flat-square" alt="Supported EDRs">
</p>

#### CrowdStrike Integration Example

Allama integrates with CrowdStrike Falcon to receive detections and execute response actions on endpoints.

**Configuration:**

```yaml
# Allama CrowdStrike Integration Configuration
integration:
  name: crowdstrike-falcon
  type: edr
  vendor: crowdstrike
  
connection:
  base_url: https://api.crowdstrike.com
  
authentication:
  method: oauth2
  client_id: ${CROWDSTRIKE_CLIENT_ID}
  client_secret: ${CROWDSTRIKE_CLIENT_SECRET}
  
capabilities:
  - detection_ingestion
  - host_containment
  - process_kill
  - file_quarantine
  - real_time_response
```

**Use Case: Automated Endpoint Response**

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    CrowdStrike Response Workflow                             │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐                   │
│  │   Falcon     │    │   Allama     │    │   Severity   │                   │
│  │   Detection  │───▶│   Receives   │───▶│   Assessment │                   │
│  │              │    │   Alert      │    │              │                   │
│  └──────────────┘    └──────────────┘    └──────┬───────┘                   │
│                                                  │                           │
│                    ┌─────────────────────────────┼─────────────────────────┐ │
│                    │                             │                         │ │
│                    ▼                             ▼                         ▼ │
│             ┌──────────────┐             ┌──────────────┐           ┌────────┐│
│             │   Critical   │             │   High       │           │  Low/  ││
│             │   Severity   │             │   Severity   │           │  Medium││
│             └──────┬───────┘             └──────┬───────┘           └────────┘│
│                    │                            │                            │
│         ┌──────────┼──────────┐                 │                            │
│         │          │          │                 │                            │
│         ▼          ▼          ▼                 ▼                            │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────────┐                    │
│  │  Contain │ │  Kill    │ │  Collect │ │   Queue for  │                    │
│  │  Host    │ │  Process │ │  Forensics│ │   Review     │                    │
│  └──────────┘ └──────────┘ └──────────┘ └──────────────┘                    │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

**Automated Actions:**

| Action | API Endpoint | Description |
|--------|--------------|-------------|
| **Contain Host** | `/devices/entities/devices-actions/v2` | Network isolate the endpoint |
| **Kill Process** | `/real-time-response/entities/command/v1` | Terminate malicious process |
| **Quarantine File** | `/real-time-response/entities/command/v1` | Quarantine malicious file |
| **Collect Forensics** | `/real-time-response/entities/command/v1` | Gather memory dump and logs |
| **Lift Containment** | `/devices/entities/devices-actions/v2` | Restore network access |

---

### 3. Ticketing System Integration

<p align="center">
  <img src="https://img.shields.io/badge/Integration-Ticketing-3B82F6?style=for-the-badge" alt="Ticketing Integration">
  <img src="https://img.shields.io/badge/Supported-Jira%20|%20ServiceNow%20|%20PagerDuty-8B5CF6?style=flat-square" alt="Supported Ticketing">
</p>

#### Jira Integration Example

Allama integrates with Jira to create, update, and manage security incident tickets automatically.

**Configuration:**

```yaml
# Allama Jira Integration Configuration
integration:
  name: jira-security
  type: ticketing
  vendor: atlassian
  
connection:
  url: https://your-org.atlassian.net
  
authentication:
  method: api_token
  email: ${JIRA_EMAIL}
  api_token: ${JIRA_API_TOKEN}
  
defaults:
  project_key: SEC
  issue_type: Security Incident
  priority_mapping:
    critical: Highest
    high: High
    medium: Medium
    low: Low
```

**Use Case: Automated Incident Ticket Management**

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    Jira Ticket Management Workflow                           │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐                   │
│  │   Security   │    │   Allama     │    │   Check      │                   │
│  │   Alert      │───▶│   Processes  │───▶│   Existing   │                   │
│  │   Received   │    │   Alert      │    │   Tickets    │                   │
│  └──────────────┘    └──────────────┘    └──────┬───────┘                   │
│                                                  │                           │
│                    ┌─────────────────────────────┼─────────────────────────┐ │
│                    │                             │                         │ │
│                    ▼                             ▼                                │
│             ┌──────────────┐             ┌──────────────┐                   │
│             │   No Match   │             │   Match      │                   │
│             │   Found      │             │   Found      │                   │
│             └──────┬───────┘             └──────┬───────┘                   │
│                    │                            │                            │
│                    ▼                            ▼                            │
│             ┌──────────────┐             ┌──────────────┐                   │
│             │   Create     │             │   Update     │                   │
│             │   New        │             │   Existing   │                   │
│             │   Ticket     │             │   Ticket     │                   │
│             └──────┬───────┘             └──────┬───────┘                   │
│                    │                            │                            │
│                    └────────────────────────────┘                            │
│                                   │                                          │
│                                   ▼                                          │
│                           ┌──────────────┐                                   │
│                           │   Assign &   │                                   │
│                           │   Notify     │                                   │
│                           └──────────────┘                                   │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

**Ticket Template:**

```markdown
## Security Incident: {alert_title}

### Summary
{ai_generated_summary}

### Alert Details
| Field | Value |
|-------|-------|
| **Source** | {alert_source} |
| **Severity** | {severity} |
| **Detected** | {timestamp} |
| **Affected Assets** | {affected_assets} |

### Indicators of Compromise
{ioc_table}

### Recommended Actions
{ai_recommended_actions}

### Investigation Notes
{enrichment_results}

---
*This ticket was automatically created by Allama*
```

---

### 4. Cloud Platform Integration

<p align="center">
  <img src="https://img.shields.io/badge/Integration-Cloud-3B82F6?style=for-the-badge" alt="Cloud Integration">
  <img src="https://img.shields.io/badge/Supported-AWS%20|%20Azure%20|%20GCP-8B5CF6?style=flat-square" alt="Supported Clouds">
</p>

#### AWS Integration Example

Allama integrates with AWS to monitor cloud security events and execute automated remediation actions.

**Configuration:**

```yaml
# Allama AWS Integration Configuration
integration:
  name: aws-production
  type: cloud
  vendor: aws
  
connection:
  region: eu-west-1
  
authentication:
  method: iam_role
  role_arn: arn:aws:iam::123456789012:role/AllamaSecurityRole
  
services:
  - guardduty
  - securityhub
  - cloudtrail
  - iam
  - ec2
  - s3
```

**Use Case: AWS GuardDuty Response Automation**

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    AWS GuardDuty Response Workflow                           │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐                   │
│  │   GuardDuty  │    │   Allama     │    │   Finding    │                   │
│  │   Finding    │───▶│   Receives   │───▶│   Analysis   │                   │
│  │   Generated  │    │   Event      │    │              │                   │
│  └──────────────┘    └──────────────┘    └──────┬───────┘                   │
│                                                  │                           │
│                    ┌─────────────────────────────┼─────────────────────────┐ │
│                    │                             │                         │ │
│                    ▼                             ▼                         ▼ │
│             ┌──────────────┐             ┌──────────────┐           ┌────────┐│
│             │   EC2        │             │   IAM        │           │  S3    ││
│             │   Threat     │             │   Threat     │           │  Threat││
│             └──────┬───────┘             └──────┬───────┘           └───┬────┘│
│                    │                            │                       │    │
│                    ▼                            ▼                       ▼    │
│             ┌──────────────┐             ┌──────────────┐       ┌──────────┐ │
│             │   Isolate    │             │   Disable    │       │  Block   │ │
│             │   Instance   │             │   Access     │       │  Public  │ │
│             │              │             │   Keys       │       │  Access  │ │
│             └──────────────┘             └──────────────┘       └──────────┘ │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

**Automated Remediation Actions:**

| Finding Type | Automated Response |
|--------------|-------------------|
| **UnauthorizedAccess:EC2/SSHBruteForce** | Update security group to block attacker IP |
| **Recon:EC2/PortProbeUnprotectedPort** | Apply restrictive security group |
| **UnauthorizedAccess:IAMUser/ConsoleLogin** | Disable IAM user, rotate credentials |
| **Exfiltration:S3/MaliciousIPCaller** | Block public access, enable versioning |
| **CryptoCurrency:EC2/BitcoinTool.B** | Stop instance, snapshot for forensics |
| **Trojan:EC2/DNSDataExfiltration** | Isolate instance, capture network traffic |

**AWS Actions Available:**

| Service | Actions |
|---------|---------|
| **EC2** | Stop instance, modify security groups, create snapshot |
| **IAM** | Disable user, delete access keys, attach deny policy |
| **S3** | Block public access, enable encryption, modify bucket policy |
| **Lambda** | Disable function, update configuration |
| **Security Hub** | Update finding status, add notes |

---

## 📚 Workflow Templates

Allama includes pre-built workflow templates for common security automation scenarios. These templates can be customised to match your organisation's specific requirements.

### Available Templates

| Template | Category | Description |
|----------|----------|-------------|
| **Phishing Triage** | Email Security | Automated analysis and response to reported phishing |
| **Malware Response** | Endpoint Security | Containment and investigation of malware detections |
| **Suspicious Login** | Identity Security | Risk-based response to anomalous authentication |
| **Data Loss Prevention** | Data Security | Detection and response to data exfiltration |
| **Cloud Security** | Cloud Security | Automated remediation of cloud misconfigurations |
| **Vulnerability Triage** | Vulnerability Management | Prioritisation and assignment of vulnerabilities |
| **Threat Hunt** | Threat Intelligence | Proactive hunting based on threat intelligence |
| **Compliance Check** | Compliance | Automated compliance verification and reporting |

### Template Customisation

Each template can be customised through the Visual Workflow Designer:

1. **Import Template** — Select from the template library
2. **Configure Integrations** — Connect to your security tools
3. **Adjust Thresholds** — Set severity levels and triggers
4. **Customise Actions** — Modify response actions for your environment
5. **Test & Deploy** — Validate and activate the workflow

<p align="center">
  <a href="https://github.com/digitranslab/allama/wiki/templates"><img src="https://img.shields.io/badge/📚-View%20All%20Templates-8B5CF6?style=for-the-badge" alt="View Templates"></a>
</p>

---

## 🎯 Getting Started with Use Cases

Ready to implement these use cases in your environment? Follow these steps:

### Step 1: Assess Your Requirements

- Identify your most time-consuming security tasks
- Map your current security tool stack
- Define success metrics (response time, automation rate)

### Step 2: Start with Quick Wins

Begin with high-impact, low-complexity use cases:

| Use Case | Complexity | Impact |
|----------|------------|--------|
| Phishing Response | Low | High |
| Alert Enrichment | Low | Medium |
| Ticket Creation | Low | Medium |
| Malware Containment | Medium | High |
| Insider Threat | High | High |

### Step 3: Iterate and Expand

- Monitor workflow performance
- Gather feedback from security analysts
- Expand automation coverage gradually

---

## 📖 Related Documentation

| Document | Description |
|----------|-------------|
| [Overview](README.md) | Product overview, features, and benefits |
| [Architecture](ARCHITECTURE.md) | System design and components |
| [Quick Start](QUICKSTART.md) | Installation and configuration guide |

---

## 🔗 External Resources

<p align="center">
  <a href="https://github.com/digitranslab/allama"><img src="https://img.shields.io/badge/GitHub-Repository-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub Repository"></a>
  <a href="https://discord.com/invite/2mK6h9rp"><img src="https://img.shields.io/badge/Discord-Community-5865F2?style=for-the-badge&logo=discord&logoColor=white" alt="Discord"></a>
  <a href="https://github.com/digitranslab/allama/wiki"><img src="https://img.shields.io/badge/Wiki-Documentation-8B5CF6?style=for-the-badge&logo=gitbook&logoColor=white" alt="Wiki"></a>
</p>

---

<p align="center">
  <a href="README.md">📖 Back to Overview</a> •
  <a href="../../PRODUCTS.md">📦 Back to Products</a> •
  <a href="../../README.md">🏠 Back to Home</a>
</p>

<p align="center">
  <sub>© 2024 DigiTransLab. All rights reserved.</sub>
</p>
