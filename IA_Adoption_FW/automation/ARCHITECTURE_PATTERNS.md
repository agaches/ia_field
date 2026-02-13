# AI Architecture Patterns

> Reference patterns for production AI systems with diagrams, tech stacks, costs, and code templates

## 1. RAG (Retrieval-Augmented Generation)

### Use Case
Q&A systems, knowledge bases, documentation search, customer support with factual accuracy

### Architecture
```
User Query
    ↓
[Embedding Model] → Vector DB (similarity search)
    ↓                      ↓
[Retrieval] ← Context (top-k relevant docs)
    ↓
[LLM] (query + context)
    ↓
Response (with citations)
```

### Tech Stack (cloud-agnostic)

| Component | Options | Selection Criteria |
|-----------|---------|-------------------|
| **Embedding** | OpenAI text-embedding-3, Cohere embed-v3, BAAI/bge-large (open-source) | Quality vs cost vs latency |
| **Vector DB** | Pinecone (managed), Weaviate (hybrid), Qdrant (self-hosted), Chroma (local dev) | Scale, features, budget |
| **LLM** | GPT-4 Turbo, Claude 3.5 Sonnet, Gemini 1.5 Pro | Context window, accuracy, cost |
| **Framework** | LangChain, LlamaIndex, Haystack | Maturity, flexibility |
| **Storage** | AWS S3 / GCP Cloud Storage / Azure Blob (documents) | Cloud provider |

### Cost Example (10K queries/day)

| Component | Monthly Cost |
|-----------|--------------|
| Embedding API (10K queries × 30 days × $0.00013/1K tokens avg) | ~$50 |
| Vector DB (managed, 1M vectors) | $200 |
| LLM API (10K × 30 × 2K tokens avg × $0.03/1K) | $1,800 |
| Infrastructure (API server, cache) | $100 |
| **Total** | **~$2,150/month** |

**Scaling**: 100K queries/day → ~$18K/month (mostly LLM costs)

### Code Template (LangChain + Pinecone)

```python
from langchain.vectorstores import Pinecone
from langchain.embeddings import OpenAIEmbeddings
from langchain.chat_models import ChatOpenAI
from langchain.chains import RetrievalQA
from langchain.prompts import PromptTemplate
import pinecone

# Initialize
pinecone.init(api_key="...", environment="...")
embeddings = OpenAIEmbeddings(model="text-embedding-3-large")
vectorstore = Pinecone.from_existing_index("docs-index", embeddings)

# Configure LLM
llm = ChatOpenAI(model="gpt-4-turbo", temperature=0)

# Custom prompt with citations
prompt_template = """Use the following context to answer the question.
If you don't know, say you don't know. Always cite sources.

Context: {context}

Question: {question}

Answer with citations:"""

PROMPT = PromptTemplate(
    template=prompt_template,
    input_variables=["context", "question"]
)

# RAG chain
qa_chain = RetrievalQA.from_chain_type(
    llm=llm,
    chain_type="stuff",
    retriever=vectorstore.as_retriever(
        search_type="similarity",
        search_kwargs={"k": 3}  # Top 3 docs
    ),
    return_source_documents=True,
    chain_type_kwargs={"prompt": PROMPT}
)

# Query
response = qa_chain({"query": "How do I deploy ML models?"})
print(response["result"])
print(f"\nSources: {[doc.metadata['source'] for doc in response['source_documents']]}")
```

### Best Practices

- **Chunking**: 500-1000 tokens per chunk with overlap (50-100 tokens)
- **Hybrid search**: Combine semantic + keyword search for better recall
- **Reranking**: Use cross-encoder to rerank top-k results before LLM
- **Caching**: Cache frequent queries (Redis) to reduce costs
- **Monitoring**: Track retrieval quality (precision@k, MRR)

---

## 2. Fine-tuning Pipeline

### Use Case
Custom behavior, domain-specific language, style adaptation, task specialization (classification, extraction)

