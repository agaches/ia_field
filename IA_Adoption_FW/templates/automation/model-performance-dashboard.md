# Model Performance Dashboard

> **Purpose**: Track model drift, accuracy, and retraining triggers
> **Used in**: Automation Phase 3 (Run) - Monitor model health
> **Update frequency**: Real-time dashboard, review daily or weekly

---

## What is a Model Performance Dashboard?

A model performance dashboard tracks AI model quality over time: accuracy, drift, data quality, and fairness. It answers: "Is my model still performing well, or is it time to retrain?"

**Key metrics**:
- **Accuracy/Performance**: Is the model making correct predictions?
- **Data drift**: Have input distributions changed? (covariate shift)
- **Concept drift**: Has the relationship between inputs and outputs changed?
- **Fairness**: Is performance equal across subgroups?

**Why needed**:
- Models degrade over time (concept drift, data shift)
- Early detection prevents user impact
- Triggers automated retraining
- Ensures fairness and compliance

---

## Key Metrics to Track

### 1. Model Accuracy and Performance

**Accuracy** (classification):
- **Metric**: Percentage of correct predictions
- **Target**: >80% (depends on use case)
- **Calculation**: `Correct predictions / Total predictions`
- **Alert**: If drops >10% from baseline

**Precision and Recall** (classification):
- **Precision**: Of predictions labeled positive, how many are correct?
- **Recall**: Of all actual positives, how many did we catch?
- **Target**: Depends on use case (high precision for spam, high recall for fraud)
- **Alert**: If either drops >15%

**F1 Score** (classification):
- **Metric**: Harmonic mean of precision and recall
- **Target**: >0.75 (depends on use case)
- **Alert**: If <0.6

**RMSE / MAE** (regression):
- **RMSE**: Root mean squared error (penalizes large errors)
- **MAE**: Mean absolute error (average error magnitude)
- **Target**: Application-specific
- **Alert**: If >2× baseline

**Perplexity / BLEU / ROUGE** (LLMs, generation tasks):
- **Perplexity**: How "surprised" is the model? (lower is better)
- **BLEU/ROUGE**: Text similarity to reference (0-1, higher is better)
- **Target**: Stable or improving
- **Alert**: If degrades >20%

---

### 2. Confidence Distribution

**Prediction Confidence**:
- **Metric**: Distribution of model confidence scores (0-1)
- **Target**: >70% high-confidence (>0.8), <10% low-confidence (<0.5)
- **Visualization**: Histogram of confidence scores
- **Alert**: If >20% low-confidence (model uncertain)

**Calibration**:
- **Metric**: Do confidence scores match actual accuracy? (e.g., 80% confident → 80% accurate)
- **Target**: Well-calibrated (confidence ≈ accuracy)
- **Calculation**: Bin predictions by confidence, compare to accuracy per bin
- **Alert**: If miscalibrated (confidence >>accuracy or <<accuracy)

---

### 3. Data Drift

**Input Distribution Drift**:
- **Metric**: Statistical distance between training data and production data
- **Methods**: KL divergence, Kolmogorov-Smirnov test, Population Stability Index (PSI)
- **Target**: Minimal drift (KL divergence <0.1, PSI <0.1)
- **Alert**: If significant drift detected (KL >0.5, PSI >0.25)

**Feature-Level Drift**:
- **Metric**: Which features have changed the most?
- **Visualization**: Heatmap of drift per feature
- **Alert**: If critical features drift significantly

**Example**:
- Training data: Users aged 25-45 (avg 35)
- Production data: Users aged 18-65 (avg 42)
- **Drift detected**: Age distribution shifted → May need retraining

---

### 4. Concept Drift

**Accuracy Over Time**:
- **Metric**: Rolling accuracy (daily, weekly)
- **Target**: Stable (within ±5% of baseline)
- **Visualization**: Line chart of accuracy over time
- **Alert**: If accuracy drops >10% for 3 consecutive days

**Prediction Distribution Drift**:
- **Metric**: Has the distribution of predictions changed?
- **Example**: Model used to predict 10% fraud, now predicts 30% fraud (suspicious)
- **Alert**: If prediction distribution shifts significantly

