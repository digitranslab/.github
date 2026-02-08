# 🔐 Allama

<p align="center">
  <img src="https://img.shields.io/badge/Status-Available-success?style=for-the-badge" alt="Available">
  <img src="https://img.shields.io/badge/Type-AI--Native%20SOAR%20Platform-8B5CF6?style=for-the-badge" alt="AI-Native SOAR Platform">
  <img src="https://img.shields.io/badge/Licence-AGPL--3.0-3B82F6?style=for-the-badge" alt="AGPL-3.0">
</p>

<p align="center">
  <a href="../../README.md">🏠 Home</a> •
  <a href="../../PRODUCTS.md">📦 Products</a> •
  <a href="ARCHITECTURE.md">🏗️ Architecture</a> •
  <a href="QUICKSTART.md">🚀 Quick Start</a> •
  <a href="USE-CASES.md">📋 Use Cases</a>
</p>

---

## Overview

**Allama** is an open-source, AI-native security orchestration, automation, and response (SOAR) platform built for modern Security Operations Centres. It enables security teams to automate threat detection, investigation, and response using visual workflows and autonomous AI agents.

> **"Open-source AI security automation that turns 15-minute investigations into 30-second workflows."**

<p align="center">
  <a href="https://github.com/digitranslab/allama">
    <img src="https://img.shields.io/badge/GitHub-Repository-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub Repository">
  </a>
  <img src="https://img.shields.io/badge/Deployment-Self--Hosted-8B5CF6?style=for-the-badge" alt="Self-Hosted">
</p>

---

## 🎯 Key Highlight

<p align="center">
  <img src="https://img.shields.io/badge/⚡%20Triage%20Time-97%25%20Reduction-success?style=for-the-badge" alt="97% Reduction in Triage Time">
</p>

> **Achieve a 97% reduction in phishing triage time** — from 15 minutes to 30 seconds — by automating investigation workflows with AI agents.

---

## ✨ Features

Allama provides a comprehensive suite of features designed to streamline security operations:

| Feature | Description |
|---------|-------------|
| 🎨 **Visual Workflow Builder** | Drag-and-drop interface for building security automation playbooks. Canvas-based design with real-time validation, YAML export, and conditional logic. |
| 🤖 **AI Agents & LLM Integration** | Native integration with OpenAI, Anthropic, Azure, Google, and Ollama. Autonomous agents that investigate alerts, generate queries, and write reports. |
| 🔗 **80+ Integrations** | Connect with SIEMs (Splunk, Elastic), EDRs (CrowdStrike, SentinelOne), identity providers (Okta, Entra ID), ticketing (Jira, PagerDuty), and threat intel (VirusTotal, URLScan). |
| 📋 **Case Management** | Track security incidents from detection to resolution with custom fields, task assignment, evidence collection, and audit trails. |
| 🏠 **Self-Hosted Deployment** | Deploy on your own infrastructure for complete data sovereignty. 5-minute setup with Docker Compose, production-ready with AWS ECS. |

---

## 🛠️ Technical Architecture

Built on enterprise-grade infrastructure:

| Component | Technology | Purpose |
|-----------|------------|---------|
| **Frontend** | Next.js | Modern, responsive UI |
| **Backend** | FastAPI | High-performance Python API |
| **Workflow Engine** | Temporal | Enterprise workflow orchestration |
| **Database** | PostgreSQL | Reliable, scalable data storage |
| **Cache** | Redis | Session and cache management |

```
┌─────────────────────────────────────────────────────────────┐
│                        Allama Platform                       │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐  │
│  │   Next.js   │  │   FastAPI   │  │   Temporal Worker   │  │
│  │  Frontend   │  │   Backend   │  │  (Workflow Engine)  │  │
│  └─────────────┘  └─────────────┘  └─────────────────────┘  │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────────────────────────────────────────────────┐│
│  │              Integration Layer (80+ Tools)              ││
│  │  SIEM │ EDR │ Identity │ Ticketing │ Threat Intel │ AI  ││
│  └─────────────────────────────────────────────────────────┘│
└─────────────────────────────────────────────────────────────┘
```

---

## 🔗 Integrations

Allama integrates with **80+ security tools and platforms**:

| Category | Tools |
|----------|-------|
| **SIEM** | Splunk, Elastic Security, Datadog, Wazuh |
| **EDR** | CrowdStrike, SentinelOne |
| **Identity** | Okta, Microsoft Entra ID, Google Workspace, LDAP |
| **Ticketing** | Jira, Zendesk, PagerDuty, Rootly |
| **Communication** | Slack, Microsoft Teams, Email (SMTP) |
| **Threat Intel** | VirusTotal, URLScan, IPInfo, CrowdSec, ThreatStream |
| **Cloud** | AWS, Google Cloud, Azure |

---

## 📈 Benefits

### Why Choose Allama?

<table>
  <tr>
    <td align="center" width="25%">
      <h3>⚡ 97% Faster</h3>
      <p>Reduce phishing triage from 15 minutes to 30 seconds</p>
    </td>
    <td align="center" width="25%">
      <h3>🤖 AI-Native</h3>
      <p>Built-in LLM integration for autonomous investigation</p>
    </td>
    <td align="center" width="25%">
      <h3>🔓 Open Source</h3>
      <p>100% open source under AGPL-3.0, no vendor lock-in</p>
    </td>
    <td align="center" width="25%">
      <h3>🔒 Self-Hosted</h3>
      <p>Your data stays on your infrastructure</p>
    </td>
  </tr>
</table>

---

## 🚀 Getting Started

Ready to transform your security operations? Get started with Allama:

1. **📖 Read the [Quick Start Guide](QUICKSTART.md)** — Installation and configuration instructions
2. **🏗️ Explore the [Architecture](ARCHITECTURE.md)** — Understand how Allama works
3. **📋 Review [Use Cases](USE-CASES.md)** — See real-world security automation scenarios
4. **💻 Visit the [Repository](https://github.com/digitranslab/allama)** — Access the source code

<p align="center">
  <a href="QUICKSTART.md"><img src="https://img.shields.io/badge/🚀-Get%20Started-8B5CF6?style=for-the-badge" alt="Get Started"></a>
  <a href="https://github.com/digitranslab/allama"><img src="https://img.shields.io/badge/💻-View%20Repository-181717?style=for-the-badge&logo=github" alt="View Repository"></a>
</p>

---

## 📖 Documentation

| Document | Description |
|----------|-------------|
| [Architecture](ARCHITECTURE.md) | System design, components, and data flow |
| [Quick Start](QUICKSTART.md) | Installation and configuration guide |
| [Use Cases](USE-CASES.md) | Real-world security automation scenarios |

---

## 🤝 Community & Support

Join our community and get support:

<p align="center">
  <a href="https://discord.com/invite/2mK6h9rp"><img src="https://img.shields.io/badge/Discord-Join%20Community-5865F2?style=for-the-badge&logo=discord&logoColor=white" alt="Discord"></a>
  <a href="https://github.com/digitranslab/allama/issues"><img src="https://img.shields.io/badge/GitHub-Report%20Issues-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub Issues"></a>
</p>

---

## 📚 Related Documentation

- [🏠 DigiTransLab Home](../../README.md)
- [📦 All Products](../../PRODUCTS.md)
- [💼 Services](../../SERVICES.md)
- [🔧 Technology Stack](../../TECHNOLOGY.md)

---

<p align="center">
  <a href="../../README.md">🏠 Back to Home</a> •
  <a href="../../PRODUCTS.md">📦 Back to Products</a>
</p>

<p align="center">
  <sub>© 2025 DigiTransLab. All rights reserved.</sub>
</p>
