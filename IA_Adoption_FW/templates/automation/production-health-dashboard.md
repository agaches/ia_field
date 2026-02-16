# Production Health Dashboard Template

> **Purpose**: SLA, cost, and quality metrics dashboard for production AI systems
> **Used in**: Automation Phase 3 (Run) - Monitor daily operations
> **Update frequency**: Real-time dashboard, review metrics weekly

---

## What is a Production Health Dashboard?

A production health dashboard provides at-a-glance visibility into AI system performance, cost, and reliability. It combines technical metrics (latency, errors), business metrics (user satisfaction, conversions), and operational metrics (cost, uptime).

**Key dashboard types**:
- **Executive Dashboard**: High-level KPIs (uptime, cost, business impact)
- **Operations Dashboard**: Technical metrics (latency, errors, throughput)
- **Business Dashboard**: User metrics (satisfaction, adoption, ROI)

**Benefits**:
- Early problem detection (before users complain)
- Trend analysis (improving or degrading?)
- SLA compliance tracking
- Cost optimization opportunities
- Data-driven decision making

---

## Dashboard Categories

### 1. SLA and Reliability Metrics

**Uptime / Availability**:
- **Metric**: Percentage of time system is operational
- **Target**: 99.9% (43 minutes downtime/month), 99.5% (3.6 hours/month), or 95% (36 hours/month)
- **Calculation**: `(Total time - Downtime) / Total time × 100`
- **Alert**: If uptime < target for 1 month

**API Success Rate**:
- **Metric**: Percentage of API requests that succeed (HTTP 2xx/3xx)
- **Target**: >99% (error rate <1%)
- **Calculation**: `Successful requests / Total requests × 100`
- **Alert**: If success rate <95% for 5 minutes

**API Latency** (P50, P95, P99):
- **Metric**: Response time percentiles
- **Target**: P95 <2 seconds (fast), <5 seconds (acceptable)
- **Calculation**: Measure time from request to response
- **Alert**: If P95 >2× target for 10 minutes

**Error Budget**:
- **Metric**: Remaining acceptable downtime this month
- **Target**: Track against SLA (e.g., 99.9% = 43 min/month budget)
- **Calculation**: `SLA budget - Actual downtime`
- **Alert**: If <20% budget remains with >7 days left in month

---

### 2. Business Impact Metrics

**User Satisfaction**:
- **Metric**: Post-interaction rating (1-5 stars, thumbs up/down)
- **Target**: >4.0/5 or >80% positive
- **Calculation**: Average rating or % positive
- **Alert**: If drops below 3.5/5 or <70% positive

**Adoption / Usage**:
- **Metric**: Daily/monthly active users, requests per day
- **Target**: Growing or stable (depends on business goals)
- **Calculation**: Count unique users or total requests
- **Alert**: If drops >20% week-over-week (unexpectedly)

**Conversion Impact** (if applicable):
- **Metric**: Conversion rate for AI-assisted vs non-AI users
- **Target**: AI-assisted ≥ baseline (or +X% improvement)
- **Calculation**: `Conversions / Users × 100`
- **Alert**: If AI-assisted <90% of baseline

**Task Completion Rate**:
- **Metric**: Percentage of user queries resolved by AI (vs escalated to human)
- **Target**: >70% (depends on use case)
- **Calculation**: `Resolved queries / Total queries × 100`
- **Alert**: If <60% resolution

**ROI**:
- **Metric**: Value generated vs cost (revenue, time saved, cost reduction)
- **Target**: ROI >200% (i.e., $3 value for $1 cost)
- **Calculation**: `(Value - Cost) / Cost × 100`
- **Alert**: If ROI <100% (losing money)

---

### 3. Cost Metrics

**Total Monthly Cost**:
- **Metric**: All AI system costs (compute, storage, APIs, tools)
- **Target**: Within budget (e.g., <$10k/month)
- **Calculation**: Sum of all line items
- **Alert**: If >110% of budget

**Cost per Request**:
- **Metric**: Average cost per API call or inference
- **Target**: Decreasing or stable (efficiency goal)
- **Calculation**: `Total cost / Total requests`
- **Alert**: If >2× expected cost

**Cost Breakdown**:
- **Metrics**: % of cost by category (LLM API, compute, storage, etc.)
- **Target**: No single category >70% (diversification)
- **Calculation**: `Category cost / Total cost × 100`
- **Alert**: Informational, used for optimization

**Cost Trends**:
- **Metric**: Cost growth rate (month-over-month, week-over-week)
- **Target**: Aligns with usage growth (not growing faster)
- **Calculation**: `(Current period - Previous period) / Previous period × 100`
- **Alert**: If cost grows >50% faster than usage

---

### 4. Quality and Performance Metrics