**Label Drift** (if ground truth available):
- **Metric**: Has the actual distribution of labels changed?
- **Example**: Fraud rate increased from 2% to 8% (concept shift)

---

### 5. Fairness and Bias

**Subgroup Performance**:
- **Metric**: Accuracy, precision, recall by subgroup (gender, race, age, etc.)
- **Target**: <5% disparity across groups (depends on regulations)
- **Calculation**: `|Accuracy_group_A - Accuracy_group_B| < 0.05`
- **Alert**: If disparity >10%

**Fairness Metrics**:
- **Demographic Parity**: Equal positive prediction rates across groups
- **Equalized Odds**: Equal TPR and FPR across groups
- **Target**: Depends on use case and regulations
- **Alert**: If fairness metrics degrade

---

### 6. Retraining Triggers

**Time-based**:
- **Trigger**: Every N days/weeks/months (e.g., monthly retraining)
- **Use when**: Predictable data patterns, low risk

**Performance-based**:
- **Trigger**: Accuracy drops below threshold (e.g., <75%)
- **Use when**: Performance degradation unacceptable

**Drift-based**:
- **Trigger**: Data or concept drift exceeds threshold
- **Use when**: Want to retrain proactively before accuracy drops

**Data volume-based**:
- **Trigger**: X new labeled examples available (e.g., 10k new samples)
- **Use when**: Continuous learning, online learning

---

## Dashboard Layout

### Model Health Overview

```
┌─────────────────────────────────────────────────────────────┐
│  Model Performance Dashboard - Customer Support Chatbot     │
│  Model: v2.3 (deployed 2026-02-01)                         │
│  Last Updated: 2026-02-15 14:30                            │
└─────────────────────────────────────────────────────────────┘

┌─────────────┬─────────────┬─────────────┬─────────────────┐
│  Accuracy   │  Confidence │  Data Drift │  Retraining     │
│  84% 🟢     │  High: 78%  │  KL: 0.12   │  Next: Mar 1    │
│  Baseline:  │  Low: 5% 🟢 │  🟡 Moderate│  (14 days)      │
│  85%        │             │             │                 │
└─────────────┴─────────────┴─────────────┴─────────────────┘

┌─────────────────────────────────────────────────────────────┐
│  Accuracy Trend (Last 30 Days)                             │
│  90% ─────────────────────────────────────────────          │
│  85% ████████████████████████████░░░░                       │
│  80% ██████████████████████████████████                     │
│  75% ────────────────────────────────────                   │
│  70% ────────────────────────────────────                   │
│       Feb 1    Feb 8    Feb 15   Feb 22   Mar 1            │
│                                                             │
│  Status: Slight degradation (85% → 84%), within threshold  │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│  Alerts                                                     │
│  • [Feb 14] Moderate data drift detected (KL: 0.12) 🟡      │
│  • [Feb 10] Low confidence spike (15% for 2 hours) ⚠️      │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│  Retraining Recommendation                                  │
│  🟡 Consider retraining in 2 weeks (March 1)                │
│  Reasons:                                                   │
│  • Data drift detected (input distribution shifted)         │
│  • Accuracy stable but not improving                        │
│  • 30 days since last retrain                              │
└─────────────────────────────────────────────────────────────┘
```

---

### Detailed Metrics View

