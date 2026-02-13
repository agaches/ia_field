# 05 - Secure (Delivery)

> Pragmatic security - Implement what you can, manage what you can't

> **Note**: Code examples use specific APIs/tools for illustration. Adapt security patterns to your chosen stack (commercial APIs, self-hosted models, hybrid).

## 1. OWASP LLM Top 10 (Pragmatic)

### Priority Risks (Team Focus: LLM01, LLM06, LLM09)

| Risk | Team Implementation | Tools/Approach |
|------|---------------------|----------------|
| **LLM01: Prompt Injection** | ✅ Input validation for AI code review, sanitization | Pre-commit hooks |
| **LLM02: Insecure Output** | ✅ Output validation in workflows, code scanning | CI checks |
| **LLM03: Data Poisoning** | ⚠️ Manage (provider responsibility) | N/A |
| **LLM04: Model DoS** | ⚠️ Awareness (rate limiting, usage monitoring) | Alerts |
| **LLM05: Supply Chain** | ✅ Vendor validation for new tools | Approval process |
| **LLM06: Info Disclosure** | 🚨 **CRITICAL** - DLP monitoring, data masking, secrets detection | Gitleaks, pre-commit |
| **LLM07: Insecure Plugins** | ✅ Plugin validation, allowlist | Policy |
| **LLM08: Excessive Agency** | ✅ Approval for agent actions, least privilege | Workflows |
| **LLM09: Overreliance** | 🚨 **CRITICAL** - Mandatory validation (code review, tests) | Branch protection |
| **LLM10: Model Theft** | ⚠️ Manage (not applicable, no custom models) | N/A |

### LLM01: Prompt Injection - Code Example

**Vulnerable**:
```python
# DON'T DO THIS
user_input = request.form["question"]
prompt = f"Summarize the following text: {user_input}"
response = openai.chat.completions.create(
    model="gpt-4",
    messages=[{"role": "user", "content": prompt}]
)
```

**Mitigated**:
```python
# DO THIS
def sanitize_prompt(user_input: str) -> str:
    """Sanitize user input to prevent prompt injection"""
    # Blacklist suspicious patterns
    blacklist = [
        "ignore previous", "ignore all", "system:", "assistant:",
        "<|im_start|>", "new instructions:", "disregard"
    ]
    input_lower = user_input.lower()
    if any(pattern in input_lower for pattern in blacklist):
        raise ValueError("Suspicious input detected")

    # Limit length to prevent overflow attacks
    max_length = 2000
    if len(user_input) > max_length:
        user_input = user_input[:max_length]

    return user_input

# Usage
try:
    safe_input = sanitize_prompt(user_input)
    prompt = f"Summarize the following text:\n\n{safe_input}"
    response = openai.chat.completions.create(
        model="gpt-4",
        messages=[{"role": "user", "content": prompt}]
    )
except ValueError as e:
    return {"error": "Invalid input"}, 400
```

**Pre-commit hook** (`.pre-commit-config.yaml`):
```yaml
repos:
  - repo: local
    hooks:
      - id: check-prompt-injection
        name: Check for prompt injection patterns
        entry: python scripts/check_prompts.py
        language: python
        files: \.py$
        pass_filenames: true
```

**Validation script** (`scripts/check_prompts.py`):
```python
import re
import sys

# Detect direct user input in prompts without sanitization
UNSAFE_PATTERNS = [
    r'f".*\{user.*\}"',  # f-string with user input
    r'prompt\s*=.*\+.*user',  # String concatenation
]

def check_file(filepath):
    with open(filepath, 'r') as f:
        content = f.read()
        for pattern in UNSAFE_PATTERNS:
            if re.search(pattern, content):
                print(f"⚠️  {filepath}: Potential prompt injection vulnerability")
                print("   Use sanitize_prompt() before embedding user input")
                return 1
    return 0

if __name__ == "__main__":
    exit_code = 0
    for filepath in sys.argv[1:]:
        exit_code |= check_file(filepath)
    sys.exit(exit_code)
```

### LLM06: Info Disclosure - DLP Example

**Vulnerable**:
```python
# DON'T DO THIS - Sending sensitive data to LLM
user_profile = db.get_user(user_id)  # Contains PII
prompt = f"Generate a marketing email for: {user_profile}"
response = openai.chat.completions.create(
    model="gpt-4",
    messages=[{"role": "user", "content": prompt}]
)
```

