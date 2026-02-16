# Production Cost Dashboard

> **Purpose**: Track and optimize AI system costs by category
> **Used in**: Automation Phase 3 (Run) - Monitor spending and optimize
> **Update frequency**: Real-time dashboard, review weekly or monthly

---

## What is a Production Cost Dashboard?

A production cost dashboard tracks all AI system expenses: compute (GPU/CPU), storage, LLM API calls, tools, and networking. It enables cost optimization by identifying expensive components and tracking cost trends.

**Key goals**:
- Stay within budget
- Optimize cost efficiency (reduce cost per request/user)
- Forecast future costs (capacity planning)
- Justify AI investment (show ROI)

**Cost categories**:
- **Compute**: Training (GPU/TPU), inference (CPU/GPU), orchestration
- **Storage**: Training data, models, logs, backups
- **LLM APIs**: OpenAI, Anthropic, Cohere, etc. (pay-per-token)
- **Tools**: MLflow, Weights & Biases, monitoring (Datadog, New Relic)
- **Networking**: Data transfer, API Gateway, load balancers

---

## Cost Metrics

### 1. Total Monthly Cost

**Metric**: Total AI system spend per month
**Target**: Within budget (e.g., <$10k/month)
**Breakdown**: By category (compute, storage, APIs, tools)

**Example**:
- Compute: $5,000 (50%)
- LLM APIs: $2,500 (25%)
- Storage: $1,000 (10%)
- Tools: $1,000 (10%)
- Networking: $500 (5%)
- **Total**: $10,000/month ✅ (within $10k budget)

---

### 2. Cost per Request

**Metric**: Average cost per API call or inference
**Target**: Decreasing or stable (efficiency goal)
**Calculation**: `Total cost / Total requests`

**Example**:
- Total cost: $10,000/month
- Total requests: 1,000,000/month
- **Cost per request**: $0.01 (1 cent per request)

**Trends**:
- If cost per request increasing → Investigate inefficiencies
- If cost per request decreasing → Good (scaling efficiently)

---

### 3. Cost per User

**Metric**: Average cost per active user
**Target**: <$X per user (depends on business model)
**Calculation**: `Total cost / Monthly active users`

**Example**:
- Total cost: $10,000/month
- Active users: 5,000/month
- **Cost per user**: $2/user

**Benchmark**:
- If revenue per user >cost per user → Profitable
- If revenue per user <cost per user → Need to optimize or increase prices

---

### 4. Cost Breakdown by Category

**Metric**: Percentage of cost by category
**Target**: No single category >70% (diversification reduces risk)

**Example**:
- Compute: 50% ($5k)
- LLM APIs: 25% ($2.5k)
- Storage: 10% ($1k)
- Tools: 10% ($1k)
- Networking: 5% ($0.5k)

**Red flags**:
- LLM APIs >80% → Over-reliant on external APIs (price increase risk)
- Compute >90% → May need model compression or infrastructure optimization

---

### 5. Cost Trends

**Metric**: Month-over-month or week-over-week cost growth
**Target**: Aligns with usage growth (not growing faster)

**Example**:
- Last month: $8,000
- This month: $10,000
- **Growth**: +25%
- Usage growth: +30%
- **Status**: ✅ Good (cost growing slower than usage)

**Red flags**:
- Cost growing faster than usage → Inefficiency
- Cost growing without usage growth → Waste or abuse

---

### 6. Forecast

**Metric**: Projected costs for next 3-6 months
**Target**: Within budget constraints
**Method**: Extrapolate from trends + planned changes

**Example**:
- Current: $10k/month
- Usage growth: +10%/month
- Forecast (3 months): $13.3k/month
- Budget: $15k/month
- **Status**: ✅ Within budget (with $1.7k buffer)

---

## Cost Dashboard Layout

### Executive Cost Dashboard