**Model Accuracy** (if measurable):
- **Metric**: Percentage of correct predictions (requires ground truth)
- **Target**: >80% (depends on use case)
- **Calculation**: `Correct predictions / Total predictions × 100`
- **Alert**: If drops >10% from baseline

**Confidence Distribution**:
- **Metric**: Percentage of predictions at various confidence levels
- **Target**: >70% high-confidence (>0.8), <10% low-confidence (<0.5)
- **Calculation**: Histogram of confidence scores
- **Alert**: If >20% low-confidence

**"I Don't Know" Rate**:
- **Metric**: Percentage of queries where AI cannot answer
- **Target**: <20% (depends on knowledge coverage)
- **Calculation**: `"Don't know" responses / Total queries × 100`
- **Alert**: If >30%

**Hallucination Rate** (for LLMs):
- **Metric**: Percentage of responses with factual errors (requires manual review or automated detection)
- **Target**: <5% (very low tolerance)
- **Calculation**: `Hallucinated responses / Sampled responses × 100`
- **Alert**: If >10%

---

## Dashboard Layouts

### Executive Dashboard (High-Level KPIs)

**Purpose**: For leadership, quick health check (1-2 minutes review)

```
┌─────────────────────────────────────────────────────────────┐
│  Production AI System Health - Executive View               │
│  Last 30 Days                                              │
└─────────────────────────────────────────────────────────────┘

┌─────────────┬─────────────┬─────────────┬─────────────────┐
│  Uptime     │  User Sat   │  Monthly    │  ROI            │
│  99.95%     │  4.3/5 ⭐   │  $8,245     │  310%           │
│  🟢 Target: │  🟢 Target: │  🟢 Budget: │  🟢 Target:     │
│  99.9%      │  >4.0       │  <$10k      │  >200%          │
└─────────────┴─────────────┴─────────────┴─────────────────┘

┌─────────────────────────────────────────────────────────────┐
│  Key Trends (vs Last Month)                                │
│  • Usage: +15% (10k → 11.5k requests/day)                  │
│  • Cost: +12% (cost growth < usage growth ✅)              │
│  • User Satisfaction: Stable (4.3 → 4.3)                   │
│  • Incidents: 1 P2 (API latency spike, resolved in 2h)     │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│  SLA Compliance                                             │
│  ████████████████████████████░░ 99.95% (Target: 99.9%) ✅  │
│  Error Budget: 2 minutes remaining (of 43 min/month)       │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│  Top Actions Needed                                         │
│  • None - all metrics healthy ✅                            │
└─────────────────────────────────────────────────────────────┘
```

---

### Operations Dashboard (Technical Metrics)

**Purpose**: For engineers, detailed system health (5-10 minutes review)

```
┌─────────────────────────────────────────────────────────────┐
│  Production AI System - Operations Dashboard                │
│  Real-time (last 15 minutes)                               │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│  API Health                                                 │
│  • Requests/sec: 45 (avg), 120 (peak)                      │
│  • Success Rate: 99.7% 🟢                                   │
│  • Error Rate: 0.3% (15 errors in last 15 min)             │
│  • Latency P50: 580ms | P95: 1.8s 🟢 | P99: 3.2s           │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│  Infrastructure                                             │
│  • ECS Tasks: 5/5 healthy                                  │
│  • CPU: 45% avg, 78% max                                   │
│  • Memory: 60% avg, 82% max                                │
│  • Database: 12 connections, 0.5ms query latency           │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│  Model Performance (last 24 hours)                          │
│  • Predictions: 65k                                        │
│  • Accuracy: 84% (spot-checked sample of 100) 🟢           │
│  • Confidence: 78% high (>0.8), 5% low (<0.5) 🟢           │
│  • "Don't Know" Rate: 12% 🟢                                │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│  Dependencies                                               │
│  • OpenAI API: 99.9% uptime, 1.2s latency 🟢               │
│  • Vector DB (pgvector): 100% uptime, 45ms query 🟢        │
│  • S3 (docs storage): 100% uptime 🟢                        │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│  Recent Alerts (last 24h)                                   │
│  • [12:45 PM] HighAPILatency (P95 2.5s) - Auto-resolved    │
│  • [08:30 AM] DiskUsage85% - Logs cleaned                  │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│  Latency Histogram (P95 over 24 hours)                     │
│  00:00 ██ 1.5s                                             │
│  06:00 ████ 2.1s                                           │
│  12:00 ███████ 2.5s ⚠️ (spike during lunch)                │
│  18:00 ████ 2.0s                                           │
│  Target: <2s ───────────────────────────────────           │
└─────────────────────────────────────────────────────────────┘
```

---

### Business Dashboard (User Metrics)

**Purpose**: For product managers, business impact (5 minutes review)

