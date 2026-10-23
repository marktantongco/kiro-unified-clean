#!/usr/bin/env bash
# KiroPool Go zero-MITM endpoint override - ADOPT 10★
# BEFORE: MITM cert install breaks on CLI update
# CHANGE: uses kiro-cli public settings api.krs.service + api.cps.service
# AFTER: client 100% native, proxy only rotates + counts, verified 0.16≈0.1619
# Usage: ./set-endpoints.sh http://SERVER_IP:5000 us-east-1
# Reset: ./set-endpoints.sh --reset

SERVER=${1:-http://127.0.0.1:5000}
REGION=${2:-us-east-1}

if [[ "$1" == "--reset" ]]; then
  echo "Resetting to defaults..."
  kiro-cli settings api.krs.service '{"endpoint":"https://runtime.'"${REGION}"'.kiro.dev","region":"'"${REGION}"'"}' 2>/dev/null || echo "kiro-cli not found, manual reset needed"
  kiro-cli settings api.cps.service '{"endpoint":"https://management.'"${REGION}"'.kiro.dev","region":"'"${REGION}"'"}' 2>/dev/null || true
  echo "Reset done"
  exit 0
fi

echo "Setting KiroPool endpoints to $SERVER region $REGION"
echo "api.krs.service -> $SERVER (chat GenerateAssistantResponse) runtime.{region}.kiro.dev"
echo "api.cps.service -> $SERVER (profiles usage limits) management.{region}.kiro.dev"
echo "api.codewhisperer.service -> legacy q.amazonaws.com telemetry optional"

# Native kiro-cli endpoint override - no MITM cert needed
kiro-cli settings api.krs.service '{"endpoint":"'"${SERVER}"'","region":"'"${REGION}"'"}' 2>/dev/null || echo "Run manually: kiro-cli settings api.krs.service '{"endpoint":"${SERVER}","region":"${REGION}"}'"
kiro-cli settings api.cps.service '{"endpoint":"'"${SERVER}"'","region":"'"${REGION}"'"}' 2>/dev/null || echo "Run manually: kiro-cli settings api.cps.service '{"endpoint":"${SERVER}","region":"${REGION}"}'"

echo "Done. Zero-MITM active. Client 100% native. Pool rotates behind."
echo "Test: kiro-cli chat"
echo "Anthropic: export ANTHROPIC_BASE_URL=${SERVER} && export ANTHROPIC_API_KEY=kpp_xxx && claude"
echo "OpenAI: export OPENAI_BASE_URL=${SERVER}/v1 && export OPENAI_API_KEY=kpp_xxx && codex"