**Mitigated with Presidio**:
```python
# DO THIS - Mask PII before sending to LLM
from presidio_analyzer import AnalyzerEngine
from presidio_anonymizer import AnonymizerEngine

analyzer = AnalyzerEngine()
anonymizer = AnonymizerEngine()

def mask_pii(text: str) -> tuple[str, list]:
    """Remove PII using Microsoft Presidio"""
    # Analyze text for PII
    results = analyzer.analyze(
        text=text,
        entities=["PERSON", "EMAIL_ADDRESS", "PHONE_NUMBER",
                  "CREDIT_CARD", "IBAN_CODE", "IP_ADDRESS"],
        language="en"
    )

    # Anonymize detected PII
    anonymized = anonymizer.anonymize(
        text=text,
        analyzer_results=results
    )

    return anonymized.text, results

# Usage
user_profile_str = str(user_profile)
safe_data, pii_found = mask_pii(user_profile_str)

if pii_found:
    logger.warning(f"PII detected and masked: {len(pii_found)} entities")

prompt = f"Generate a marketing email for: {safe_data}"
response = openai.chat.completions.create(
    model="gpt-4",
    messages=[{"role": "user", "content": prompt}]
)
```

**CI/CD check** (GitHub Actions):
```yaml
- name: Secrets Detection
  uses: gitleaks/gitleaks-action@v2
  with:
    args: --no-git

- name: PII Detection
  run: |
    pip install presidio-analyzer presidio-anonymizer
    python scripts/detect_pii.py --path src/
```

**PII detection script** (`scripts/detect_pii.py`):
```python
import sys
import glob
from presidio_analyzer import AnalyzerEngine

analyzer = AnalyzerEngine()

def scan_file(filepath):
    """Scan file for hardcoded PII in code"""
    with open(filepath, 'r') as f:
        content = f.read()

    # Look for PII in string literals
    results = analyzer.analyze(
        text=content,
        entities=["EMAIL_ADDRESS", "PHONE_NUMBER", "CREDIT_CARD"],
        language="en"
    )

    if results:
        print(f"⚠️  {filepath}: PII detected in code")
        for result in results:
            print(f"   {result.entity_type}: score {result.score}")
        return 1
    return 0

if __name__ == "__main__":
    exit_code = 0
    for filepath in glob.glob("src/**/*.py", recursive=True):
        exit_code |= scan_file(filepath)
    sys.exit(exit_code)
```

### LLM09: Overreliance - Validation Example

**Vulnerable**:
```python
# DON'T DO THIS - Using AI code without validation
ai_generated_code = copilot.generate_function(prompt)
exec(ai_generated_code)  # DANGEROUS - No validation!
```

**Mitigated**:
```python
# DO THIS - Mandatory review + comprehensive tests

# 1. AI code must go through PR review (branch protection)
# 2. Mark AI-generated code in commits
git commit -m "feat: Add data validation function

AI-generated: GitHub Copilot
Validated: Manual review + tests"

# 3. Comprehensive test coverage
def test_ai_generated_function():
    """Test AI-generated validation function"""
    # Happy path
    result = validate_user_input("valid@email.com")
    assert result.is_valid == True
    assert result.errors == []

    # Edge cases
    assert validate_user_input("").is_valid == False
    assert validate_user_input(None).is_valid == False
    assert validate_user_input("a" * 10000).is_valid == False  # Length check

    # Security cases
    assert validate_user_input("<script>alert(1)</script>").is_valid == False
    assert validate_user_input("'; DROP TABLE users--").is_valid == False

    # No side effects
    initial_state = get_system_state()
    validate_user_input("test")
    assert get_system_state() == initial_state

# 4. Code review checklist for AI code
"""
AI Code Review Checklist:
- [ ] AI generation clearly marked in PR description
- [ ] Tests included (>80% coverage for critical code)
- [ ] Edge cases tested (empty, null, overflow, special chars)
- [ ] Security validated (no SQLi, XSS, command injection)
- [ ] No hardcoded secrets or sensitive data
- [ ] Error handling present and tested
- [ ] Performance acceptable (if performance-critical)
- [ ] Documentation added (if complex logic)
"""
```

**Branch protection** (GitHub settings):
```json
{
  "required_pull_request_reviews": {
    "required_approving_review_count": 1,
    "dismiss_stale_reviews": true
  },
  "required_status_checks": {
    "strict": true,
    "contexts": ["tests", "security-scan", "coverage-check"]
  },
  "enforce_admins": false,
  "restrictions": null
}
```

**Coverage enforcement** (`.github/workflows/test.yml`):
```yaml
- name: Run tests with coverage
  run: |
    pytest --cov=src --cov-report=term --cov-fail-under=80

- name: Check coverage for AI-generated code
  run: |
    # Identify AI-generated files from commit messages
    git log --grep="AI-generated" --pretty=format:"%H" -1 | \
    xargs git show --name-only --pretty="" | \
    xargs coverage report --fail-under=90  # Higher bar for AI code
```