```
┌─────────────────────────────────────────────────────────────┐
│  AI Chatbot - Business Impact Dashboard                    │
│  Last 30 Days                                              │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│  User Engagement                                            │
│  • Daily Active Users: 3,200 (↑ 8% vs last month)          │
│  • Conversations/Day: 11,500 (↑ 15% vs last month)         │
│  • Avg Messages/Conversation: 3.6                          │
│  • Return Rate: 68% (users who return within 7 days)       │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│  User Satisfaction                                          │
│  • Overall Rating: 4.3/5 ⭐⭐⭐⭐ (from 1,200 responses)     │
│  • Positive: 82% 👍 | Negative: 18% 👎                     │
│  • Trend: Stable (4.3 last month → 4.3 this month)         │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│  Task Resolution                                            │
│  • Resolved by AI: 75% (8,625 / 11,500 conversations)      │
│  • Escalated to Human: 25% (2,875 conversations)           │
│  • Target: >70% AI resolution 🟢                            │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│  Business Impact                                            │
│  • Support Tickets Deflected: 6,450 (est. from AI resol.)  │
│  • Agent Time Saved: 1,075 hours (@ 10 min/ticket avg)     │
│  • Cost Savings: $32,250 (@ $30/hr agent cost)             │
│  • AI System Cost: $8,245                                  │
│  • Net Savings: $24,005 🟢                                  │
│  • ROI: 290% 🟢                                             │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│  Top User Questions (last 7 days)                           │
│  1. "How do I reset my password?" (1,200 times)            │
│  2. "What are the pricing plans?" (850 times)              │
│  3. "How do I cancel my subscription?" (600 times)         │
│  4. "Product setup instructions" (550 times)               │
│  5. "Refund policy" (420 times)                            │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│  Growth Trend (Daily Conversations)                         │
│  Week 1: ████████ 8,500                                    │
│  Week 2: █████████ 9,200                                   │
│  Week 3: ██████████ 10,800                                 │
│  Week 4: ███████████ 11,500 📈                              │
└─────────────────────────────────────────────────────────────┘
```

---

## Metric Collection Methods

### API Metrics (Latency, Errors, Throughput)
**Tool**: Application instrumentation + monitoring platform
```python
# Example: Python Flask + Prometheus
from prometheus_client import Counter, Histogram, generate_latest
import time

request_count = Counter('api_requests_total', 'Total API requests', ['method', 'endpoint', 'status'])
request_latency = Histogram('api_request_duration_seconds', 'Request latency')

@app.route('/api/chat', methods=['POST'])
def chat():
    start_time = time.time()
    try:
        # Process request
        response = process_chat(request.json)
        request_count.labels(method='POST', endpoint='/api/chat', status='200').inc()
        return response, 200
    except Exception as e:
        request_count.labels(method='POST', endpoint='/api/chat', status='500').inc()
        raise
    finally:
        request_latency.observe(time.time() - start_time)
```

### Model Performance (Accuracy, Confidence)
**Tool**: Logging + batch processing
```python
# Log predictions for offline analysis
import logging

def predict(input_data):
    prediction = model.predict(input_data)
    confidence = prediction['confidence']

    logger.info({
        'timestamp': time.time(),
        'input': input_data,
        'prediction': prediction['label'],
        'confidence': confidence
    })

    return prediction

# Daily batch job to calculate accuracy
def calculate_daily_accuracy():
    logs = fetch_logs_last_24h()
    # Sample 100 predictions, manually verify accuracy
    sample = random.sample(logs, 100)
    correct = sum(1 for log in sample if manual_verify(log))
    accuracy = correct / len(sample)
    push_metric('model_accuracy', accuracy)
```

### User Satisfaction
**Tool**: Post-interaction survey
```python
# After conversation ends, prompt user for feedback
def end_conversation(conversation_id):
    send_to_user({
        'message': 'How would you rate this conversation?',
        'options': ['⭐', '⭐⭐', '⭐⭐⭐', '⭐⭐⭐⭐', '⭐⭐⭐⭐⭐'],
        'callback': lambda rating: log_satisfaction(conversation_id, rating)
    })
```

### Cost Tracking
**Tool**: Cloud billing APIs + custom tracking
```python
# Poll AWS Cost Explorer API daily
import boto3

def track_daily_cost():
    ce = boto3.client('ce')
    response = ce.get_cost_and_usage(
        TimePeriod={'Start': '2026-02-01', 'End': '2026-02-15'},
        Granularity='DAILY',
        Metrics=['UnblendedCost'],
        Filter={
            'Tags': {'Key': 'Project', 'Values': ['chatbot']}
        }
    )
    # Push to monitoring dashboard
    for day in response['ResultsByTime']:
        cost = float(day['Total']['UnblendedCost']['Amount'])
        push_metric('daily_cost', cost, timestamp=day['TimePeriod']['Start'])
```