### Architecture
```
Training Data (JSONL)
    ↓
[Data Validation] → Quality checks (format, diversity, balance)
    ↓
[Fine-tuning Job] → OpenAI API / SageMaker / Vertex AI
    ↓
[Model Evaluation] → Performance vs base model
    ↓
[Model Registry] → MLflow / SageMaker Model Registry
    ↓
[A/B Testing] → Canary deployment (10% → 50% → 100%)
    ↓
[Production]
```

### Tech Stack

| Component | Options | Notes |
|-----------|---------|-------|
| **Platform** | OpenAI Fine-tuning API, AWS SageMaker, GCP Vertex AI, Azure AI Foundry | Managed vs self-hosted |
| **Base Models** | GPT-4, GPT-3.5, Claude (coming), Llama 3 (open-source) | Availability varies |
| **Registry** | MLflow, SageMaker Model Registry, Azure ML Registry | Version tracking |
| **Monitoring** | Weights & Biases, LangSmith, custom dashboards | Experiment tracking |

### Cost Example

**Training** (one-time):
- OpenAI GPT-3.5 fine-tuning: $0.008/1K tokens
- Dataset: 10K examples × 500 tokens avg = 5M tokens
- Training cost: 5M × $0.008/1K = **$40**

**Inference** (ongoing):
- Fine-tuned model: ~20-50% premium vs base model
- Example: 1M tokens/month
  - Base GPT-3.5: $1.50 (input) + $2.00 (output) = **$3.50/month**
  - Fine-tuned: $3.00 + $4.00 = **$7.00/month** (+100% cost)

**Total first month**: $40 (training) + $7 (inference) = **$47**
**Subsequent months**: **$7/month**

### Training Data Format (OpenAI)

```jsonl
{"messages": [{"role": "system", "content": "You are a customer support assistant."}, {"role": "user", "content": "How do I reset my password?"}, {"role": "assistant", "content": "To reset your password: 1. Go to Settings > Security 2. Click 'Reset Password' 3. Check your email for the reset link"}]}
{"messages": [{"role": "system", "content": "You are a customer support assistant."}, {"role": "user", "content": "Where is my order?"}, {"role": "assistant", "content": "To track your order: 1. Visit Orders page 2. Enter order number 3. View real-time status"}]}
```

**Dataset requirements**:
- Minimum: 50-100 examples (start), 500+ examples (recommended)
- Quality > Quantity: Clean, diverse, representative
- Balance: Cover all use cases evenly

### Validation Checklist

Before fine-tuning:
- [ ] Dataset quality: No PII, no duplicates, balanced across classes
- [ ] Base model benchmark: Accuracy, F1, perplexity on test set
- [ ] Cost estimate: Training + inference vs prompt engineering
- [ ] Rollback plan: Keep base model in production during testing

After fine-tuning:
- [ ] Performance improvement: +X% on target metrics (min +10% to justify)
- [ ] No regression: Maintained quality on other tasks
- [ ] Latency check: Fine-tuned model latency acceptable
- [ ] Cost validation: ROI positive (cost increase < value gained)

### Code Example (OpenAI API)

```python
import openai

# 1. Upload training file
with open("training_data.jsonl", "rb") as f:
    training_file = openai.File.create(file=f, purpose="fine-tune")

# 2. Create fine-tuning job
fine_tune = openai.FineTuningJob.create(
    training_file=training_file.id,
    model="gpt-3.5-turbo",
    hyperparameters={
        "n_epochs": 3  # Adjust based on dataset size
    }
)

# 3. Monitor job
import time
while True:
    job = openai.FineTuningJob.retrieve(fine_tune.id)
    print(f"Status: {job.status}")
    if job.status in ["succeeded", "failed", "cancelled"]:
        break
    time.sleep(60)

# 4. Use fine-tuned model
if job.status == "succeeded":
    model_id = job.fine_tuned_model
    response = openai.ChatCompletion.create(
        model=model_id,
        messages=[
            {"role": "user", "content": "How do I reset my password?"}
        ]
    )
    print(response.choices[0].message.content)
```

---

## 3. Multi-Agent System

### Use Case
Complex workflows, research tasks, autonomous operations, orchestrated decision-making