```
┌─────────────────────────────────────────────────────────────┐
│  AI System Cost Dashboard - Executive View                  │
│  February 2026                                             │
└─────────────────────────────────────────────────────────────┘

┌─────────────┬─────────────┬─────────────┬─────────────────┐
│  Monthly    │  vs Budget  │  Cost/Req   │  Forecast       │
│  $10,245    │  🟢 -7.5%   │  $0.0102    │  $13.5k (May)   │
│             │  Budget:    │  🟢 -5% vs  │  🟡 Approaching │
│             │  $11k       │  last month │  budget         │
└─────────────┴─────────────┴─────────────┴─────────────────┘

┌─────────────────────────────────────────────────────────────┐
│  Cost Breakdown (February)                                  │
│  • Compute: $5,120 (50%) ██████████████████████████        │
│  • LLM APIs: $2,560 (25%) █████████████                    │
│  • Storage: $1,025 (10%) █████                             │
│  • Tools: $1,025 (10%) █████                               │
│  • Networking: $515 (5%) ██                                │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│  Cost Trends (Last 6 Months)                                │
│  $15k ──────────────────────────────────────                │
│  $10k ██░░████░░░░██████░░░░░░████████████                  │
│  $5k  ████████████████████████████████████                  │
│  $0   ──────────────────────────────────────                │
│       Sep  Oct  Nov  Dec  Jan  Feb  Mar(fcst)              │
│                                                             │
│  Status: Steady growth, within budget ✅                    │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│  Top Optimization Opportunities                             │
│  1. Switch to gpt-4o-mini for 50% of queries → Save $800/mo│
│  2. Add caching layer (Redis) → Save $500/mo (reduce API)  │
│  3. Use spot instances for training → Save $300/mo         │
│  • Total potential savings: $1,600/mo (16%)                │
└─────────────────────────────────────────────────────────────┘
```

---

### Detailed Cost Dashboard

```
┌─────────────────────────────────────────────────────────────┐
│  AI System Cost Dashboard - Detailed View                   │
│  February 2026                                             │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│  Compute Costs ($5,120)                                     │
└─────────────────────────────────────────────────────────────┘

Inference (ECS Tasks):       $3,200 (63% of compute)
  • ml.g5.xlarge (5 tasks):  $2,400 (GPU inference)
  • t3.medium (10 tasks):    $800 (CPU orchestration)

Training (On-demand):        $1,200 (23% of compute)
  • p4d.24xlarge (8 hrs):    $1,200 (monthly retrain)

Orchestration (Airflow):     $400 (8% of compute)
  • t3.large (1 instance):   $400

Reserved vs On-Demand:       80% on-demand, 20% reserved
  → Opportunity: Reserve inference instances (save 30%)

┌─────────────────────────────────────────────────────────────┐
│  LLM API Costs ($2,560)                                     │
└─────────────────────────────────────────────────────────────┘

OpenAI API (GPT-4 Turbo):    $2,560
  • Input tokens: 200M ($1,000 @ $5/1M)
  • Output tokens: 100M ($1,560 @ $15/1M)
  • Requests: 1,000,000
  • Avg cost/request: $0.00256

Token Usage Breakdown:
  • User queries: 50M (25%)
  • Retrieval context: 120M (60%)  ⚠️ High retrieval cost
  • System prompts: 30M (15%)

Optimization:
  → Reduce retrieval docs (10 → 5 docs) → Save $600/mo
  → Use gpt-4o-mini for simple queries → Save $800/mo

┌─────────────────────────────────────────────────────────────┐
│  Storage Costs ($1,025)                                     │
└─────────────────────────────────────────────────────────────┘

S3 (Training Data + Models):  $500
  • 2TB data: $460 (Standard)
  • 1M requests: $40

RDS PostgreSQL (pgvector):    $400
  • db.r6g.xlarge: $350
  • Backup storage: $50

CloudWatch Logs:              $125
  • 100GB logs: $125
  → Opportunity: Reduce log retention (90d → 30d) → Save $80/mo

┌─────────────────────────────────────────────────────────────┐
│  Tools Costs ($1,025)                                       │
└─────────────────────────────────────────────────────────────┘

MLflow (Self-hosted):         $0 (on existing ECS)
Weights & Biases:             $200 (team tier)
Grafana Cloud:                $225 (monitoring)
Datadog APM:                  $600 (performance monitoring)
  → Opportunity: Switch to Grafana + Prometheus → Save $400/mo

┌─────────────────────────────────────────────────────────────┐
│  Networking Costs ($515)                                    │
└─────────────────────────────────────────────────────────────┘

API Gateway:                  $200 (1M requests)
Load Balancer (ALB):          $150
Data Transfer (Out):          $165 (550GB)
  → Opportunity: Add CloudFront CDN → Save $100/mo (reduce transfer)

┌─────────────────────────────────────────────────────────────┐
│  Cost Efficiency Metrics                                    │
└─────────────────────────────────────────────────────────────┘

Cost per Request:             $0.0102 (↓ 5% vs last month ✅)
Cost per Active User:         $2.05 ($10k / 5k users)
Cost per Resolved Query:      $0.0136 ($10k / 750k resolved)

Revenue per User:             $5.00 (avg subscription)
**Net Margin per User**:      $2.95 (revenue - AI cost) ✅ Profitable

ROI:                          143% ((5 - 2.05) / 2.05)

┌─────────────────────────────────────────────────────────────┐
│  Cost Forecast (Next 3 Months)                              │
└─────────────────────────────────────────────────────────────┘

Assumptions:
  • Usage growth: +10%/month (historical trend)
  • No optimization changes (conservative)

March 2026:   $11,270 (🟢 within budget)
April 2026:   $12,400 (🟢 within budget)
May 2026:     $13,640 (🟡 approaching $15k budget)

Recommendation: Implement optimizations by April to stay under budget
```