---

## Dashboard Implementation

### Option 1: Grafana (Open Source)
**Pros**: Flexible, customizable, free, integrates with Prometheus/CloudWatch/Datadog
**Setup**:
1. Install Grafana (Docker, Kubernetes, or cloud-hosted)
2. Connect data sources (Prometheus, CloudWatch, database)
3. Create dashboards (use templates as starting point)
4. Share dashboards with team

**Example Grafana Dashboard JSON**: (import into Grafana)
```json
{
  "dashboard": {
    "title": "AI System Health",
    "panels": [
      {
        "title": "API Success Rate",
        "type": "stat",
        "targets": [
          {
            "expr": "rate(api_requests_total{status=~'2..'}[5m]) / rate(api_requests_total[5m]) * 100"
          }
        ],
        "thresholds": [
          {"value": 95, "color": "red"},
          {"value": 99, "color": "yellow"},
          {"value": 99.9, "color": "green"}
        ]
      }
    ]
  }
}
```

### Option 2: Datadog / New Relic / Dynatrace (SaaS)
**Pros**: Turnkey solution, advanced features (APM, log correlation), alerting built-in
**Cons**: Cost (can be expensive at scale)
**Setup**: Install agent, configure dashboards, set up alerts

### Option 3: Cloud-Native (AWS CloudWatch, GCP Cloud Monitoring, Azure Monitor)
**Pros**: Integrated with cloud services, no additional infrastructure
**Cons**: Less flexible than Grafana, vendor lock-in
**Setup**: Enable CloudWatch/Cloud Monitoring, create custom dashboards

### Option 4: Custom Dashboard (Streamlit, Dash, or Web App)
**Pros**: Full control, custom logic, embed in internal tools
**Cons**: Maintenance overhead
**Example**: Streamlit dashboard
```python
import streamlit as st
import pandas as pd

st.title("AI System Health Dashboard")

# Fetch metrics from database
metrics = fetch_metrics()

col1, col2, col3 = st.columns(3)
col1.metric("Uptime", f"{metrics['uptime']}%", delta=f"{metrics['uptime_change']}%")
col2.metric("User Satisfaction", f"{metrics['satisfaction']}/5", delta=f"{metrics['satisfaction_change']}")
col3.metric("Monthly Cost", f"${metrics['cost']}", delta=f"${metrics['cost_change']}")

st.line_chart(metrics['latency_over_time'])
```

---

## Dashboard Review Cadence

**Daily** (5 minutes):
- Check alerts (any incidents?)
- Verify key metrics green (uptime, errors, latency)
- Spot-check recent changes (deployments, config)

**Weekly** (30 minutes):
- Review trends (usage, cost, satisfaction)
- Identify anomalies (spikes, drops, unusual patterns)
- Discuss in team standup

**Monthly** (2 hours):
- Deep dive into metrics (month-over-month comparison)
- SLA review (did we meet targets?)
- Cost optimization (where can we reduce spend?)
- Business impact review (ROI, user growth)
- Update forecasts (usage, cost, capacity)

**Quarterly** (4 hours):
- Strategic review (are metrics aligned with business goals?)
- Dashboard improvements (add/remove metrics, adjust thresholds)
- Benchmark against industry (are we competitive?)
- Plan for next quarter (OKRs, investments)

---

## Blank Dashboard Template

Copy for your project:

```markdown
# Production Health Dashboard - [System]

## Executive View (High-Level KPIs)
- Uptime: [X%] (Target: [Y%])
- User Satisfaction: [X/5] (Target: [Y/5])
- Monthly Cost: $[X] (Budget: $[Y])
- ROI: [X%] (Target: [Y%])

## Operations View (Technical Metrics)
- API Success Rate: [X%]
- Latency P95: [X ms/s]
- Error Rate: [X%]
- Infrastructure: [Healthy/Degraded/Down]

## Business View (User Metrics)
- Daily Active Users: [X]
- Conversations/Day: [X]
- Task Resolution: [X%]
- Business Impact: $[X] savings or revenue

## Alerts (Last 24h)
- [List recent alerts and status]

## Trends
- [Key trends vs last period]

## Action Items
- [Top actions needed based on metrics]
```

---

## Related Templates

- [Model Performance Dashboard](model-performance-dashboard.md) - Model-specific metrics (accuracy, drift)
- [Production Cost Dashboard](production-cost-dashboard.md) - Detailed cost breakdown and optimization
- [Production Alerting Runbook](production-alerting-runbook.md) - Alert definitions and response procedures
- [Quarterly System Review](quarterly-system-review.md) - Periodic deep-dive review
- [MLOps Maturity Assessment](mlops-maturity-assessment.md) - Monitoring maturity evaluation