```
┌─────────────────────────────────────────────────────────────┐
│  Performance Metrics (Last 7 Days)                          │
└─────────────────────────────────────────────────────────────┘

Accuracy:        84.2% (baseline: 85.0%, -0.8% ✅)
Precision:       88.5% (baseline: 89.0%, -0.5% ✅)
Recall:          81.0% (baseline: 82.0%, -1.0% ✅)
F1 Score:        0.845 (baseline: 0.853, -0.008 ✅)

Predictions:     65,000 (avg 9,285/day)
Correct:         54,730
Incorrect:       10,270
"Don't Know":    7,800 (12% of total, target: <20% ✅)

┌─────────────────────────────────────────────────────────────┐
│  Confidence Distribution                                    │
└─────────────────────────────────────────────────────────────┘

High (0.8-1.0):  78% ████████████████████████████████████
Medium (0.5-0.8): 17% ████████
Low (0.0-0.5):    5% ██

Calibration:     Good ✅
  - 90% confident → 89% accurate
  - 80% confident → 81% accurate
  - 70% confident → 72% accurate

┌─────────────────────────────────────────────────────────────┐
│  Data Drift Analysis                                        │
└─────────────────────────────────────────────────────────────┘

Overall Drift (KL Divergence): 0.12 🟡 (threshold: 0.1)

Feature-Level Drift:
  • Question length:      0.18 🟡 (was 50 words avg, now 65 words)
  • Product category:     0.05 🟢 (stable distribution)
  • Time of day:          0.22 🟡 (more evening queries now)
  • User tenure:          0.08 🟢 (stable)

Input Distribution Shift Detected:
  - Users asking longer, more complex questions
  - More queries outside business hours
  → Recommendation: Retrain with recent data

┌─────────────────────────────────────────────────────────────┐
│  Concept Drift Analysis                                     │
└─────────────────────────────────────────────────────────────┘

Prediction Distribution:
  - Resolved by AI:  75% (was 78% 30 days ago, -3%)
  - Escalated:       25% (was 22% 30 days ago, +3%)

Possible Concept Drift:
  - Slight increase in escalations (users asking harder questions?)
  - Accuracy stable, so model not broken, just harder inputs

┌─────────────────────────────────────────────────────────────┐
│  Fairness and Bias (Last 30 Days)                           │
└─────────────────────────────────────────────────────────────┘

Subgroup Performance:
  • Product Category A: 86% accuracy
  • Product Category B: 84% accuracy
  • Product Category C: 82% accuracy
  Disparity: 4% (max - min) 🟢 (threshold: <10%)

No bias detected across product categories ✅
```

---

## Monitoring Implementation

### Data Collection

**Option 1: Log Predictions**
```python
import logging
import json

def predict(input_data):
    prediction = model.predict(input_data)

    # Log prediction for offline analysis
    logging.info(json.dumps({
        'timestamp': time.time(),
        'input': input_data,
        'prediction': prediction['label'],
        'confidence': prediction['confidence'],
        'model_version': 'v2.3'
    }))

    return prediction
```

**Option 2: Real-time Metrics (Prometheus)**
```python
from prometheus_client import Histogram, Counter

model_confidence = Histogram('model_confidence', 'Prediction confidence')
model_predictions = Counter('model_predictions_total', 'Total predictions', ['label'])

def predict(input_data):
    prediction = model.predict(input_data)

    # Push metrics
    model_confidence.observe(prediction['confidence'])
    model_predictions.labels(label=prediction['label']).inc()

    return prediction
```

---

### Drift Detection

**KL Divergence (Statistical)**:
```python
import numpy as np
from scipy.stats import entropy

def calculate_kl_divergence(training_data, production_data):
    """
    Compare distributions using KL divergence
    """
    # Bin data into histograms
    bins = 20
    train_hist, bin_edges = np.histogram(training_data, bins=bins, density=True)
    prod_hist, _ = np.histogram(production_data, bins=bin_edges, density=True)

    # Avoid division by zero
    train_hist = train_hist + 1e-10
    prod_hist = prod_hist + 1e-10

    # Calculate KL divergence
    kl_div = entropy(prod_hist, train_hist)

    return kl_div

# Example usage
train_ages = [25, 30, 35, 40, ...]  # Training data
prod_ages = [30, 35, 40, 45, ...]   # Last 7 days production data
drift = calculate_kl_divergence(train_ages, prod_ages)

if drift > 0.1:
    alert("Moderate data drift detected")
if drift > 0.5:
    alert("Severe data drift - retrain recommended")
```

**PSI (Population Stability Index)**:
```python
def calculate_psi(expected, actual, bins=10):
    """
    Calculate Population Stability Index
    PSI < 0.1: No significant change
    PSI 0.1-0.25: Moderate change
    PSI > 0.25: Significant change (retrain)
    """
    # Create bins
    breakpoints = np.linspace(min(expected), max(expected), bins+1)

    # Calculate percentages in each bin
    expected_percents = np.histogram(expected, breakpoints)[0] / len(expected)
    actual_percents = np.histogram(actual, breakpoints)[0] / len(actual)

    # Avoid division by zero
    expected_percents = np.where(expected_percents == 0, 0.0001, expected_percents)
    actual_percents = np.where(actual_percents == 0, 0.0001, actual_percents)

    # Calculate PSI
    psi = np.sum((actual_percents - expected_percents) * np.log(actual_percents / expected_percents))

    return psi
```