---

## Cost Optimization Strategies

### 1. LLM API Optimization

**Strategy 1: Model selection (tiered approach)**
```python
# Use cheaper model for simple queries, expensive model for complex
def select_model(query_complexity):
    if query_complexity == 'simple':
        return 'gpt-4o-mini'  # $0.15/1M input, $0.60/1M output
    elif query_complexity == 'medium':
        return 'gpt-4o'  # $2.50/1M input, $10/1M output
    else:
        return 'gpt-4-turbo'  # $10/1M input, $30/1M output

# Estimate: 50% simple, 30% medium, 20% complex
# Savings: ~40% vs using gpt-4-turbo for everything
```

**Strategy 2: Prompt optimization (reduce tokens)**
```python
# Before: 500-token system prompt
# After: 100-token system prompt (remove fluff)
system_prompt = "You are a support assistant. Answer based on docs provided. Be concise."

# Savings: 400 tokens × 1M requests × $5/1M = $2,000/month
```

**Strategy 3: Caching (reduce redundant calls)**
```python
# Cache common queries (Redis)
import redis
cache = redis.Redis()

def get_response(query):
    cached = cache.get(query)
    if cached:
        return cached  # No API call, no cost

    response = call_llm_api(query)
    cache.setex(query, 3600, response)  # Cache 1 hour
    return response

# Estimate: 30% cache hit rate → Save 30% of API costs ($780/month)
```

**Strategy 4: Reduce retrieval context**
```python
# Before: Retrieve 10 docs (5k tokens avg)
# After: Retrieve 5 docs (2.5k tokens avg)
def retrieve_docs(query, k=5):  # was k=10
    return vector_db.search(query, k=k)

# Savings: 50% retrieval tokens × 60% of total tokens × $2.5k API cost = $750/month
```

---

### 2. Compute Optimization

**Strategy 1: Reserved instances (30-40% discount)**
```bash
# Reserve inference instances (predictable workload)
# Before: 5× ml.g5.xlarge on-demand ($2,400/month)
# After: 5× ml.g5.xlarge reserved 1-year ($1,680/month)
# Savings: $720/month (30%)
```

**Strategy 2: Spot instances for training (50-70% discount)**
```bash
# Use spot instances for non-critical training
# Before: p4d.24xlarge on-demand ($32/hr × 8hr = $256/training run)
# After: p4d.24xlarge spot (~$10/hr × 8hr = $80/training run)
# Savings: $176/run × 5 runs/month = $880/month
```

**Strategy 3: Auto-scaling (right-sizing)**
```yaml
# Scale down during low-traffic hours
# Before: 5 instances 24/7
# After: 2 instances off-peak (8pm-8am), 5 instances peak
# Savings: 3 instances × 12 hours × $0.20/hr × 30 days = $216/month
```

**Strategy 4: Model compression (smaller = faster = cheaper)**
```python
# Quantize model (float32 → int8)
# Reduces model size by 4×, inference time by 2-4×
# Before: ml.g5.xlarge (4GB memory, $0.40/hr)
# After: ml.g5.large (2GB memory, $0.20/hr)
# Savings: $0.20/hr × 24hr × 30d × 5 instances = $720/month
```

---

### 3. Storage Optimization

**Strategy 1: Lifecycle policies (delete old data)**
```bash
# S3 lifecycle: Delete logs after 30 days (was 90 days)
aws s3api put-bucket-lifecycle-configuration \
  --bucket my-logs-bucket \
  --lifecycle-configuration '{
    "Rules": [{
      "Id": "DeleteOldLogs",
      "Status": "Enabled",
      "Expiration": {"Days": 30}
    }]
  }'

# Savings: 60 days × 1GB/day × $0.023/GB = $1.38/month (small, but adds up)
```