## 2. Team Security Controls

### Access Controls (Least Privilege)

| Role | Tools | Permissions |
|------|-------|-------------|
| **Junior Dev** | GitHub Copilot | Autocomplete only |
| **Mid Dev** | Copilot + ChatGPT Team | Code review, docs |
| **Senior Dev** | Copilot + ChatGPT + Claude Code | Full access |
| **Tech Lead** | All tools + admin | Team config |

**Implementation**: GitHub Teams by role, licenses by need, quarterly review.

### DLP Monitoring (Basic)

**What teams CAN do**:
1. **Secrets Detection (local)**: Pre-commit hooks (Gitleaks, TruffleHog)
2. **Data Masking (manual)**: Guidelines, examples, reviews
3. **Usage Monitoring (basic)**: Monthly logs, cost dashboard, escalate if suspicious

**What teams CAN'T do** (and it's OK): Enterprise DLP, real-time monitoring, encryption at use.

### Content Filtering

**For SaaS tools**: Use provider guardrails (enabled by default), configure team settings.

## 3. Code Scanning

### Secrets Detection (CI/CD)

**GitHub Actions**:
```yaml
name: Security Scan
on: [push, pull_request]
jobs:
  secrets:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: gitleaks/gitleaks-action@v2
```

### Static Analysis

**Linters**: pylint, ESLint, golangci-lint
**SAST**: Semgrep (open-source), Snyk (freemium), SonarQube (community)

## 4. Validation Process

### Code Review Checklist (AI Code)

**Security**:
- [ ] No hardcoded secrets
- [ ] No obvious vulnerabilities (SQLi, XSS)
- [ ] Input validation
- [ ] Error handling

**Quality**:
- [ ] Correct logic
- [ ] Adequate tests (coverage > threshold)
- [ ] Team standards
- [ ] Documentation if needed

**AI-specific**:
- [ ] AI code marked in PR
- [ ] Prompt documented (if relevant)
- [ ] Output validated (no hallucinations)

### Testing Requirements

**For critical AI-generated code**:
- Unit tests: 80% coverage minimum, edge cases mandatory
- Integration tests: Full workflows, error cases
- Manual validation: Test locally, smoke tests in staging

## 5. Vendor Validation

### New Tool Process (1-2 weeks)

**Step 1: Tech Lead Evaluation** (1-2 days)
- Security: MFA? SOC2? ISO27001?
- Privacy: Data used for training?
- Cost: Within budget?
- Support: Documentation? Available support?

**Step 2: Trial** (1-2 weeks): 2-3 people test, feedback on security/quality/UX, decide adopt/abandon

**Step 3: Rollout**: Training (1h), internal documentation, monitor adoption

### Vendor Security Checklist

- [ ] SOC2 Type II or ISO27001
- [ ] Appropriate data residency (EU, US, etc.)
- [ ] Clear privacy policy
- [ ] No training data usage (or opt-out)
- [ ] MFA available
- [ ] SSO possible (if required)
- [ ] Audit logs available

## 6. Team Incident Response

### Escalation Process

```
Incident detected → Report to Tech Lead (<1h) → Tech Lead assesses impact → Team level: Resolve internally | Org level: Escalate to IT/Security
```

**Team incidents**: bugs, accidental non-critical sharing
**Org incidents**: secret leaks, compromise, compliance violations

### Basic Playbooks

**Incident: Secret exposed in AI code**
1. <5min: Revoke secret immediately
2. <30min: Check if used (logs)
3. <1h: Notify Tech Lead + IT Security
4. <2h: Quick team post-mortem
5. <24h: Document learnings, adjust process

**Incident: Defective AI code in production**
1. <5min: Immediate rollback
2. <30min: Identify root cause
3. <1h: Fix + tests
4. <2h: Validated redeployment
5. <24h: Post-mortem, improve validation

## 7. Usage Monitoring

### Basic Tracking

**Metrics**: Active users, usage volume (requests, tokens), monthly costs
**Per person**: Daily/weekly usage, anomalies (10x average)
**Dashboard**: Google Sheets/Excel, monthly update, team meeting review

### Basic Alerts

**Trigger if**: Monthly cost >120% budget, individual usage >3x average, unapproved tool used
**Action**: Tech Lead investigates and adjusts

## Secure Checklist

- [ ] Implement secrets detection (pre-commit + CI)
- [ ] Establish AI code review process
- [ ] Configure access controls by role
- [ ] Implement vendor validation process
- [ ] Train team on OWASP LLM Top 10 (focus LLM01, 06, 09)
- [ ] Create team incident response playbook
- [ ] Monitor monthly usage

## Next Step

→ [Phase 6: Manage](06-manage.md) - Manage team AI operations