### Architecture
```
User Intent
    ↓
[Orchestrator Agent] → Task decomposition + routing
    ↓
┌─────────────┬──────────────┬─────────────┬──────────────┐
│   Research  │     Code     │   Analysis  │  Validation  │
│    Agent    │    Agent     │    Agent    │    Agent     │
└─────────────┴──────────────┴─────────────┴──────────────┘
    ↓
[Aggregator] → Synthesize results + quality check
    ↓
Final Output (with provenance)
```

### Tech Stack

| Component | Options | Notes |
|-----------|---------|-------|
| **Framework** | LangGraph, AutoGPT, CrewAI, Microsoft Autogen | Orchestration complexity |
| **Orchestrator LLM** | GPT-4, Claude 3.5 Opus (reasoning) | High-capability model |
| **Specialist LLMs** | GPT-3.5, Claude 3.5 Haiku (cost optimization) | Task-specific selection |
| **Memory** | Redis (short-term), PostgreSQL (long-term) | State management |
| **Monitoring** | LangSmith, custom dashboards | Multi-step tracing |

### Cost Considerations

**Token multiplication**: Multi-agent = 5-10x single agent
- Single agent: 1 call × 2K tokens = 2K tokens
- Multi-agent: 1 orchestrator + 4 specialists + 1 aggregator = 6 calls × 2K avg = **12K tokens**

**Example task cost** (complex research):
- Orchestrator (GPT-4): 3K tokens × $0.03/1K = $0.09
- 4 Specialists (GPT-3.5): 4 × 2K × $0.001/1K = $0.008
- Aggregator (GPT-4): 3K × $0.03/1K = $0.09
- **Total per task**: **~$0.19**

**Monthly cost** (100 complex tasks/day):
- 100 × 30 × $0.19 = **$570/month**

**Latency**: Sequential operations = 30-120 seconds per task (not real-time)

### Code Example (LangGraph)

```python
from langgraph.graph import StateGraph, END
from langchain.chat_models import ChatOpenAI
from typing import TypedDict, List

# Define state
class AgentState(TypedDict):
    task: str
    research_results: List[str]
    code_results: List[str]
    final_output: str

# Define agents
orchestrator = ChatOpenAI(model="gpt-4", temperature=0)
research_agent = ChatOpenAI(model="gpt-3.5-turbo")
code_agent = ChatOpenAI(model="gpt-3.5-turbo")

# Define nodes
def orchestrate(state: AgentState) -> AgentState:
    """Decompose task into subtasks"""
    response = orchestrator.invoke(
        f"Break down this task into research and code subtasks: {state['task']}"
    )
    # Update state with plan
    return state

def research(state: AgentState) -> AgentState:
    """Execute research subtasks"""
    results = []
    for subtask in state.get("research_subtasks", []):
        result = research_agent.invoke(subtask)
        results.append(result.content)
    state["research_results"] = results
    return state

def code(state: AgentState) -> AgentState:
    """Execute code subtasks"""
    results = []
    for subtask in state.get("code_subtasks", []):
        result = code_agent.invoke(subtask)
        results.append(result.content)
    state["code_results"] = results
    return state

def aggregate(state: AgentState) -> AgentState:
    """Synthesize all results"""
    all_results = state["research_results"] + state["code_results"]
    final = orchestrator.invoke(
        f"Synthesize these results into a final answer: {all_results}"
    )
    state["final_output"] = final.content
    return state

# Build graph
workflow = StateGraph(AgentState)
workflow.add_node("orchestrate", orchestrate)
workflow.add_node("research", research)
workflow.add_node("code", code)
workflow.add_node("aggregate", aggregate)

workflow.set_entry_point("orchestrate")
workflow.add_edge("orchestrate", "research")
workflow.add_edge("orchestrate", "code")
workflow.add_edge("research", "aggregate")
workflow.add_edge("code", "aggregate")
workflow.add_edge("aggregate", END)

app = workflow.compile()

# Execute
result = app.invoke({"task": "Build a data pipeline for customer analytics"})
print(result["final_output"])
```

### Reliability Patterns

