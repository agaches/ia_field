# Parcours de Formation IA

> Guide des formations pour progresser du Niveau 1 au Niveau 4

## 1. Vue d'ensemble

**Philosophie** : Progression 1→2→3→4 avec validation par projet pratique.

**Structure par parcours** :
- **Concepts** : Théorie, fondamentaux (ce qu'il faut comprendre)
- **Outils** : Pratique, découverte et usage (ce qu'il faut savoir utiliser)

**Validation** : Chaque parcours se termine par un projet pratique pour valider les acquis.

---

## 2. Format formations outils

### Structure type (2h)

**1. Panorama introductif** (15min)
- Distinguer les outils (ex: Gemini App vs Workspace vs NotebookLM)
- Méthode de base (ex: S.C.P.E. - Situation, Contexte, Objectif, Format)
- Éthique et sécurité (RGPD, confidentialité)

**2. Scénarios live** (80-90% du temps)
- Cas d'usage métier concrets
- Hands-on, learning by doing
- Plusieurs outils en action

**3. Next steps** (10min)
- Ressources internes
- Sessions Q&R
- Prochaines formations

### Exemple : Découverte Gemini (2h)

**1. Panorama** (15min)
- Distinguer : Gemini App (cerveau public), Gemini Workspace (assistant intégré), NotebookLM (expert données)
- Méthode S.C.P.E. (Situation, Contexte, Objectif, Format)
- RGPD et confidentialité

**2. Gemini App** (25min)
- Scénario : "Préparer une réunion d'équipe"
- Recherche web + Analyse PDF + Génération support

**3. Gemini Workspace** (50min)
- Side panel : Navigation Drive ↔ Gmail
- Gmail : Synthèse fil discussion + Réponse polie
- Sheets : Structure suivi projet en 3 secondes
- Slides : Génération images concepts abstraits

**4. NotebookLM** (20min)
- Import 5 CR + stratégie annuelle
- Génération FAQ nouveaux arrivants
- Audio overview (podcast) pour managers
- Vérification faits (citations cliquables)

**5. Next steps** (10min)
- Ressources internes IA
- Sessions Q&R

### Adaptation par niveau

- **Niveau 1→2** : Outils SaaS (ChatGPT, Claude, Copilot) - Scénarios simples
- **Niveau 2→3** : Outils PaaS (APIs, LangChain, Vector DBs) - Scénarios techniques
- **Niveau 3→4** : Outils IaaS (K8s, Terraform, MLOps) - Scénarios production

---

## 3. Parcours 1→2 (Basique → Intermédiaire)

**Objectif** : SaaS → API + usage équipe

### Concepts

**Fondamentaux GenAI**
- LLM, tokens, contexte, limites
- GenAI vs ML classique
- Hallucinations et vérification

**Prompt Engineering**
- Structure prompt efficace (S.C.P.E.)
- Few-shot learning
- Chain-of-thought (CoT)

**Pratique métier**
- Templates prompts métier
- Intégration workflow quotidien
- Cas d'usage par rôle

### Outils

**Découverte**
- ChatGPT (Plus ou Team)
- Claude (Pro)
- GitHub Copilot
- M365 Copilot (si applicable)

**Avancée**
- APIs basics (OpenAI, Anthropic)
- Gestion tokens et coûts
- Intégrations simples

### Validation

**Projet** : Automatiser 3 tâches quotidiennes avec IA
- 3 prompts complexes (few-shot, CoT)
- 1 appel API simple
- Documentation cas d'usage

**Quiz** : Fondamentaux GenAI (80% pass)

### Ressources

- Coursera : Google AI Essentials
- learnprompting.org
- Anthropic Learn, Microsoft Learn
- Communautés : r/ChatGPT, Discord Claude

**Certifications (optionnelles)** :
- Google AI Essentials
- Microsoft AI Skills Challenge

---

## 4. Parcours 2→3 (Intermédiaire → Avancé)

**Objectif** : API → RAG/ML custom + MLOps basics

### Concepts

**AI/ML Fundamentals**
- Architectures LLM (GPT, Claude, Llama)
- ML pipelines
- GenAI vs ML classique

**Advanced Prompting**
- ReAct (Reasoning + Acting)
- Tree-of-Thought
- Evaluation prompts

**RAG & Vector DBs**
- Embeddings et similarité
- Chunking strategies
- Retrieval optimization

**MLOps Basics**
- Versioning (Git, DVC)
- CI/CD pour ML
- Monitoring basics

### Outils

**Découverte**
- LangChain / LlamaIndex
- Pinecone / Weaviate (Vector DBs)
- AutoML (SageMaker, Vertex AI)

**Avancée**
- OpenAI/Anthropic APIs (avancé)
- RAG frameworks
- Prompt evaluation (LangSmith)

### Validation

**Projet RAG** : Application fonctionnelle
- App RAG complète (Q&A sur docs internes)
- Latency <2s (p95)
- Tests automatisés
- Documentation technique

### Ressources

- Udacity : AI/ML courses
- AWS Skill Builder, GCP Skills Boost
- Fast.ai
- DeepLearning.AI

**Certifications** :
- AWS ML Specialty
- Google ML Engineer
- Azure AI Engineer

---

## 5. Parcours 3→4 (Avancé → Expert)

**Objectif** : RAG/ML → Fine-tuning LLM + Infrastructure production

### Concepts

**ML Avancé & Fine-Tuning LLM**
- LoRA, QLoRA, PEFT
- RLHF (Reinforcement Learning from Human Feedback)
- Distributed training (DeepSpeed, FSDP)

**Infrastructure IA**
- Multi-region architecture
- GPU optimization
- Autoscaling strategies

**MLOps Complet**
- CI/CD/CT (Continuous Training)
- A/B testing, canary deployments
- Observabilité production

**IA Responsable**
- Fairness, bias mitigation
- Audits et compliance (NIST AI RMF)
- Red-teaming

**Architecture & Scale**
- Patterns architecture IA
- Performance optimization
- Leadership technique

### Outils

**Découverte**
- Kubernetes (K8s)
- Terraform
- MLflow, Weights & Biases

**Avancée**
- GPU clusters (A100/H100)
- DeepSpeed, FSDP
- Kubeflow
- Prometheus, Grafana

### Validation

**Projet production** :
- Fine-tuning LLM (LoRA/QLoRA) sur données métier
- Infrastructure K8s multi-region
- CI/CD/CT complet
- Monitoring + Alerting
- Audit IA Responsable
- ROI documenté

### Ressources

- Fast.ai Advanced
- Stanford CS courses
- Papers (arXiv)
- NIST AI RMF documentation

**Certifications** :
- AWS/GCP/Azure ML Advanced
- Kubernetes Application Developer (CKAD)

---

## 6. Gouvernance formation

### LIGHT - Employee (Niveau 1-2)

**Responsabilités** :
- Individu : Auto-évaluation, formation autonome
- Manager : Validation budget, temps alloué

**Validation** :
- Quiz en ligne (80% pass)
- 3 prompts complexes
- Update Skills Matrix

### MEDIUM - Delivery (Niveau 2-3)

**Responsabilités** :
- Individu : Engagement formation
- Tech Lead : Planification, code review, mentoring
- RH/L&D : Budget, certifications

**Validation** :
- Projet RAG complet
- Code review (Tech Lead + Senior Dev)
- Présentation technique (30min)
- Update Skills Matrix

### FULL - Automation (Niveau 3-4)

**Responsabilités** :
- Individu : Formation + leadership
- Tech Lead : Architecture reviews, mentoring
- AI CoE : Gouvernance, audits
- CTO/VP : Sponsor, décisions stratégiques

**Validation** :
- Projet production complexe
- Code review + Architecture review
- Audit IA Responsable
- Demo live sous charge
- ROI documenté
- Update Skills Matrix

---

## 7. Peer Learning & Knowledge Sharing

**Tech Talks** (weekly, 30min)
- Membre présente outil/concept IA
- Q&R équipe

**Code Review AI** (per PR)
- Review prompts, API calls, modèles
- Partage best practices

**Lunch & Learn** (bi-monthly, 1h)
- Discussion informelle tech IA
- Veille techno

**Hackathon** (quarterly, 1 day)
- Expérimentation nouvelles tech
- POCs rapides

**Knowledge Base** (wiki interne)
- Prompts library
- Templates réutilisables
- Learnings et FAQ

---

## 8. Ressources recommandées

### Plateformes de formation

- **Coursera** : Google AI Essentials, Specializations
- **Udacity** : AI/ML Nanodegrees
- **Fast.ai** : Practical Deep Learning
- **DeepLearning.AI** : Andrew Ng courses
- **AWS Skill Builder** (si AWS)
- **GCP Skills Boost** (si GCP)
- **Microsoft Learn** (si Azure)

### Certifications par cloud provider

**AWS** :
- ML Specialty (Niveau 2-3)
- ML Advanced (Niveau 3-4)

**GCP** :
- ML Engineer (Niveau 2-3)
- Professional ML Engineer (Niveau 3-4)

**Azure** :
- AI Engineer Associate (Niveau 2-3)
- AI Engineer Expert (Niveau 3-4)

**Autres** :
- Kubernetes CKAD (Niveau 3-4)
- TensorFlow Developer (Niveau 2-3)

### Livres

- "Hands-On Machine Learning" (Aurélien Géron)
- "Designing Data-Intensive Applications" (Martin Kleppmann)
- "Building Machine Learning Pipelines" (O'Reilly)

### Communautés

- Reddit : r/MachineLearning, r/LocalLLaMA
- Discord : Claude AI, OpenAI Developer
- GitHub : HuggingFace, LangChain
- Papers : arXiv.org (ML section)

---

## Next steps

1. **Évaluer votre niveau** : [SKILLS.md](SKILLS.md)
2. **Choisir votre parcours** : Selon votre niveau actuel
3. **Démarrer la formation** : Concepts + Outils
4. **Valider par projet** : Projet pratique
5. **Update Skills Matrix** : Suivre votre progression

**Questions ?** Consultez votre Tech Lead ou AI CoE.