**Strategy 2: Archive to Glacier (90% cheaper)**
```bash
# Archive old training data (Glacier Deep Archive)
# Before: 1TB on S3 Standard ($23/month)
# After: 1TB on Glacier Deep Archive ($1/month)
# Savings: $22/month per TB
```

**Strategy 3: Compression**
```bash
# Compress logs before storage (gzip, 10:1 ratio)
# Before: 100GB logs × $0.023/GB = $2.30/month
# After: 10GB logs × $0.023/GB = $0.23/month
# Savings: $2.07/month (90% reduction)
```

---

### 4. Tool Optimization

**Strategy 1: Replace expensive SaaS with open-source**
```
# Before: Datadog APM ($600/month)
# After: Grafana + Prometheus (self-hosted, $50/month EC2)
# Savings: $550/month
```

**Strategy 2: Negotiate volume discounts**
```
# Contact vendors (Weights & Biases, Datadog)
# Request annual contract (often 20-30% discount)
```

---

## Cost Monitoring and Alerts

**Budget alerts**:
```bash
# AWS Budget alert (daily spend >$350)
aws budgets create-budget \
  --account-id 123456789012 \
  --budget '{
    "BudgetName": "AI-Daily-Budget",
    "BudgetLimit": {"Amount": "350", "Unit": "USD"},
    "TimeUnit": "DAILY"
  }' \
  --notifications-with-subscribers '[{
    "Notification": {
      "NotificationType": "ACTUAL",
      "ComparisonOperator": "GREATER_THAN",
      "Threshold": 100
    },
    "Subscribers": [{
      "SubscriptionType": "EMAIL",
      "Address": "alerts@company.com"
    }]
  }]'
```

**Cost anomaly detection**:
```python
# Alert if daily cost >2× average
import statistics

daily_costs = fetch_daily_costs(days=30)
avg_cost = statistics.mean(daily_costs)
std_dev = statistics.stdev(daily_costs)

today_cost = fetch_daily_costs(days=1)[0]

if today_cost > avg_cost + (2 * std_dev):
    alert(f"Cost anomaly: ${today_cost} (avg: ${avg_cost})")
```

---

## Cost Attribution (Tagging)

**Tag all resources**:
```bash
# AWS resource tagging (S3, EC2, RDS, etc.)
aws ec2 create-tags \
  --resources i-1234567890abcdef0 \
  --tags Key=Project,Value=ChatbotAI Key=Environment,Value=Production

# Query costs by tag
aws ce get-cost-and-usage \
  --time-period Start=2026-02-01,End=2026-03-01 \
  --granularity MONTHLY \
  --metrics UnblendedCost \
  --group-by Type=TAG,Key=Project
```

**Cost allocation by feature**:
```
Project=ChatbotAI, Environment=Production:
  • Inference: $3,200 (tag: Component=Inference)
  • Training: $1,200 (tag: Component=Training)
  • Storage: $1,000 (tag: Component=Storage)
```

---

## Blank Cost Dashboard Template

```markdown
# Production Cost Dashboard - [System]

**Month**: [YYYY-MM]
**Total Cost**: $[X]
**Budget**: $[Y]
**Status**: [Within budget / Over budget]

## Cost Breakdown
- Compute: $[X] ([Y%])
- LLM APIs: $[X] ([Y%])
- Storage: $[X] ([Y%])
- Tools: $[X] ([Y%])
- Networking: $[X] ([Y%])

## Efficiency Metrics
- Cost per Request: $[X]
- Cost per User: $[X]
- ROI: [X%]

## Trends
[Graph: cost over time]

## Forecast (3 months)
- Month 1: $[X]
- Month 2: $[X]
- Month 3: $[X]

## Optimization Opportunities
1. [Opportunity 1] → Save $[X]/mo
2. [Opportunity 2] → Save $[X]/mo
3. [Opportunity 3] → Save $[X]/mo
```

---

## Related Templates

- [Production Health Dashboard](production-health-dashboard.md) - Overall system health
- [Model Performance Dashboard](model-performance-dashboard.md) - Model quality metrics
- [Quarterly System Review](quarterly-system-review.md) - Cost review and planning
- [AI Landing Zone Checklist](ai-landing-zone-checklist.md) - Infrastructure cost planning
- [Production Alerting Runbook](production-alerting-runbook.md) - Cost spike alerts
