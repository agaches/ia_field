# Phase 5: Secure - Secure Your AI Usage (AWARENESS)

## Overview

Awareness of risks and personal best practices.

## 1. Critical Risks OWASP LLM Top 10

**Focus on 2 major risks**:

**LLM06 - Information Disclosure** 🚨:

**❌ Never (all tools)**: credentials, API keys, passwords, secrets

**Internal data** (depending on tool type):

| Tool Type | Public Data | Internal Data | Confidential Data |
|------------|-------------------|------------------|------------------------|
| **Personal tools** (Personal ChatGPT, Personal Claude) | ✅ OK | ❌ Forbidden | ❌ Forbidden |
| **Corporate tools** (ChatGPT Team, Copilot Business) | ✅ OK | ⚠️ According to company policy | ❌ Forbidden unless authorized |

**Rule**: Always check your company's policy before sharing internal data

**LLM09 - Overreliance** ⚠️:
- AI can hallucinate, generate buggy code, give incorrect advice
- **Always** verify, test, validate

**Other risks** (awareness): Prompt injection, insecure output, insecure plugins
**Resource**: [OWASP LLM Top 10](https://genai.owasp.org/)

## 2. Essential Best Practices

**MFA**: Enable on all AI accounts (authenticator app, not SMS)
**Passwords**: Manager (1Password, Bitwarden), unique passwords
**Secrets**: Never in prompts (use .env, manager)

**Checklist before use**:
- Sensitive data in this prompt?
- Tool approved by company?
- Will I validate the output?

## 3. Privacy Settings

**ChatGPT**: Settings → Data Controls, disable "Improve model"
**GitHub Copilot**: Settings → Check "Public code suggestions"

## 4. Incident Response

**If error (e.g., shared API key)**:
1. Immediately: Revoke/change the secret
2. < 1h: Open IT ticket (security incident)
3. Document: What data, which tool, when, actions taken

**Rule**: Errors happen, react quickly.

## 5. Training

**AI Awareness Training (2h)** - mandatory
**Resource**: [OWASP LLM Top 10](https://genai.owasp.org/) (1h reading)

## Secure Checklist

- [ ] MFA enabled on all AI accounts
- [ ] Password manager used
- [ ] OWASP LLM Top 10 read (focus LLM06, LLM09)
- [ ] Privacy settings verified
- [ ] IT reporting process known

## Next Step

→ [Phase 6: Manage](06-manage.md) - Manage your productivity with AI