**Retry with exponential backoff**:
```python
from tenacity import retry, stop_after_attempt, wait_exponential

@retry(stop=stop_after_attempt(3), wait=wait_exponential(min=1, max=10))
def call_agent(task):
    return agent.invoke(task)
```

**Fallback to simpler approach**:
```python
try:
    result = multi_agent_system.run(complex_task)
except Exception as e:
    logger.warning(f"Multi-agent failed: {e}. Falling back to single agent.")
    result = single_agent.run(simplified_task)
```

---

## 4. Production Chatbot

### Use Case
Customer support, internal knowledge assistant, e-commerce, HR helpdesk

### Architecture
```
User Message
    ↓
[Intent Classification] → Route to appropriate handler
    ↓
[Context Retrieval] → RAG (knowledge base + conversation history)
    ↓
[LLM Generation] → Response with citations
    ↓
[Safety Filters] → Content moderation, PII masking
    ↓
[Response to User] (with feedback mechanism)
```

### Tech Stack

| Component | Options | Notes |
|-----------|---------|-------|
| **Frontend** | Custom React, Intercom SDK, Zendesk Chat, Slack Bot | Integration points |
| **Backend** | FastAPI, Flask, Node.js Express | API framework |
| **LLM** | GPT-4 Turbo (accuracy), Claude 3.5 Sonnet (citations), Gemini 1.5 Pro | Context window important |
| **Knowledge** | RAG (see Pattern 1) | Document retrieval |
| **Safety** | OpenAI Moderation API, Guardrails AI | Content filtering |
| **Monitoring** | LangSmith, DataDog, custom metrics | Latency, quality tracking |
| **Storage** | PostgreSQL (conversations), Redis (session cache) | Persistence |

### SLAs & Scaling

| Metric | Target | Implementation |
|--------|--------|----------------|
| **Latency** | <2s p95 | Streaming responses, CDN, caching |
| **Uptime** | 99.9% | Multi-region deployment, health checks |
| **Concurrency** | 1K concurrent users | Auto-scaling (K8s HPA), rate limiting |
| **Accuracy** | >90% user satisfaction | Continuous monitoring, A/B testing |

### Cost Example (E-commerce - 50K conversations/month)

| Component | Calculation | Monthly Cost |
|-----------|-------------|--------------|
| LLM API | 50K × 3K tokens avg × $0.03/1K (GPT-4 Turbo) | $4,500 |
| RAG (vector DB + embeddings) | 50K queries + 100K docs | $500 |
| Infrastructure | K8s cluster (2 nodes) + load balancer | $800 |
| Monitoring | LangSmith Pro + DataDog | $300 |
| Storage | PostgreSQL (conversations) + Redis | $150 |
| **Total** | | **$6,250/month** |

**Scaling**: 500K conversations/month → ~$50K/month (mostly LLM costs)

### Code Example (FastAPI + OpenAI)

```python
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import openai
from typing import List, Optional

app = FastAPI()

class Message(BaseModel):
    role: str
    content: str

class ChatRequest(BaseModel):
    conversation_id: str
    message: str
    history: Optional[List[Message]] = []

class ChatResponse(BaseModel):
    response: str
    sources: List[str]
    conversation_id: str

@app.post("/chat", response_model=ChatResponse)
async def chat(request: ChatRequest):
    """Chatbot endpoint with RAG"""
    try:
        # 1. Retrieve relevant context from knowledge base
        context_docs = retriever.search(request.message, k=3)
        context = "\n".join([doc.content for doc in context_docs])

        # 2. Build messages with context
        messages = [
            {"role": "system", "content": f"You are a helpful assistant. Use this context: {context}"},
            *[{"role": m.role, "content": m.content} for m in request.history[-5:]],  # Last 5 messages
            {"role": "user", "content": request.message}
        ]

        # 3. Generate response
        response = openai.ChatCompletion.create(
            model="gpt-4-turbo",
            messages=messages,
            temperature=0.7,
            max_tokens=500,
            stream=False  # Set True for streaming
        )

        # 4. Extract response
        assistant_message = response.choices[0].message.content

        # 5. Safety check
        moderation = openai.Moderation.create(input=assistant_message)
        if moderation.results[0].flagged:
            raise HTTPException(status_code=400, detail="Response flagged by moderation")

        return ChatResponse(
            response=assistant_message,
            sources=[doc.metadata["source"] for doc in context_docs],
            conversation_id=request.conversation_id
        )

    except Exception as e:
        logger.error(f"Chat error: {e}")
        raise HTTPException(status_code=500, detail="Internal error")

# Health check
@app.get("/health")
async def health():
    return {"status": "healthy"}
```

