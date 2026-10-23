# Kiro Unified v8.2 - Zero-MITM + Triple Protocol + Compression + Anti-Slop

**BASE RANK1 CONFIRMED: jwadow/kiro-gateway 2330★ 206c 13rel 557 forks AGPL-3.0** - Python FastAPI dual OpenAI/Anthropic extended thinking exclusive vision web search tool calling retry 403/429/5xx smart token refresh 4 auth JSON env AWS SSO SQLite multi-account failover

[![Version](https://img.shields.io/badge/version-v8.2-blue)]()
[![BASE](https://img.shields.io/badge/BASE-jwadow%2Fkiro--gateway-2330★-green)]()
[![RANK2](https://img.shields.io/badge/RANK2-KiroProxy-391★-orange)]()
[![RANK3](https://img.shields.io/badge/RANK3-KiroPool%20Go-10★-yellow)]()
[![Compression](https://img.shields.io/badge/compression-headroom-77625★-purple)]()

## Architecture v8.2 (SIMPLER than v8.1+24)

**REPLACES:** MITM cert install + fragmented auth + regex fragile thinking parser + no payload guard  
**WITH:** 2 binaries (Go single static embedded admin React Tailwind SSE + Bun plugin SQLite) + 2 low-cost tools (headroom uv install + paperthin npx add)

```
Client (Kiro CLI + Kiro Web https://kiro.dev/web + Claude Code/Codex/opencode)
  │
  ├─→ headroom :8787 20%/60-95% compression + output shaper verbosity steering effort routing 0.21ms p50
  │         GSM8K 0.870→0.870 TruthfulQA 0.53→0.56 SQuAD 97% at 19% BFCL 97% at 32%
  │
  ├─→ KiroPool Go :5000 zero-MITM (PRIMARY)
  │         api.krs.service → runtime.{region}.kiro.dev (GenerateAssistantResponse chat)
  │         api.cps.service → management.{region}.kiro.dev (profiles usage limits)
  │         api.codewhisperer.service → q.amazonaws.com (telemetry optional)
  │         Swap Authorization+profileArn+tokentype, tee meteringEvent, poll GetUsageLimits
  │         Pool keys kpp_xxx creditLimit→HTTP 402, smart quota-aware skip exhausted
  │         reasoningContentEvent passthrough, model mapping verbatim fallback auto
  │         Auth: idc/social/external_idp/api_key + import SQLite pure-Go no CGO
  │         Admin: embedded React Tailwind SSE single binary go:embed multi-region
  │
  ├─→ KiroProxy Triple :8080 (FALLBACK + per-account)
  │         OpenAI: POST /v1/chat/completions + /v1/responses (Codex) + GET /v1/models
  │         Anthropic: POST /v1/messages
  │         Gemini: POST /v1/models/{model}:generateContent
  │         Per-account proxy priority>global>direct PUT /api/accounts/{id}/proxy
  │         4-layer model: standardize→cache→alias→passthrough, 50 tools limit
  │         Payload: 615KB guard auto-trim keep last 20 + synthetic summary, truncation recovery synthetic
  │         Thinking: FSM parser vs regex fragile, tiktoken Chinese accurate
  │         Tool search: regex+BM25, prompt caching cache_control→cachePoint
  │         Circuit breaker exponential backoff probabilistic retry, session stickiness 60s
  │         CLI: accounts list/export/import/add/scan login google/github/remote
  │
  ├─→ tickernelz Bun SQLite kiro.db lowest-usage rotation gradual truncation prevents 400
  │         reasoning_content delta, effort mapping low→max budget 16384/32768/65536/98304
  │         auto_sync_kiro_cli
  │
  ├─→ jwadow BASE :8000 fallback dual API extended thinking exclusive
  │
  └─→ OWL :60000 SSRF allowlist 17 domains DNS rebinding Bearer 0.0.0.0 predictive circuit p50 ring20
            → WAN runtime.{region}.kiro.dev
```

## Installation - REQUIRED BEFORE Coding (original prompt)

### 1. Skills (find-skills 19.3K trending)

```bash
npx skills add vercel-labs/skills/find-skills # 19.3K trending top
npx skills add vercel-labs/agent-browser # 13.4K
npx skills add obra/superpowers/systematic-debugging
npx skills add LilMGenius/paperthin --global --agent '*' # 1174★ anti-slop re0 readchk modelchk macrothink

uv tool install https://github.com/Panniantong/Agent-Reach/releases/latest/download/agent-reach.zip
agent-reach setup
agent-reach install --env=auto --system --channels=twitter,reddit,opencli

# Compression 77625★
uv tool install --python 3.13 "headroom-ai[all]"
headroom deploy
headroom doctor
headroom dashboard
headroom learn --verbosity --apply # mines failed sessions → CLAUDE.local.md
```

### 2. Kiro CLI + Kiro Web (proxy integration targets)

```bash
chmod +x install-kiro-cli.sh
./install-kiro-cli.sh

# What it does:
# [1/4] Installs Kiro CLI from https://kiro.dev/install.sh or awslabs/kiro-cli or npm @aws/kiro-cli
# [2/4] Creates ~/.kiro/ ~/.config/kiro/ ~/.local/share/kiro-cli/ ~/.aws/sso/cache/
# [3/4] Builds KiroPool Go zero-MITM, creates ./set-endpoints.sh and ./setup-client.sh
# [4/4] Sets up Kiro Web https://kiro.dev/web integration via endpoint override or browser proxy

# Verify
kiro-cli --version
kiro-cli settings # shows api.krs.service endpoint
```

**Kiro Web:** https://kiro.dev/web - web-based IDE, Desktop app at https://kiro.dev/download

### 3. Docker 4-Service Stack (Go pool :5000 + Python unified :8000 + headroom :8787 + KiroProxy :8080)

```bash
# Build & run all 4
docker-compose up -d --build

# Check health
curl http://localhost:5000/health # Go pool zero-MITM
curl http://localhost:8000/health # Python unified triple
curl http://localhost:8787/health # headroom compression
curl http://localhost:8080/health # KiroProxy triple (if running)

docker-compose logs -f kiro-pool-go
docker-compose logs -f kiro-unified
```

**Services:**
| Service | Port | Description | Base |
|---------|------|-------------|------|
| kiro-pool-go | 5000 | Zero-MITM endpoint-override + kpp_ metering 402 + smart quota-aware + SSE admin | dongp06/kiro-cli-pool-proxy 10★ |
| kiro-unified | 8000 | Triple protocol OpenAI/Anthropic/Gemini + 615KB guard + FSM + BM25 + per-account proxy + headroom hook | jwadow 2330★ + KiroProxy 391★ |
| headroom | 8787 | Compression proxy 20%/60-95% + output shaper verbosity steering | headroomlabs-ai/headroom 77625★ |
| kiro-proxy-triple | 8080 | Triple protocol fallback + per-account proxy + 615KB guard + stickiness 60s | xu-yuanhao/KiroProxy 391★ |

### 4. Zero-MITM Endpoint Override (no cert)

```bash
# Set endpoints to your pool
./set-endpoints.sh http://127.0.0.1:5000 us-east-1
# Or manually:
kiro-cli settings api.krs.service '{"endpoint":"http://127.0.0.1:5000","region":"us-east-1"}'
kiro-cli settings api.cps.service '{"endpoint":"http://127.0.0.1:5000","region":"us-east-1"}'

# Zero-login client (seeds placeholder token so CLI login gate passes)
./setup-client.sh http://127.0.0.1:5000 us-east-1 kpp_demo_xxx

# Test
kiro-cli chat # now flows through pool :5000, every request counted as 0.16 credit

# Reset to defaults
./set-endpoints.sh --reset
```

### 5. Anthropic/OpenAI compat (Claude Code, Codex, etc)

```bash
# Via Go pool
export ANTHROPIC_BASE_URL=http://127.0.0.1:5000
export ANTHROPIC_API_KEY=kpp_demo_xxx
claude # Claude Code now via pool with metering

export OPENAI_BASE_URL=http://127.0.0.1:5000/v1
export OPENAI_API_KEY=kpp_demo_xxx
codex # Codex via pool

# Via Python unified (more features: 615KB guard, FSM, BM25)
export ANTHROPIC_BASE_URL=http://127.0.0.1:8000
export OPENAI_BASE_URL=http://127.0.0.1:8000/v1
export ANTHROPIC_API_KEY=kpp_demo_xxx

# Via headroom compression proxy (21-57% input savings)
export HEADROOM_OUTPUT_SHAPER=1
export ANTHROPIC_BASE_URL=http://127.0.0.1:8787
# headroom proxy forwards to :5000 or :8000 with compression
```

### 6. Kiro Web Integration (https://kiro.dev/web)

```bash
# Option 1: Desktop config (same endpoint override)
# Kiro Desktop uses same ~/.config/kiro/settings.json
./set-endpoints.sh http://YOUR_SERVER:5000 us-east-1

# Option 2: Browser proxy (Web only)
# Use Requestly or custom service worker to override:
# https://runtime.us-east-1.kiro.dev/* → http://localhost:5000/*
# https://management.us-east-1.kiro.dev/* → http://localhost:5000/*

# Option 3: Our Python unified :8000
# In Kiro Web Settings → Advanced → Custom Endpoint:
ANTHROPIC_BASE_URL=http://localhost:8000
OPENAI_BASE_URL=http://localhost:8000/v1

# See ./kiro-web/README.md for details
```

## Scorecard v8.2 (1-10)

| Repo | Stars | Rel | Clar | Conn | Prod | Compat | Total | Verdict |
|------|-------|-----|------|------|------|--------|-------|---------|
| jwadow/kiro-gateway | 2330 | 10 | 9 | 10 | 10 | 10 | 49 | **BASE RANK1** dual extended thinking exclusive |
| KiroProxy petehsu | 391 | 10 | 10 | 10 | 10 | 10 | 50 | **ADOPT RANK2** triple per-account FSM BM25 615KB |
| KiroPool Go dongp06 | 10 | 9 | 10 | 10 | 9 | 10 | 48 | **ADOPT RANK3** zero-MITM kpp metering |
| tickernelz | 174 | 10 | 10 | 10 | 10 | 10 | 50 | KEEP Bun SQLite lowest-usage |
| headroom | 77625 | 7 | 10 | 8 | 10 | 9 | 44 | ADOPT 20%/60-95% 0.21ms p50 |
| paperthin | 1174 | 6 | 10 | 7 | 9 | 8 | 40 | ADOPT re0 readchk modelchk anti-slop |
| OmniRoute | 80220 | 8 | 9 | 10 | 10 | 9 | 46 | ADAPT RTK+Caveman 375 providers |
| opencodex | 17799 | 8 | 9 | 9 | 10 | 9 | 45 | ADAPT universal ChatGPT pool |
| AIClient2API | 8901 | 8 | 9 | 9 | 9 | 9 | 44 | ADAPT TLS sidecar uTLS bypass 403 |

## 3 NEW Synergies v8.2

**S7 per-account FSM BM25 615KB:** BEFORE global proxy only no FSM no search, CHANGE per-account priority>global>direct + 4-layer model + 615KB auto-trim + truncation synthetic + FSM + tiktoken Chinese + BM25 + caching + circuit breaker + stickiness 60s, AFTER prevents 615KB rejection + truncated crash + accurate Chinese + tool scale 50 + context continuous, VERDICT PASS 114c, COMPLEXITY +0 replaces

**S8 zero-MITM kpp metering:** BEFORE MITM cert breaks on CLI update, CHANGE endpoint-override public settings api.krs.service runtime.{region}.kiro.dev api.cps.service management.{region}.kiro.dev + swap Auth + tee meteringEvent + poll GetUsageLimits + kpp_ creditLimit 402 + smart quota-aware + SQLite pure-Go + embedded React Tailwind SSE single binary, AFTER client 100% native verified 0.16≈0.1619 zero cert, VERDICT PASS, COMPLEXITY Low

**S9 headroom+paperthin:** BEFORE 10K-55K repetitive artifacts rot patching misread, CHANGE headroom proxy :8787 ContentRouter SmartCrusher JSON CodeCompressor AST Kompress-v2-base CacheAligner CCR headroom_retrieve output shaper verbosity effort routing learn→CLAUDE.local.md + paperthin re0 clean v0 readchk only real fork modelchk cheapest tier fast/standard/frontier glance→exhaustive neutral macrothink strip bait fan out 2-5 divergence first ssotize one home re0-loop build→QA→memo→work, AFTER 10144→1260 same FATAL 17199→13597 21% 55957→24340 57% 90% JSON 0.21ms p50 GSM8K 0.870→0.870 TruthfulQA 0.53→0.56 SQuAD 97% at 19% BFCL 97% at 32%, VERDICT PASS 3324+54c, COMPLEXITY Very Low

## REJECT

- **9router-kiro-automator 9★** Gmail dot trick AWS Builder ID auto fingerprint canvas/webgl/audio noise proxy AES-256-GCM 2-3min 95% - violates ToS account farming not gateway - INVESTIGATE pattern only
- **11x 404:** teocns/gchromium tanu360/kiro-reverse-api romgX/openrelay tholian-network/stealthify mandatoryprogrammer/thermoptic vagmr/kiro2api-rs TsinHzl/kiro2cc-proxy nicobailon/grill-for-unknowns disler/ten-levels-of-jev etc - no code/guide only

## Final Stack BEST PRIMARY

```
Client → headroom :8787 21-57% + output shaper → KiroPool Go :5000 zero-MITM kpp_ smart quota-aware OR KiroProxy :8080 triple per-account FSM BM25 615KB guard → tickernelz Bun SQLite lowest-usage → jwadow BASE :8000 dual extended thinking → OWL :60000 SSRF 17 domains DNS rebinding Bearer 0.0.0.0 predictive circuit p50 ring20 → WAN runtime.{region}.kiro.dev
```

## License

AGPL-3.0 (BASE jwadow/kiro-gateway) + MIT where applicable. See LICENSE.

## Push to GitHub

```bash
# 1. Unzip
unzip kiro-unified-v8.2-final-github.zip
cd kiro-unified-v8.2-final-github

# 2. Init git
git init
git add .
git commit -m "v8.2: zero-MITM kpp metering + triple protocol per-account FSM BM25 615KB guard + headroom 21-57% + paperthin re0 + kiro-cli/kiro-web integration + 4-service docker-compose"

# 3. Create repo and push (gh CLI)
gh repo create kiro-unified --public --source=. --remote=origin --push --description "Kiro Unified v8.2 - Zero-MITM + Triple Protocol + Compression + Anti-Slop - BASE jwadow 2330★ + KiroProxy 391★ + KiroPool Go kpp metering + headroom 77625★ + paperthin 1174★"

# Or manual:
# git remote add origin https://github.com/YOUR_USERNAME/kiro-unified.git
# git branch -M main
# git push -u origin main

# 4. Verify
# https://github.com/YOUR_USERNAME/kiro-unified
# docker-compose up -d --build
# curl http://localhost:5000/health && curl http://localhost:8000/health
```

## Docs

- `src/runtime/unified_v8_2_runtime.py` - Python unified triple protocol runnable
- `src/runtime/kiro_pool_go_v8_2.go` - Go zero-MITM single binary
- `src/scripts/set-endpoints.sh` - Zero-MITM endpoint override
- `src/scripts/install-v8.2.sh` - Full install 9 steps
- `src/docs/SCORECARD_v8.2.md` - Full scorecard + synergies + complexity budget
- `kiro-web/README.md` - Kiro Web integration guide
- `install-kiro-cli.sh` - Kiro CLI + Web installation + proxy integration
- `docker-compose.yml` - 4-service stack

---

Built with systematic debugging + paperthin re0/readchk/modelchk + headroom compression. Restraint is product.
