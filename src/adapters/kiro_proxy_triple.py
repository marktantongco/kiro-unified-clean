
# ADAPT KiroProxy 391★ triple protocol OpenAI/Anthropic/Gemini + per-account proxy + FSM + BM25
# Endpoint summary: POST /v1/chat/completions, POST /v1/responses (Codex), GET /v1/models, POST /v1/messages, POST /v1/models/{model}:generateContent (Gemini)
# Admin: /api/accounts, /api/accounts/{id}/usage, /api/accounts/{id}/refresh, /api/flows, /api/quota, /api/stats, /api/health-check, /api/browsers, /api/docs
# Features: prompt caching cache_control→cachePoint, tool search regex+BM25, circuit breaker exponential backoff probabilistic retry, tiktoken Chinese accurate
# CLI: python run.py accounts list/export/import/add/scan login google/github/remote serve -p 8081 status
# Dynamic model: standardize→cache→alias→passthrough, 50 tools limit
# Payload: 615KB guard auto-trim, truncation recovery synthetic
# Thinking: FSM parser vs regex fragile
# Per-account: proxy priority > global > direct, PUT /api/accounts/{id}/proxy
# Session: stickiness 60s same account keep context continuous
# Login: Google/GitHub/Builder ID via Web UI + CLI remote link generation
from fastapi import FastAPI
app = FastAPI(title="Kiro Unified v8.2 Triple Proxy - ADAPT KiroProxy 391★")
@app.get("/health")
def health(): return {"status":"ok","version":"v8.2","adapts":["KiroProxy 391★ triple","KiroPool Go zero-MITM","headroom compression","paperthin anti-slop"],"base":"jwadow/kiro-gateway 2330★"}