### Monitoring Dashboard (Key Metrics)

```python
# Key metrics to track
metrics = {
    "latency_p95": "Response time 95th percentile",
    "error_rate": "% of failed requests",
    "user_satisfaction": "Thumbs up/down ratio",
    "hallucination_rate": "% of responses without source",
    "cost_per_conversation": "Total cost / conversation count",
    "active_users": "Unique users per day",
    "conversations_per_user": "Engagement metric"
}
```

---

## 5. Batch Document Processing

### Use Case
Contract analysis, resume screening, invoice processing, compliance review, data extraction

### Architecture
```
Documents (S3/GCS/Blob)
    ↓
[Document Queue] → SQS/Pub/Sub/Queue Storage
    ↓
[Workers] → Parallel processing (Celery, Lambda, Cloud Functions)
    ↓
[OCR/Extraction] → Extract text from PDFs/images
    ↓
[LLM Analysis] → Structured data extraction + classification
    ↓
[Validation] → Business rules + quality checks
    ↓
[Storage] → Database (PostgreSQL, BigQuery, Snowflake)
```

### Tech Stack

| Component | Options | Notes |
|-----------|---------|-------|
| **Queue** | AWS SQS, GCP Pub/Sub, Azure Queue Storage, Redis Queue | Message durability |
| **Workers** | AWS Lambda, GCP Cloud Functions, Azure Functions, Celery (self-hosted) | Scale vs control |
| **OCR** | AWS Textract, GCP Document AI, Azure Form Recognizer, Tesseract (open-source) | Accuracy vs cost |
| **LLM** | GPT-4 Turbo (accuracy), Claude 3.5 Sonnet (long context 200K), Gemini 1.5 Pro (1M tokens) | Context window critical |
| **Storage** | PostgreSQL, MongoDB, BigQuery (analytics), Snowflake | Query patterns |
| **Monitoring** | CloudWatch, Stackdriver, Application Insights | Job tracking |

### Throughput & Cost

| Volume | Processing Time | Cost Breakdown | Monthly Cost |
|--------|----------------|----------------|--------------|
| **1K docs/day** | ~1 hour (100 workers) | OCR: $50, LLM: $100, Infra: $50 | **$200** |
| **10K docs/day** | ~2 hours (500 workers) | OCR: $400, LLM: $800, Infra: $300 | **$1,500** |
| **100K docs/day** | ~4 hours (2K workers) | OCR: $3,500, LLM: $6,000, Infra: $2,500 | **$12,000** |

**Assumptions**: Avg 3 pages/doc, 2K tokens/doc, $0.01/page OCR, $0.03/1K tokens LLM

### Code Example (Celery + AWS)

