# 05 - Secure (Delivery)

> Discover security risks, protect resources and data, and detect threats

## Discover AI security risks

Identify security risks specific to AI tool usage in your delivery workflow.

### Common Security Risks

**Data exposure:**
- Code containing secrets sent to AI tools
- Client or proprietary data shared with external services
- Sensitive architecture or business logic disclosed

**Access and authentication:**
- Compromised API keys or credentials
- Unauthorized access to AI services
- Shared accounts without proper controls

**Supply chain:**
- Malicious or vulnerable AI tool dependencies
- Untrusted model sources
- Third-party service vulnerabilities

**Output risks:**
- AI-generated code with security vulnerabilities
- Insecure coding patterns in suggestions
- Outdated security practices in recommendations

### Risk Discovery Process

1. Review data classification from Strategy phase
2. Audit which tools access what data
3. Identify potential exposure points (IDE, VCS, CI/CD)
4. Assess third-party service security posture
5. Document findings and prioritize by impact

## Protect AI resources and data

Implement controls to secure AI tools, data, and resources.

### Secure AI Resources

**Access controls:**
- Use SSO or centralized identity management
- Implement least-privilege access
- Rotate API keys and credentials regularly
- Monitor access logs

**Tool security:**
- Use approved tools only (from governance policies)
- Keep tools and dependencies updated
- Review vendor security practices and compliance
- Use self-hosted options for sensitive workloads

**Infrastructure security** (if self-hosted):
- Network segmentation and firewall rules
- Encrypted communication (TLS)
- Regular security patches
- Access monitoring and logging

### Secure AI Data

**Data classification enforcement:**
- Apply data classification rules from Strategy phase
- Block sensitive data types from AI tool access
- Implement data loss prevention (DLP) where feasible

**Secret protection:**
- Pre-commit hooks to detect secrets (Gitleaks, TruffleHog)
- CI/CD scans for credentials and keys
- Secure secret management (vaults, environment variables)
- Never commit API keys, passwords, or tokens

**Code security:**
- Scan AI-generated code for vulnerabilities
- Review AI outputs for security issues
- Apply same security standards as manually written code
- Regular dependency scanning

**Example pre-commit hook:**
```yaml
# .pre-commit-config.yaml
repos:
  - repo: https://github.com/gitleaks/gitleaks
    hooks:
      - id: gitleaks
```

## Detect AI security threats

Monitor for security incidents and anomalies related to AI tool usage.

### Detection Mechanisms

**Automated scanning:**
- CI/CD security scans on every commit
- Dependency vulnerability scanning
- Code quality and security analysis
- Secret detection in repositories

**Monitoring and logging:**
- Track API usage patterns
- Log access to AI services
- Monitor for unusual data transfers
- Alert on policy violations

**Code review:**
- Manual review of AI-generated code
- Security-focused review checklist
- Peer review requirements
- Escalation process for concerns

### Incident Response

**If security issue detected:**
1. **Contain**: Revoke compromised credentials, isolate affected systems
2. **Assess**: Determine scope and impact
3. **Remediate**: Fix vulnerability, remove exposed data
4. **Communicate**: Notify affected parties per policy
5. **Learn**: Document incident, update policies and controls

## Resources

**Security tools:**
- Secret detection: Gitleaks, TruffleHog, detect-secrets
- SAST/DAST: SonarQube, Snyk, Semgrep
- Dependency scanning: Dependabot, Renovate, OWASP Dependency-Check
- CI/CD integration: GitHub Actions, GitLab CI, Jenkins plugins

**Best practices:**
- Follow OWASP secure coding guidelines
- Apply principle of least privilege
- Implement defense in depth
- Regular security training for team

## Next Step

→ [Phase 6: Manage](06-manage.md) - Manage team AI operations
