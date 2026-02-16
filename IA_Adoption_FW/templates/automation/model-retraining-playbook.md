# Model Retraining Playbook

> **Purpose**: Retraining triggers, workflow, and validation procedures
> **Used in**: Automation Phase 3 (Run) - Manage model lifecycle
> **Update frequency**: Review quarterly, update based on operational learnings

---

## What is Model Retraining?

Model retraining is the process of updating an AI model with new data to maintain or improve performance. Models degrade over time due to data drift, concept drift, or changing user behavior.

**When to retrain**:
- **Time-based**: Every N days/weeks (predictable, simple)
- **Performance-based**: When accuracy drops below threshold (reactive)
- **Drift-based**: When data/concept drift detected (proactive)
- **Data-based**: When sufficient new labeled data available (continuous learning)

**Retraining strategies**:
- **Full retrain**: Train from scratch on all data (slow, accurate)
- **Incremental**: Fine-tune existing model on new data (fast, may accumulate errors)
- **Online learning**: Continuous updates in real-time (complex, advanced)

---

## Retraining Triggers

### 1. Time-Based Retraining

**Trigger**: Every N days/weeks/months

**When to use**:
- Predictable data patterns (e.g., seasonal trends)
- Low-risk applications (small impact if model slightly stale)
- Simple operations (no drift monitoring needed)

**Examples**:
- E-commerce recommendations: Monthly retrain (new products, seasonal trends)
- Chatbot: Quarterly retrain (new product docs, FAQs)
- Fraud detection: Weekly retrain (new fraud patterns)

**Pros**: Simple, predictable schedule
**Cons**: May retrain too often (wasteful) or too rarely (degraded performance)

---

### 2. Performance-Based Retraining

**Trigger**: Accuracy/metric drops below threshold

**When to use**:
- Performance-critical applications (accuracy must stay above X%)
- Ground truth available (can measure accuracy in production)
- Reactive retraining acceptable (tolerate some degradation before retraining)

**Examples**:
- Accuracy drops from 85% to 75% → Retrain
- User satisfaction drops from 4.5/5 to 3.5/5 → Retrain
- Conversion rate drops >20% → Retrain

**Thresholds**:
- **Warning**: 5-10% degradation (investigate)
- **Critical**: >10% degradation (retrain immediately)

**Pros**: Retrain only when needed (cost-effective)
**Cons**: Reactive (users experience degradation before retraining)

---

### 3. Drift-Based Retraining

**Trigger**: Data drift or concept drift exceeds threshold

**When to use**:
- Proactive retraining (prevent accuracy drops)
- Drift monitoring available (KL divergence, PSI, etc.)
- Want to retrain before users notice degradation

**Examples**:
- Data drift (KL divergence >0.5) → Retrain
- Concept drift (prediction distribution shifts) → Retrain
- Feature distribution changes significantly → Retrain

**Pros**: Proactive (prevent degradation)
**Cons**: Requires drift monitoring infrastructure

---

### 4. Data Volume-Based Retraining

**Trigger**: X new labeled samples available

**When to use**:
- Continuous learning applications (model improves with more data)
- Active learning (users provide feedback, labels)
- Sufficient labeling budget

**Examples**:
- 10,000 new labeled samples → Retrain
- 5% of training data volume added → Retrain

**Pros**: Model continuously improves
**Cons**: Requires labeling pipeline

---

## Retraining Workflow

### Step 1: Trigger Detection

**Automated monitoring**:
- Time-based: Cron job or scheduler (Airflow, Kubeflow)
- Performance/drift-based: Monitoring alerts trigger retraining pipeline
- Data-based: Check labeled data count daily

**Manual trigger**:
- Engineer or data scientist initiates retraining
- Use case: Major system change, new feature release, incident recovery

---

### Step 2: Data Preparation

**Collect training data**:
- [ ] Fetch production data (last N days/weeks)
- [ ] Combine with historical training data (optional: full retrain vs incremental)
- [ ] Filter outliers, anomalies, low-quality data
- [ ] Balance dataset (if needed for classification)

**Data quality checks**:
- [ ] Schema validation (correct features, types)
- [ ] Completeness (no excessive missing values)
- [ ] Freshness (data is recent, not stale)
- [ ] Ground truth labels available (for supervised learning)

**Data versioning**:
- [ ] Tag dataset version (e.g., `v2.4-2026-02-15`)
- [ ] Store in data registry (DVC, Delta Lake, MLflow)
- [ ] Document data sources and preprocessing steps

---

### Step 3: Model Training

**Training configuration**:
- [ ] Hyperparameters (use previous best config or re-tune)
- [ ] Training/validation/test split (80/10/10 or similar)
- [ ] Compute resources (GPU/TPU allocation)
- [ ] Training time budget (max X hours)

**Training execution**:
- [ ] Run training pipeline (Airflow, Kubeflow, custom script)
- [ ] Log experiment (MLflow, Weights & Biases)
- [ ] Monitor training progress (loss, metrics)
- [ ] Save checkpoints (intermediate models)

