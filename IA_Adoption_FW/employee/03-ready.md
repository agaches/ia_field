# Phase 3: Ready - Personal AI Environment Configuration

## Establish AI governance

### Company policy compliance

**Required actions**:
- [ ] Read your company's AI usage policy (check intranet, HR, or IT)
- [ ] Clarify approved tools and authorized data types
- [ ] Sign attestation or acknowledgment if required
- [ ] Understand security obligations and restrictions

**If no policy exists**:
- Follow general data classification rules from [Phase 1](01-strategy.md)
- Err on the side of caution with company data
- Consider proposing a policy to management

### Personal governance principles

- **Accountability**: You own what you share and produce
- **Compliance**: Follow company rules even when inconvenient
- **Transparency**: Disclose AI usage appropriately
- **Continuous learning**: Stay updated on policy changes

## Establish AI networking

### Network requirements

**SaaS = Minimal configuration needed**

**Verify basic connectivity**:
- [ ] Internet access (HTTPS) is functional
- [ ] AI tools not blocked by company proxy/firewall
- [ ] No VPN issues preventing access

**If tools are blocked**:
1. Contact IT support with business justification
2. Document approved use cases
3. Request whitelist/exception if appropriate
4. Use alternative approved tools if needed

**Note**: No special network setup required for SaaS tools.

## Establish AI reliability

### Availability planning

**Tool redundancy**:
- Have 2+ AI tools available (e.g., ChatGPT + Claude)
- If one is down, switch to backup tool
- Check provider status pages for outages

**Offline fallback**:
- Maintain traditional workflows for critical tasks
- Don't rely solely on AI for time-sensitive work
- Keep documentation for manual processes

### Service reliability checks

- [ ] Bookmark provider status pages
- [ ] Set up account on backup tool
- [ ] Test both tools work from your network
- [ ] Identify critical vs. nice-to-have AI tasks

## Establish an AI foundation

### Build an AI environment

**For all users**:

**1. Account security**:
- [ ] Enable MFA/2FA on all AI accounts (use authenticator app, not SMS)
- [ ] Install password manager (1Password, Bitwarden, etc.)
- [ ] Use unique passwords for each service

**2. Privacy configuration**:
- [ ] ChatGPT: Settings → Data Controls → Disable "Improve model"
- [ ] GitHub Copilot: Settings → Check "Public code suggestions" settings
- [ ] Claude: Review data retention settings
- [ ] Check each tool's privacy options

**For developers**:

**3. IDE setup**:
- [ ] Install IDE extension:
  - VS Code: GitHub Copilot / Codeium extension
  - Cursor: Built-in AI (no extension needed)
  - JetBrains: AI Assistant plugin
- [ ] Configure extension settings
- [ ] Test on sample code

**4. Code security**:
- [ ] Never hardcode credentials (use environment variables)
- [ ] Verify .gitignore includes: `.env`, `*.key`, `secrets.json`, `*.pem`
- [ ] Set up secret scanning if available
- [ ] Review what code assistant can access

**Installation**: Follow official documentation for each tool:
- [GitHub Copilot setup](https://docs.github.com/copilot)
- [Cursor setup](https://cursor.sh/docs)
- [Claude Code setup](https://claude.ai/code)

## Ready Checklist

- [ ] Read and accept company AI policy
- [ ] Verify network access to AI tools
- [ ] Set up 2+ tools for redundancy
- [ ] Enable MFA on all AI accounts
- [ ] Install password manager
- [ ] Configure privacy settings
- [ ] Install IDE extensions (if developer)
- [ ] Verify .gitignore (if developer)
- [ ] Test complete setup

## Next Step

→ [Phase 4: Govern](04-govern.md) - Govern your AI usage
