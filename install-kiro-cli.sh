#!/usr/bin/env bash
set -euo pipefail
# Kiro CLI + Kiro Web installation - required for proxy integration
# Sources: https://kiro.dev + https://github.com/awslabs/kiro-cli + kiro.dev/web

echo "=== Kiro CLI Installation (Proxy Integration Target) ==="
echo "Platform: $(uname -a)"

# Detect OS
OS="$(uname -s)"
ARCH="$(uname -m)"

install_kiro_cli() {
  echo "[1/4] Installing Kiro CLI..."
  if command -v kiro-cli &>/dev/null; then
    echo "kiro-cli already installed: $(kiro-cli --version || kiro-cli version)"
  else
    echo "Installing via official installer..."
    # Official install from kiro.dev
    curl -fsSL https://kiro.dev/install.sh | bash ||     curl -fsSL https://raw.githubusercontent.com/awslabs/kiro-cli/main/install.sh | bash ||     npm install -g @aws/kiro-cli ||     cargo install kiro-cli ||     echo "Manual: visit https://kiro.dev/docs/getting-started/installation"
    
    # Add to PATH
    export PATH="$HOME/.kiro/bin:$PATH"
    export PATH="$HOME/.local/bin:$PATH"
  fi
}

install_kiro_web() {
  echo "[2/4] Installing Kiro Web (kiro.dev/web) + Desktop hooks..."
  # Kiro Web is web-based IDE at kiro.dev/web, Desktop app
  # The proxy integrates via endpoint override, no separate install needed
  # But we set up config directories
  
  mkdir -p ~/.kiro ~/.config/kiro ~/.local/share/kiro-cli
  
  echo "Kiro Web: https://kiro.dev/web"
  echo "Kiro Desktop: https://kiro.dev/download"
  echo "Config dirs created:"
  echo "  ~/.kiro/ (auth tokens)"
  echo "  ~/.config/kiro/ (settings)"
  echo "  ~/.local/share/kiro-cli/ (data.sqlite3 for Go importer)"
  echo "  ~/.aws/sso/cache/ (kiro-auth-token.json for Python fallback)"
}

setup_proxy_integration() {
  echo "[3/4] Setting up proxy integration (zero-MITM)..."
  
  # Build Go pool if not built
  if [ -f "./src/runtime/kiro_pool_go_v8_2.go" ]; then
    echo "Building KiroPool Go zero-MITM..."
    cd src/runtime && go build -o ../../kiro-pool-go kiro_pool_go_v8_2.go 2>/dev/null || echo "Go build skipped (no Go), will use Docker" && cd ../..
  fi
  
  # Create set-endpoints.sh wrapper
  cat > ./set-endpoints.sh <<'EOS'
#!/usr/bin/env bash
SERVER=${1:-http://127.0.0.1:5000}
REGION=${2:-us-east-1}
if [[ "$1" == "--reset" ]]; then
  echo "Resetting to defaults..."
  kiro-cli settings api.krs.service "{"endpoint":"https://runtime.${REGION}.kiro.dev","region":"${REGION}"}" 2>/dev/null || echo "kiro-cli not installed yet"
  kiro-cli settings api.cps.service "{"endpoint":"https://management.${REGION}.kiro.dev","region":"${REGION}"}" 2>/dev/null || true
  echo "Reset done"
  exit 0
fi
echo "Setting KiroPool endpoints to $SERVER region $REGION"
kiro-cli settings api.krs.service "{"endpoint":"${SERVER}","region":"${REGION}"}" 2>/dev/null || echo "Manual: kiro-cli settings api.krs.service '{"endpoint":"${SERVER}","region":"${REGION}"}'"
kiro-cli settings api.cps.service "{"endpoint":"${SERVER}","region":"${REGION}"}" 2>/dev/null || echo "Manual: kiro-cli settings api.cps.service '{"endpoint":"${SERVER}","region":"${REGION}"}'"
echo "Done. Zero-MITM active. Client 100% native."
EOS
  chmod +x ./set-endpoints.sh
  
  # Zero-login client setup
  cat > ./setup-client.sh <<'EOS'
#!/usr/bin/env bash
SERVER_URL=${1:-http://127.0.0.1:5000}
REGION=${2:-us-east-1}
KEY=${3:-kpp_demo_xxx}
echo "Seeding placeholder token for zero-login..."
mkdir -p ~/.kiro ~/.local/share/kiro-cli
echo "{"accessToken":"placeholder_for_pool","region":"${REGION}"}" > ~/.kiro/pool-placeholder.json
echo "Client will use SERVER $SERVER_URL REGION $REGION KEY $KEY"
echo "Set: export ANTHROPIC_BASE_URL=$SERVER_URL && export ANTHROPIC_API_KEY=$KEY"
echo "Then: kiro-cli chat"
EOS
  chmod +x ./setup-client.sh
  
  echo "Proxy integration scripts ready: ./set-endpoints.sh ./setup-client.sh"
}

setup_kiro_web_proxy() {
  echo "[4/4] Kiro Web integration..."
  echo "Kiro Web (https://kiro.dev/web) uses same endpoint override mechanism:"
  echo "1. Open Kiro Web → Settings → Advanced → Custom Endpoint"
  echo "2. Or use browser extension that overrides fetch to runtime.{region}.kiro.dev → your pool :5000"
  echo "3. For Kiro Desktop: same set-endpoints.sh works, config in ~/.config/kiro/settings.json"
  echo ""
  echo "Creating Kiro Web proxy config..."
  mkdir -p ./kiro-web
  cat > ./kiro-web/README.md <<'WEBMD'
# Kiro Web Integration

Kiro Web at https://kiro.dev/web can be proxied via:

## Option 1: Endpoint override (Desktop + Web via config)
Same as CLI:
```bash
./set-endpoints.sh http://YOUR_SERVER:5000 us-east-1
```

## Option 2: Browser proxy (Web only)
Use extension like Requestly or custom service worker:
- Override https://runtime.us-east-1.kiro.dev/* → http://localhost:5000/*
- Override https://management.us-east-1.kiro.dev/* → http://localhost:5000/*

## Option 3: Our unified Python proxy :8000
The Python unified runtime at :8000 already implements:
- POST /v1/chat/completions (OpenAI compat)
- POST /v1/messages (Anthropic compat)
- POST /v1/models/{model}:generateContent (Gemini)
- Payload guard 615KB + truncation recovery
- Per-account proxy + session stickiness 60s

Set in Kiro Web env:
```
ANTHROPIC_BASE_URL=http://localhost:8000
OPENAI_BASE_URL=http://localhost:8000/v1
```

## Option 4: Docker 4-service stack
```
docker-compose up -d
```
- :5000 Go pool zero-MITM
- :8000 Python unified triple protocol
- :8787 headroom compression
- :8080 KiroProxy triple

All routes kpp_xxx metering 402 when credit exceeded.
WEBMD
  echo "Kiro Web docs at ./kiro-web/README.md"
}

main() {
  install_kiro_cli
  install_kiro_web
  setup_proxy_integration
  setup_kiro_web_proxy
  echo ""
  echo "=== Done ==="
  echo "Next:"
  echo "1. docker-compose up -d # 4 services"
  echo "2. ./set-endpoints.sh http://127.0.0.1:5000 us-east-1"
  echo "3. kiro-cli chat # now via pool"
  echo "4. export ANTHROPIC_BASE_URL=http://127.0.0.1:5000 ANTHROPIC_API_KEY=kpp_demo_xxx && claude"
  echo "5. Open https://kiro.dev/web with same endpoint override"
}

main "$@"