---

### Automated Retraining Trigger

```python
def check_retraining_needed():
    """
    Check if model should be retrained based on multiple signals
    """
    reasons = []

    # 1. Time-based (monthly)
    days_since_training = (datetime.now() - last_training_date).days
    if days_since_training > 30:
        reasons.append("30 days since last training")

    # 2. Performance-based
    current_accuracy = calculate_accuracy_last_7_days()
    baseline_accuracy = 0.85
    if current_accuracy < baseline_accuracy - 0.10:  # 10% drop
        reasons.append(f"Accuracy dropped to {current_accuracy:.1%}")

    # 3. Drift-based
    kl_drift = calculate_kl_divergence(train_data, prod_data_last_7_days)
    if kl_drift > 0.5:
        reasons.append(f"Significant data drift (KL: {kl_drift:.2f})")

    # 4. Data volume-based
    new_labeled_samples = count_new_labeled_samples()
    if new_labeled_samples > 10000:
        reasons.append(f"{new_labeled_samples} new labeled samples available")

    # Decision
    if len(reasons) >= 2:  # At least 2 triggers
        trigger_retraining(reasons)
        return True
    elif len(reasons) == 1 and "Accuracy dropped" in reasons[0]:
        # Always retrain if accuracy drops
        trigger_retraining(reasons)
        return True
    else:
        return False
```

---

## Dashboard Tools

**Evidently AI** (open source):
- Drift detection, data quality, model performance
- Pre-built dashboards, easy integration
- Python library

```python
from evidently.dashboard import Dashboard
from evidently.tabs import DataDriftTab, CatTargetDriftTab

dashboard = Dashboard(tabs=[DataDriftTab(), CatTargetDriftTab()])
dashboard.calculate(reference_data=train_df, current_data=prod_df)
dashboard.save("model_performance_report.html")
```

**WhyLabs** (SaaS):
- ML monitoring platform
- Automated drift detection, anomaly detection
- Integrates with MLflow, SageMaker

**Arize AI** (SaaS):
- Model performance monitoring
- Explainability tracking (SHAP over time)
- Production debugging

**Custom Dashboard** (Grafana + Python):
- Flexible, cost-effective
- Requires more setup

---

## Review Cadence

**Daily** (5 minutes):
- Check accuracy (is it stable?)
- Review alerts (any drift detected?)

**Weekly** (30 minutes):
- Deep dive into trends
- Investigate any anomalies
- Review retraining trigger conditions

**Monthly** (2 hours):
- Comprehensive performance review
- Fairness audit (subgroup performance)
- Retrain model if needed
- Update baseline metrics

---

## Blank Template

```markdown
# Model Performance Dashboard - [Model Name]

**Model**: [Name/Version]
**Deployed**: [Date]
**Last Retrained**: [Date]
**Next Review**: [Date]

## Key Metrics
- Accuracy: [X%] (baseline: [Y%])
- Confidence: High [X%], Low [Y%]
- Data Drift: [KL/PSI value]
- Retraining: [Status]

## Trends
[Line chart: accuracy over time]

## Alerts
- [List recent alerts]

## Retraining Recommendation
[Trigger status and reasoning]

## Detailed Metrics
- Accuracy: [X%]
- Precision: [X%]
- Recall: [X%]
- F1: [X]

## Drift Analysis
- Overall Drift: [KL/PSI]
- Feature-Level Drift: [Heatmap or list]

## Fairness
- Subgroup Performance: [List]
- Disparity: [X%]
```

---

## Related Templates

- [Production Health Dashboard](production-health-dashboard.md) - Overall system health
- [Model Retraining Playbook](model-retraining-playbook.md) - Retraining procedures
- [Production Alerting Runbook](production-alerting-runbook.md) - Alert definitions
- [MLOps Maturity Assessment](mlops-maturity-assessment.md) - Monitoring maturity
- [Quarterly System Review](quarterly-system-review.md) - Periodic deep-dive review
