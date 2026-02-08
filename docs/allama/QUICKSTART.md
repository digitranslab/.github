# 🚀 Allama Quick Start Guide

<p align="center">
  <img src="https://img.shields.io/badge/Document-Quick%20Start-8B5CF6?style=for-the-badge" alt="Quick Start">
  <img src="https://img.shields.io/badge/Status-Available-success?style=for-the-badge" alt="Available">
</p>

<p align="center">
  <a href="../../README.md">🏠 Home</a> •
  <a href="../../PRODUCTS.md">📦 Products</a> •
  <a href="README.md">📖 Overview</a> •
  <a href="ARCHITECTURE.md">🏗️ Architecture</a> •
  <a href="USE-CASES.md">📋 Use Cases</a>
</p>

---

## Overview

This guide will help you get **Allama** up and running quickly. Follow these steps to install, configure, and create your first security automation workflow.

---

## 📋 Table of Contents

- [Prerequisites](#-prerequisites)
- [Installation](#-installation)
  - [Docker Installation (Recommended)](#docker-installation-recommended)
  - [Manual Installation](#manual-installation)
- [Configuration](#-configuration)
  - [Environment Variables](#environment-variables)
  - [Integrations Setup](#integrations-setup)
- [First Steps](#-first-steps)
  - [Creating Your First Workflow](#1-creating-your-first-workflow)
  - [Testing Your Workflow](#2-testing-your-workflow)
  - [Monitoring and Logs](#3-monitoring-and-logs)
- [Next Steps](#-next-steps)

---

## 📦 Prerequisites

Before installing Allama, ensure your system meets the following requirements:

| Requirement | Minimum | Recommended |
|-------------|---------|-------------|
| **CPU** | 4 cores | 8+ cores |
| **Memory** | 16 GB RAM | 32+ GB RAM |
| **Storage** | 100 GB SSD | 500+ GB SSD |
| **OS** | Linux (Ubuntu 20.04+, RHEL 8+) | Ubuntu 22.04, RHEL 9 |
| **Docker** | 20.10+ | Latest stable |
| **Docker Compose** | 2.0+ | Latest stable |

### Additional Requirements

- Network access to your security tools (SIEMs, EDRs, etc.)
- Valid API credentials for integrations
- SSL/TLS certificates (for production deployments)

---

## 🔧 Installation

Allama supports two installation methods: **Docker** (recommended) and **Manual** installation.

### Docker Installation (Recommended)

Docker provides the simplest and most reliable way to deploy Allama.

#### Step 1: Clone the Repository

```bash
git clone https://github.com/digitranslab/allama.git
cd allama
```

#### Step 2: Configure Environment

Copy the example environment file and customise it:

```bash
cp .env.example .env
```

Edit the `.env` file with your configuration (see [Environment Variables](#environment-variables) section).

#### Step 3: Start Allama

```bash
docker-compose up -d
```

#### Step 4: Verify Installation

Check that all containers are running:

```bash
docker-compose ps
```

You should see output similar to:

```
NAME                STATUS              PORTS
allama-web          running             0.0.0.0:8080->8080/tcp
allama-worker       running             
allama-scheduler    running             
allama-db           running             5432/tcp
allama-redis        running             6379/tcp
```

#### Step 5: Access the Web Interface

Open your browser and navigate to:

```
https://localhost:8080
```

Default credentials:
- **Username:** `admin@allama.local`
- **Password:** `changeme` (change this immediately!)

---

### Manual Installation

For environments where Docker is not available, follow these steps for manual installation.

#### Step 1: Install System Dependencies

**Ubuntu/Debian:**

```bash
sudo apt update
sudo apt install -y python3.10 python3.10-venv python3-pip \
    postgresql-14 redis-server nginx
```

**RHEL/CentOS:**

```bash
sudo dnf install -y python3.10 python3-pip \
    postgresql-server redis nginx
```

#### Step 2: Set Up PostgreSQL

```bash
sudo -u postgres createuser allama
sudo -u postgres createdb allama -O allama
sudo -u postgres psql -c "ALTER USER allama WITH PASSWORD 'your_secure_password';"
```

#### Step 3: Clone and Configure

```bash
git clone https://github.com/digitranslab/allama.git
cd allama

python3.10 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

#### Step 4: Configure Environment

```bash
cp .env.example .env
# Edit .env with your database and Redis connection details
```

#### Step 5: Initialise Database

```bash
python manage.py migrate
python manage.py createsuperuser
```

#### Step 6: Start Services

```bash
# Start the web server
gunicorn allama.wsgi:application --bind 0.0.0.0:8080 &

# Start the worker
celery -A allama worker --loglevel=info &

# Start the scheduler
celery -A allama beat --loglevel=info &
```

---

## ⚙️ Configuration

### Environment Variables

Configure Allama by setting the following environment variables in your `.env` file:

#### Core Settings

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| `SECRET_KEY` | Application secret key for encryption | - | ✅ Yes |
| `DEBUG` | Enable debug mode (set to `false` in production) | `false` | No |
| `ALLOWED_HOSTS` | Comma-separated list of allowed hostnames | `localhost` | ✅ Yes |
| `TIMEZONE` | Server timezone | `UTC` | No |

#### Database Configuration

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| `DATABASE_URL` | PostgreSQL connection string | - | ✅ Yes |
| `DATABASE_POOL_SIZE` | Connection pool size | `10` | No |

Example:
```bash
DATABASE_URL=postgresql://allama:password@localhost:5432/allama
```

#### Redis Configuration

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| `REDIS_URL` | Redis connection string | - | ✅ Yes |
| `REDIS_CACHE_TTL` | Cache time-to-live (seconds) | `3600` | No |

Example:
```bash
REDIS_URL=redis://localhost:6379/0
```

#### Security Settings

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| `SSL_ENABLED` | Enable SSL/TLS | `true` | No |
| `SSL_CERT_PATH` | Path to SSL certificate | - | If SSL enabled |
| `SSL_KEY_PATH` | Path to SSL private key | - | If SSL enabled |
| `SESSION_TIMEOUT` | Session timeout (minutes) | `60` | No |

#### Logging Configuration

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| `LOG_LEVEL` | Logging level (DEBUG, INFO, WARNING, ERROR) | `INFO` | No |
| `LOG_FILE` | Path to log file | `/var/log/allama/app.log` | No |

---

### Integrations Setup

Allama connects to your existing security tools through the **Integration Hub**. Configure integrations via the web interface or environment variables.

#### Configuring Integrations via Web Interface

1. Navigate to **Settings** → **Integrations**
2. Select the integration category (SIEM, EDR, Ticketing, etc.)
3. Click **Add Integration**
4. Enter the required credentials and configuration
5. Click **Test Connection** to verify
6. Click **Save**

#### Common Integration Examples

<details>
<summary><strong>🔍 Splunk Integration</strong></summary>

| Setting | Description |
|---------|-------------|
| **Host** | Splunk server hostname or IP |
| **Port** | Splunk management port (default: 8089) |
| **Username** | Splunk admin username |
| **Password** | Splunk admin password |
| **SSL Verify** | Verify SSL certificates |

```bash
# Environment variables
SPLUNK_HOST=splunk.example.com
SPLUNK_PORT=8089
SPLUNK_USERNAME=admin
SPLUNK_PASSWORD=your_password
SPLUNK_SSL_VERIFY=true
```

</details>

<details>
<summary><strong>🛡️ CrowdStrike Integration</strong></summary>

| Setting | Description |
|---------|-------------|
| **Client ID** | CrowdStrike API client ID |
| **Client Secret** | CrowdStrike API client secret |
| **Base URL** | CrowdStrike API base URL |

```bash
# Environment variables
CROWDSTRIKE_CLIENT_ID=your_client_id
CROWDSTRIKE_CLIENT_SECRET=your_client_secret
CROWDSTRIKE_BASE_URL=https://api.crowdstrike.com
```

</details>

<details>
<summary><strong>📋 Jira Integration</strong></summary>

| Setting | Description |
|---------|-------------|
| **URL** | Jira instance URL |
| **Username** | Jira username or email |
| **API Token** | Jira API token |
| **Project Key** | Default project for tickets |

```bash
# Environment variables
JIRA_URL=https://your-org.atlassian.net
JIRA_USERNAME=your_email@example.com
JIRA_API_TOKEN=your_api_token
JIRA_PROJECT_KEY=SEC
```

</details>

<details>
<summary><strong>☁️ AWS Integration</strong></summary>

| Setting | Description |
|---------|-------------|
| **Access Key ID** | AWS access key ID |
| **Secret Access Key** | AWS secret access key |
| **Region** | Default AWS region |

```bash
# Environment variables
AWS_ACCESS_KEY_ID=your_access_key
AWS_SECRET_ACCESS_KEY=your_secret_key
AWS_DEFAULT_REGION=eu-west-1
```

</details>

---

## 🎯 First Steps

Now that Allama is installed and configured, let's create your first security automation workflow.

### 1. Creating Your First Workflow

Follow these steps to create a simple alert triage workflow:

#### Step 1: Access the Workflow Designer

1. Log in to the Allama web interface
2. Navigate to **Workflows** → **Create New**
3. Give your workflow a name: `My First Alert Triage`

#### Step 2: Add a Trigger

1. From the left panel, drag the **Alert Trigger** node onto the canvas
2. Configure the trigger:
   - **Source:** Select your SIEM integration
   - **Alert Type:** `All Alerts` (or specify a type)
   - **Severity Filter:** `Medium` and above

#### Step 3: Add AI Triage

1. Drag the **AI Triage** node onto the canvas
2. Connect it to the Alert Trigger
3. Configure triage settings:
   - **Analysis Depth:** `Standard`
   - **Enrichment Sources:** Enable threat intelligence lookups

#### Step 4: Add Decision Branch

1. Drag a **Decision** node onto the canvas
2. Connect it to the AI Triage output
3. Configure conditions:
   - **If** priority is `High` → Route to immediate response
   - **Else** → Route to standard queue

#### Step 5: Add Response Actions

1. For high-priority alerts, add:
   - **Create Ticket** node (Jira/ServiceNow)
   - **Send Notification** node (Slack/Email)
2. For standard alerts, add:
   - **Add to Queue** node

#### Step 6: Save and Activate

1. Click **Save** to save your workflow
2. Click **Activate** to enable the workflow

<p align="center">
  <img src="https://img.shields.io/badge/✅-Workflow%20Created-success?style=for-the-badge" alt="Workflow Created">
</p>

---

### 2. Testing Your Workflow

Before deploying to production, test your workflow with sample data:

#### Using the Test Console

1. Navigate to **Workflows** → Select your workflow
2. Click **Test** in the toolbar
3. Choose a test method:
   - **Sample Alert:** Use a pre-defined test alert
   - **Custom JSON:** Provide your own alert data
   - **Live Alert:** Use a recent alert from your SIEM

#### Example Test Alert

```json
{
  "alert_id": "TEST-001",
  "source": "splunk",
  "severity": "high",
  "title": "Suspicious Login Attempt",
  "description": "Multiple failed login attempts detected from IP 192.168.1.100",
  "timestamp": "2024-01-15T10:30:00Z",
  "indicators": {
    "source_ip": "192.168.1.100",
    "username": "admin",
    "failed_attempts": 15
  }
}
```

#### Reviewing Test Results

After running a test:

1. View the **Execution Log** to see each step
2. Check **Node Outputs** for data transformations
3. Verify **Actions Taken** (tickets created, notifications sent)
4. Review **AI Triage Results** for accuracy

---

### 3. Monitoring and Logs

Keep track of your workflows and system health:

#### Dashboard Overview

Navigate to **Dashboard** to view:

- **Active Workflows:** Number of enabled workflows
- **Alerts Processed:** Total alerts handled today
- **Response Time:** Average time to process alerts
- **Success Rate:** Percentage of successful executions

#### Viewing Execution Logs

1. Navigate to **Logs** → **Workflow Executions**
2. Filter by:
   - **Workflow Name**
   - **Date Range**
   - **Status** (Success, Failed, Pending)
3. Click on any execution to view detailed logs

#### System Health

Monitor system health at **Settings** → **System Status**:

| Component | Status Indicators |
|-----------|-------------------|
| **Web Server** | Response time, active connections |
| **Worker** | Queue depth, processing rate |
| **Database** | Connection pool, query performance |
| **Redis** | Memory usage, cache hit rate |
| **Integrations** | Connection status, API health |

---

## 🚀 Next Steps

Congratulations! You've successfully installed Allama and created your first workflow. Here's what to explore next:

### Recommended Reading

| Document | Description |
|----------|-------------|
| [Architecture](ARCHITECTURE.md) | Deep dive into system components |
| [Use Cases](USE-CASES.md) | Real-world automation scenarios |
| [Integration Guide](https://github.com/digitranslab/allama/wiki/integrations) | Detailed integration documentation |

### Advanced Topics

- **Custom Integrations:** Build connectors for proprietary tools
- **Workflow Templates:** Use pre-built templates for common scenarios
- **API Access:** Automate Allama via REST API
- **High Availability:** Configure redundant deployments

### Get Help

<p align="center">
  <a href="https://discord.com/invite/2mK6h9rp"><img src="https://img.shields.io/badge/Discord-Join%20Community-5865F2?style=for-the-badge&logo=discord&logoColor=white" alt="Discord"></a>
  <a href="https://github.com/digitranslab/allama/issues"><img src="https://img.shields.io/badge/GitHub-Report%20Issues-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub Issues"></a>
  <a href="https://github.com/digitranslab/allama/discussions"><img src="https://img.shields.io/badge/GitHub-Discussions-181717?style=for-the-badge&logo=github&logoColor=white" alt="Discussions"></a>
</p>

---

## 📖 Related Documentation

- [🏠 DigiTransLab Home](../../README.md)
- [📦 All Products](../../PRODUCTS.md)
- [📖 Allama Overview](README.md)
- [🏗️ Architecture](ARCHITECTURE.md)
- [📋 Use Cases](USE-CASES.md)

---

<p align="center">
  <a href="README.md">📖 Back to Overview</a> •
  <a href="../../PRODUCTS.md">📦 Back to Products</a> •
  <a href="../../README.md">🏠 Back to Home</a>
</p>

<p align="center">
  <sub>© 2025 DigiTransLab. All rights reserved.</sub>
</p>