**Training outputs**:
- [ ] Trained model artifacts (weights, configs, preprocessing)
- [ ] Training metrics (accuracy, loss curves)
- [ ] Model metadata (hyperparameters, data version, training time)

---

### Step 4: Model Validation

**Performance validation**:
- [ ] Test on held-out test set (same as previous model)
- [ ] Compare to current production model (A/B test or offline comparison)
- [ ] Validate accuracy, precision, recall, F1 (meet thresholds?)
- [ ] Check for regressions (new model worse on any metric?)

**Acceptance criteria**:
- New model accuracy ≥ current model accuracy (or within -2%)
- No catastrophic regressions (e.g., precision drops from 90% to 60%)
- Fairness metrics maintained or improved
- Passes all validation tests (unit, integration, adversarial)

**Validation checklist**:
- [ ] Accuracy ≥ baseline
- [ ] Precision ≥ baseline - 2%
- [ ] Recall ≥ baseline - 2%
- [ ] F1 ≥ baseline - 2%
- [ ] Fairness: Subgroup disparity <10%
- [ ] No hallucinations or broken outputs (manual spot-check)
- [ ] Latency: Inference time <2× current model
- [ ] Model size: <2× current model (if size matters)

**If validation fails**:
- Investigate root cause (data quality? Hyperparameters? Training bug?)
- Fix issue and retrain
- If unfixable, keep current model (don't deploy degraded model)

---

### Step 5: Model Deployment

**Deployment strategy**:
- [ ] **Option A: Blue/green deployment** (swap traffic instantly, easy rollback)
- [ ] **Option B: Canary deployment** (gradual rollout: 5% → 50% → 100%)
- [ ] **Option C: A/B test** (50/50 split, compare for 1 week, then promote winner)

**Pre-deployment**:
- [ ] Register model in model registry (MLflow, SageMaker Model Registry)
- [ ] Tag model version (e.g., `v2.4`)
- [ ] Update model card (performance, training date, data version)
- [ ] Get approval (if required by governance policy)

**Deployment**:
- [ ] Deploy to staging environment first
- [ ] Run smoke tests (critical user flows)
- [ ] Deploy to production (canary or full)
- [ ] Monitor closely for first 24 hours

**Rollback plan**:
- [ ] Keep previous model version available
- [ ] Define rollback criteria (accuracy <75%, error rate >5%, latency >5s)
- [ ] Document rollback procedure (single command or automated)

---

### Step 6: Post-Deployment Monitoring

**Immediate monitoring** (first 24 hours):
- [ ] Check dashboards every 2 hours
- [ ] Verify accuracy, latency, error rate stable
- [ ] Watch for anomalies (spikes, drops, unusual patterns)
- [ ] User feedback (complaints? Satisfaction scores?)

**Ongoing monitoring** (first week):
- [ ] Daily checks (accuracy, drift, user satisfaction)
- [ ] Compare new model vs old model (A/B test results)
- [ ] Investigate any issues (degraded performance, user complaints)

**Validation period**:
- New model "proven" after 1 week with no major issues
- Update production baseline metrics
- Archive old model (keep for compliance, rollback capability)

---

## Retraining Decision Tree

```
Start: Retraining Trigger Detected
│
├─ Time-based trigger?
│  └─ YES → Fetch data → Check data quality
│     ├─ Good quality → Train model
│     └─ Bad quality → Alert team, skip retraining
│
├─ Performance dropped?
│  └─ YES → Check drop severity
│     ├─ >20% drop → URGENT: Train immediately
│     ├─ 10-20% drop → HIGH: Train within 24h
│     └─ <10% drop → Investigate first, then train
│
├─ Drift detected?
│  └─ YES → Check drift severity
│     ├─ Severe (KL >0.5) → Train within 1 week
│     ├─ Moderate (KL 0.1-0.5) → Schedule retraining
│     └─ Low (KL <0.1) → Monitor, no action
│
└─ New data available?
   └─ YES → Check data volume
      ├─ >10k samples → Train now
      ├─ 5k-10k samples → Schedule retraining
      └─ <5k samples → Wait for more data
```

---

## Example Retraining Workflow

**System**: Customer Support Chatbot (RAG-based)
**Trigger**: Monthly time-based + drift monitoring

### Scenario 1: Monthly Scheduled Retrain

**Week 1 of month**:
- Cron job triggers retraining pipeline (Airflow DAG)
- Fetch last 30 days of product docs (500 new docs added)
- Combine with existing knowledge base (50k docs total)
- Generate embeddings for new docs (OpenAI ada-002)
- Update vector database (pgvector)
- Deploy updated knowledge base to staging
- Run smoke tests (100 test queries)
- Deploy to production (blue/green swap)
- Monitor for 24 hours
- **Result**: ✅ Success, improved coverage (+500 docs)

### Scenario 2: Drift-Based Retrain

**Feb 10**: Drift monitoring detects input drift (KL: 0.6)
- Investigation: Users asking more technical questions (was 20%, now 40%)
- Decision: Retrain with bias toward technical docs
- Fetch technical docs (10k docs)
- Retrain embeddings on technical subset
- Test on technical queries (accuracy 75% → 85%)
- Deploy to 10% of traffic (canary)
- Monitor for 2 days
- Gradually increase to 100%
- **Result**: ✅ Success, technical query accuracy improved

### Scenario 3: Performance-Based Retrain

**Feb 15**: User satisfaction drops (4.3 → 3.8 stars)
- Investigation: Recent product rebranding (product names changed)
- Decision: Urgent retrain with new product names
- Fetch rebranded docs (1k docs)
- Update embeddings
- Test on rebranding queries (accuracy 50% → 90%)
- Deploy immediately (blue/green)
- Notify users of improvement
- **Result**: ✅ Success, satisfaction recovers (3.8 → 4.2)

---

## Retraining Automation (Airflow Example)

```python
from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime, timedelta

default_args = {
    'owner': 'ml-team',
    'depends_on_past': False,
    'start_date': datetime(2026, 2, 1),
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

dag = DAG(
    'model_retraining',
    default_args=default_args,
    schedule_interval='0 0 1 * *',  # Monthly, 1st of month at midnight
    catchup=False,
)

def check_trigger():
    # Check if retraining needed (time-based always true for scheduled DAG)
    # Could add additional checks (drift, performance)
    return True

def fetch_data():
    # Fetch production data from last 30 days
    data = fetch_production_data(days=30)
    save_to_s3(data, 'training-data-2026-02.parquet')
    return 's3://bucket/training-data-2026-02.parquet'

def train_model(data_path):
    # Load data and train model
    data = load_from_s3(data_path)
    model = train(data, config='config.yaml')
    save_model(model, 'model-v2.5.pkl')
    return 'model-v2.5.pkl'

def validate_model(model_path):
    # Validate model on test set
    model = load_model(model_path)
    test_data = load_test_data()
    accuracy = evaluate(model, test_data)

    if accuracy < 0.75:
        raise ValueError(f"Model accuracy {accuracy} below threshold 0.75")

    return accuracy

def deploy_model(model_path):
    # Deploy model to production (blue/green)
    upload_to_registry(model_path, version='v2.5')
    update_production_endpoint(model_version='v2.5')
    return True

# Define task dependencies
task_check = PythonOperator(task_id='check_trigger', python_callable=check_trigger, dag=dag)
task_fetch = PythonOperator(task_id='fetch_data', python_callable=fetch_data, dag=dag)
task_train = PythonOperator(task_id='train_model', python_callable=train_model, dag=dag)
task_validate = PythonOperator(task_id='validate_model', python_callable=validate_model, dag=dag)
task_deploy = PythonOperator(task_id='deploy_model', python_callable=deploy_model, dag=dag)

task_check >> task_fetch >> task_train >> task_validate >> task_deploy
```

---

## Retraining Frequency Guidelines

**Time-based recommendations**:

| Use Case | Frequency | Rationale |
|----------|-----------|-----------|
| Chatbot (FAQ) | Quarterly | Docs change slowly |
| E-commerce recommendations | Monthly | Product catalog changes monthly |
| Fraud detection | Weekly | Fraud patterns evolve rapidly |
| Stock price prediction | Daily | Markets change daily |
| Content moderation | Weekly | New toxic patterns emerge |
| Credit scoring | Quarterly | Credit patterns stable |

**Adjust based on**:
- Data velocity (how fast does data change?)
- Risk tolerance (how much degradation is acceptable?)
- Retraining cost (compute, time, manual validation)

---

## Blank Retraining Playbook Template

```markdown
# Model Retraining Playbook - [Model Name]

## Retraining Triggers
- [ ] Time-based: Every [N days/weeks/months]
- [ ] Performance: Accuracy <[X%]
- [ ] Drift: KL >[X] or PSI >[X]
- [ ] Data: [X] new labeled samples

## Workflow
1. **Trigger Detection**: [How detected?]
2. **Data Preparation**: [Data sources, versions, quality checks]
3. **Model Training**: [Config, resources, duration]
4. **Validation**: [Acceptance criteria, tests]
5. **Deployment**: [Strategy, rollback plan]
6. **Monitoring**: [First 24h, first week]

## Decision Tree
[When to retrain? Severity? Timeline?]

## Automation
[Airflow/Kubeflow DAG, cron job, or manual?]

## Examples
[Past retraining scenarios and outcomes]
```

---

## Related Templates

- [Model Performance Dashboard](model-performance-dashboard.md) - Monitor retraining triggers
- [Production Health Dashboard](production-health-dashboard.md) - Overall system monitoring
- [MLOps Maturity Assessment](mlops-maturity-assessment.md) - Retraining automation maturity
- [Production Alerting Runbook](production-alerting-runbook.md) - Alerts for performance degradation
- [AI Landing Zone Checklist](ai-landing-zone-checklist.md) - Infrastructure for retraining pipelines
