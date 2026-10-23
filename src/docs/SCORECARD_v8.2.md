
# Scorecard v8.2
## BASE RANK1 CONFIRMED
- jwadow/kiro-gateway 2330★ 206c 13 rel 557 forks AGPL-3.0 Python FastAPI dual OpenAI/Anthropic extended thinking exclusive vision web search tool calling retry 403/429/5xx smart token refresh 4 auth JSON env AWS SSO SQLite multi-account failover ACCOUNT_SYSTEM

## NEW BEST PRIMARY
- KiroProxy 391★ 114c 28 rel 92 forks: triple protocol OpenAI/Anthropic/Gemini + per-account proxy + FSM + BM25 + 615KB guard + truncation recovery + tiktoken + prompt caching + circuit breaker + session stickiness 60s + CLI export/import/scan login remote - ADOPT rank2
- KiroPool Go 10★ 25c: zero-MITM endpoint-override api.krs.service api.cps.service api.codewhisperer.service + kpp_ credit metering 402 + smart quota-aware skip exhausted + reasoningContentEvent passthrough + model mapping verbatim fallback auto + auth idc/social/external_idp/api_key + import SQLite pure-Go no CGO + embedded admin React Tailwind SSE single binary go:embed multi-region - ADOPT rank3
- tickernelz 174★ 236c: Bun SQLite kiro.db lowest-usage rotation gradual truncation prevents 400 native thinking delta effort mapping low→max auto_sync_kiro_cli - KEEP
- headroom 77625★ 3324c: compress tool outputs logs files RAG 20% coding 60-95% JSON library proxy MCP cross-agent memory headroom learn CCR reversible 0.21ms p50 GSM8K 0.870→0.870 - ADOPT
- paperthin 1174★ 54c: re0 clean v0 not patch readchk only real fork aim propose not ask modelchk cheapest tier fast/standard/frontier + effort glance→exhaustive neutral macrothink strip bait fan out 2-5 divergence first autobahn carve unsafe detool strip nouns ssotize one home re0-loop build→QA→memo→work compounding restraint is product - ADOPT

## ADAPT
- OmniRoute 80220★ 11520c 282 rel: 375 providers 150+ free 1400+ models RTK+Caveman 15-95% quota-aware fallback 20 routing auto zero-config resilience 3 layers MCP/A2A Desktop PWA radar quota telemetry live headless LTS rail model discovery API - ADAPT compression + routing
- opencodex 17799★ 13120c: universal Codex/Claude Code/Desktop/Grok Build any LLM Bun bundled ChatGPT pool thread affinity lowest-usage desktop app signed digest-pinned Docker AGENTS_INSTALL OrcaRouter adaptive - ADAPT
- AIClient2API 8901★ 1019c: Antigravity/Codex/Grok/Kiro/OpenAI/Claude multi-protocol conversion provider pools polling failover TLS sidecar Go uTLS bypass 403 100k Docker Skill AI agents 50+ endpoints - ADAPT TLS sidecar
- cdp-proxy-interceptor: Deno 2.1.4 CDP MITM Playwright Puppeteer BaseCDPPlugin onRequest onResponse onEvent cleanup sendCDPCommand emitClientEvent blocking null stealth Runtime.enable overwrite workload fan-out - ADAPT

## REJECT
- 9router-kiro-automator 9★ 7c: Gmail dot trick binary index AWS Builder ID auto fingerprint canvas/webgl/audio noise proxy AES-256-GCM 2-3min 95% - violates ToS account farming not gateway
- 11x 404: teocns/gchromium tanu360/kiro-reverse-api romgX/openrelay tholian-network/stealthify mandatoryprogrammer/thermoptic vagmr/kiro2api-rs TsinHzl/kiro2cc-proxy nicobailon/grill-for-unknowns disler/ten-levels-of-jev etc - no code/guide only

## Synergies
- S7 KiroProxy per-account proxy FSM BM25 615KB guard: BEFORE global proxy only no FSM no search, CHANGE per-account priority > global > direct PUT /api/accounts/{id}/proxy + 4-layer model + 615KB auto-trim + truncation synthetic + FSM parser + tiktoken Chinese + regex BM25 + caching + circuit breaker + stickiness 60s, AFTER prevents 615KB rejection + truncated crash + accurate Chinese + tool scale 50 + context continuous, VERDICT PASS 114c, COMPLEXITY +0 replaces
- S8 KiroPool zero-MITM kpp metering: BEFORE MITM cert breaks on CLI update, CHANGE endpoint-override public settings api.krs.service runtime.{region}.kiro.dev api.cps.service management.{region}.kiro.dev + swap Authorization profileArn tokentype + tee meteringEvent + poll GetUsageLimits + kpp_ creditLimit 402 + smart quota-aware + import SQLite pure-Go + embedded React Tailwind SSE single binary go:embed, AFTER client 100% native prompts/tools/thinking handled by client proxy only rotates counts verified 0.16≈0.1619 zero cert maintenance, VERDICT PASS Go binary + admin proves, COMPLEXITY Low 3 overrides
- S9 headroom+paperthin compression anti-slop: BEFORE 10K-55K repetitive artifacts rot patching misread coherent late sizing guesswork, CHANGE headroom proxy :8787 wrap claude|codex... compress messages ContentRouter SmartCrusher JSON CodeCompressor AST Kompress-v2-base text CacheAligner volatile CCR local headroom_retrieve output shaper verbosity steering effort routing + learn mines failed → CLAUDE.local.md + paperthin re0 clean v0 not patch readchk only real fork modelchk cheapest tier fast/standard/frontier glance→exhaustive neutral macrothink strip bait fan out 2-5 divergence first ssotize one home re0-loop build→QA→memo→work, AFTER 10144→1260 same FATAL 17199→13597 21% 55957→24340 57% 58801→33895 42% 46067→32429 30% 90% JSON repetitive low prose 0.21ms p50 10K 1.4ms 100K GSM8K 0.870→0.870 TruthfulQA 0.53→0.56 SQuAD 97% at 19% BFCL 97% at 32% artifacts never bloat misreads caught sizing bounded, VERDICT PASS 3324+54c proof, COMPLEXITY Very Low uv tool install + npx skills add

## Final Stack BEST
Client → headroom :8787 20%/60-95% + output shaper → KiroPool Go :5000 zero-MITM kpp_ smart quota-aware OR KiroProxy :8080 triple per-account FSM BM25 615KB guard stickiness 60s → tickernelz Bun SQLite kiro.db lowest-usage effort low→max → jwadow BASE :8000 fallback dual extended thinking → OWL :60000 SSRF 17 domains DNS rebinding Bearer 0.0.0.0 predictive circuit p50 ring20 → WAN runtime.{region}.kiro.dev

## Complexity Budget v8.2
KiroProxy per-account+FSM+BM25+615KB Low HIGH ADOPT replaces
KiroPool zero-MITM+kpp metering Low HIGH ADOPT replaces MITM
headroom compression Very Low HIGH ADOPT
paperthin anti-slop Very Low HIGH ADOPT
tickernelz Bun Medium HIGH KEEP
OmniRoute sidecar Medium HIGH optional
Net SIMPLER than v8.1+24 because REPLACES MITM cert + fragmented auth + regex fragile + no guard with 2 binaries + 2 low-cost tools