```python
from celery import Celery
import boto3
import openai
from typing import Dict, Any

# Celery config
app = Celery('doc_processing', broker='redis://localhost:6379/0')

s3 = boto3.client('s3')
textract = boto3.client('textract')

@app.task(bind=True, max_retries=3, default_retry_delay=60)
def process_document(self, doc_id: str, s3_bucket: str, s3_key: str) -> Dict[str, Any]:
    """Process document with idempotency and retries"""
    try:
        # 1. Check if already processed (idempotency)
        if db.is_processed(doc_id):
            logger.info(f"Document {doc_id} already processed")
            return {"status": "already_processed", "doc_id": doc_id}

        # 2. Extract text with OCR
        logger.info(f"Extracting text from {s3_key}")
        response = textract.start_document_text_detection(
            DocumentLocation={'S3Object': {'Bucket': s3_bucket, 'Name': s3_key}}
        )
        job_id = response['JobId']

        # Wait for OCR completion (simplified - use callback in production)
        import time
        while True:
            result = textract.get_document_text_detection(JobId=job_id)
            if result['JobStatus'] in ['SUCCEEDED', 'FAILED']:
                break
            time.sleep(5)

        if result['JobStatus'] == 'FAILED':
            raise Exception("OCR failed")

        # Extract text
        text = "\n".join([block['Text'] for block in result['Blocks'] if block['BlockType'] == 'LINE'])

        # 3. LLM analysis for structured extraction
        logger.info(f"Analyzing document {doc_id}")
        prompt = f"""Extract the following information from this document:
- Document type (invoice, contract, resume, etc.)
- Key entities (names, dates, amounts)
- Summary (2-3 sentences)

Document:
{text}

Output as JSON."""

        response = openai.ChatCompletion.create(
            model="gpt-4-turbo",
            messages=[{"role": "user", "content": prompt}],
            temperature=0,
            response_format={"type": "json_object"}
        )

        analysis = json.loads(response.choices[0].message.content)

        # 4. Validate extraction
        if not validate_extraction(analysis):
            raise ValueError("Extraction validation failed")

        # 5. Save to database (atomic)
        result_data = {
            "doc_id": doc_id,
            "text": text,
            "analysis": analysis,
            "processed_at": datetime.utcnow()
        }
        db.save_result(doc_id, result_data)

        logger.info(f"Document {doc_id} processed successfully")
        return {"status": "success", "doc_id": doc_id, "analysis": analysis}

    except Exception as e:
        logger.error(f"Error processing {doc_id}: {e}")
        # Retry with exponential backoff
        raise self.retry(exc=e, countdown=2 ** self.request.retries)

# Trigger processing from S3 event
@app.task
def handle_s3_upload(event: Dict):
    """Handle S3 upload event"""
    for record in event['Records']:
        bucket = record['s3']['bucket']['name']
        key = record['s3']['object']['key']
        doc_id = key.split('/')[-1].split('.')[0]

        # Enqueue processing task
        process_document.delay(doc_id, bucket, key)
```

### Reliability Patterns

**Idempotency**:
```python
def is_processed(doc_id: str) -> bool:
    """Check if document already processed"""
    return db.execute("SELECT 1 FROM processed_docs WHERE doc_id = %s", (doc_id,)).fetchone() is not None
```

**Dead Letter Queue**:
```python
# After max retries, send to DLQ for manual review
@app.task
def handle_failure(task_id, exc, doc_id):
    dlq.send_message({"doc_id": doc_id, "error": str(exc), "task_id": task_id})
    alert_team(f"Document {doc_id} failed after retries")
```

**Quality sampling**:
```python
# Sample 5% of processed docs for human review
if random.random() < 0.05:
    add_to_review_queue(doc_id, result)
```

---

## Pattern Selection Guide

| Pattern | Best For | Complexity | Cost | Latency |
|---------|----------|------------|------|---------|
| **RAG** | Knowledge Q&A, factual accuracy | Medium | $$$ | <2s |
| **Fine-tuning** | Custom behavior, task specialization | Medium | $$ | <1s |
| **Multi-Agent** | Complex workflows, research | High | $$$$ | 30-120s |
| **Chatbot** | User interaction, support | High | $$$$ | <2s |
| **Batch Processing** | Large-scale document analysis | Medium | $$-$$$$ | Minutes-hours |

**Combining patterns**: Many production systems combine multiple patterns (e.g., Chatbot + RAG, Batch + Fine-tuning)

---

## Additional Resources

- [LangChain Documentation](https://python.langchain.com/docs/get_started/introduction)
- [OpenAI Fine-tuning Guide](https://platform.openai.com/docs/guides/fine-tuning)
- [Pinecone Vector Database](https://docs.pinecone.io/)
- [AWS Architecture Center](https://aws.amazon.com/architecture/)
- [GCP Architecture Framework](https://cloud.google.com/architecture/framework)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
