
# Kiro Unified v8.2 - Full Runtime
## BASE RANK1 CONFIRMED: jwadow/kiro-gateway 2330★ 206c dual API extended thinking exclusive
## RANK2 ADOPT: KiroProxy 391★ triple protocol per-account proxy FSM BM25 615KB guard
## RANK3 ADOPT: KiroPool Go zero-MITM kpp metering 402
## NEW: headroom 77625★ compression 21-57% 60-95% 0.21ms p50 + paperthin 1174★ anti-slop re0/readchk/modelchk

### Why v8.2 is SIMPLER than v8.1+24
REPLACES: MITM cert install + fragmented auth + regex fragile thinking parser + no payload guard
WITH: 2 binaries (Go single static embedded admin React Tailwind SSE + Bun plugin SQLite) + 2 low-cost tools (headroom uv tool install + paperthin npx skills add)

### Stack BEST PRIMARY v8.2
```
Client (Claude Code/Codex/opencode/kiro-cli) 
→ headroom :8787 (20%/60-95% compression + output shaper verbosity steering effort routing)
→ KiroPool Go :5000 zero-MITM endpoint-override kpp_xxx credit metering 402 smart quota-aware skip exhausted reasoningContentEvent passthrough model mapping verbatim fallback auto
  OR KiroProxy :8080 triple protocol OpenAI/Anthropic/Gemini per-account proxy priority>global>direct FSM BM25 tiktoken Chinese payload 615KB guard auto-trim truncation recovery synthetic session stickiness 60s prompt caching cache_control→cachePoint circuit breaker exponential probabilistic
→ tickernelz Bun SQLite kiro.db lowest-usage rotation gradual truncation prevents 400 native thinking delta effort mapping low→max auto_sync_kiro_cli
→ jwadow BASE :8000 fallback dual API extended thinking exclusive vision web search tool calling retry 403/429/5xx smart token refresh 4 auth JSON env AWS SSO SQLite multi-account failover
→ OWL :60000 SSRF allowlist 17 domains DNS rebinding Bearer 0.0.0.0 predictive circuit p50 ring20
→ WAN runtime.{region}.kiro.dev
```

### Install REQUIRED BEFORE coding (original prompt)
```bash
npx skills add vercel-labs/skills/find-skills # 19.3K trending
npx skills add vercel-labs/agent-browser # 13.4K
npx skills add obra/superpowers/systematic-debugging
npx skills add LilMGenius/paperthin --global --agent '*' # 1174★ anti-slop re0 readchk modelchk macrothink fan out 2-5 divergence first
uv tool install https://github.com/Panniantong/Agent-Reach/releases/latest/download/agent-reach.zip
agent-reach setup && agent-reach install --env=auto --system --channels=twitter,reddit,opencli
uv tool install --python 3.13 "headroom-ai[all]" # 77625★ compression
headroom deploy
headroom doctor && headroom dashboard
headroom learn --verbosity --apply
export HEADROOM_OUTPUT_SHAPER=1 && headroom proxy --port 8787 &
```

### Run v8.2 Runtime (Python unified)
```bash
cd runtime && pip install fastapi uvicorn httpx
python unified_v8_2_runtime.py # :8000
curl http://localhost:8000/health
curl http://localhost:8000/v1/models
curl -X POST http://localhost:8000/v1/chat/completions -H "Authorization: Bearer kpp_demo_xxx" -d '{"model":"auto","messages":[{"role":"user","content":"hello"}]}'
```

### Run KiroPool Go zero-MITM
```bash
cd runtime && go build -o kiro-pool-go kiro_pool_go_v8_2.go
./kiro-pool-go # :5000 Admin http://IP:5000/admin SSE /admin/api/events
../scripts/set-endpoints.sh http://127.0.0.1:5000 us-east-1
kiro-cli chat # every request now flows through pool
# Reset: ../scripts/set-endpoints.sh --reset
```

### REJECT
- 9router-kiro-automator 9★ 7c Gmail dot trick AWS Builder ID auto fingerprint canvas/webgl/audio noise proxy AES-256-GCM 2-3min 95% violates ToS account farming not gateway - INVESTIGATE pattern only
- 11x 404: teocns/gchromium tanu360/kiro-reverse-api romgX/openrelay tholian-network/stealthify mandatoryprogrammer/thermoptic vagmr/kiro2api-rs TsinHzl/kiro2cc-proxy nicobailon/grill-for-unknowns disler/ten-levels-of-jev etc - no code/guide only

### ADOPT/ADAPT
- ADOPT KiroProxy 391★: per-account proxy PUT /api/accounts/{id}/proxy, 4-layer model standardize→cache→alias→passthrough, 615KB guard auto-trim, truncation recovery synthetic, FSM thinking, tiktoken Chinese accurate, BM25 regex tool search, prompt caching, circuit breaker exponential probabilistic, session stickiness 60s, CLI accounts list/export/import/add/scan login google/github/remote
- ADOPT KiroPool Go 10★: zero-MITM endpoint-override api.krs.service runtime.{region}.kiro.dev api.cps.service management.{region}.kiro.dev, swap Authorization profileArn tokentype, tee response stream meteringEvent, poll GetUsageLimits, pool keys kpp_ creditLimit 402, smart quota-aware skip exhausted, import SQLite pure-Go no CGO, embedded admin React Tailwind SSE single binary go:embed multi-region us-east-1 eu-central-1 us-gov
- ADOPT headroom 77625★: compress messages ContentRouter SmartCrusher JSON CodeCompressor AST Kompress-v2-base text CacheAligner volatile CCR local headroom_retrieve output shaper verbosity steering effort routing learned level HEADROOM_VERBOSITY_LEVEL, proof 17199→13597 21% 55957→24340 57% 58801→33895 42% 46067→32429 30% 90% JSON 0.21ms p50 10K 1.4ms 100K GSM8K 0.870→0.870 TruthfulQA 0.53→0.56 SQuAD 97% at 19% BFCL 97% at 32%
- ADOPT paperthin 1174★: re0 clean v0 not patch, readchk only real fork, aim propose not ask, modelchk cheapest tier fast/standard/frontier glance→exhaustive neutral, hate one objection cheapest test, macrothink strip bait fan out 2-5 divergence first, autobahn carve unsafe, detool strip nouns, dedash judged, debloat load-bearing, shower zero-context, ssotize one home, re0-loop build→QA→memo→work compounding, restraint is product

See docs/SCORECARD_v8.2.md for full scorecard 1-10 + synergies BEFORE→CHANGE→AFTER→VERDICT→COMPLEXITY
