
.PHONY: install kiro-cli docker up down health push

install:
	npx skills add vercel-labs/skills/find-skills
	npx skills add LilMGenius/paperthin --global --agent '*'
	uv tool install --python 3.13 "headroom-ai[all]" || pip install headroom-ai

kiro-cli:
	chmod +x install-kiro-cli.sh && ./install-kiro-cli.sh

docker:
	docker-compose up -d --build

up:
	docker-compose up -d

down:
	docker-compose down

health:
	curl -s http://localhost:5000/health
	curl -s http://localhost:8000/health

push:
	git add . && git commit -m "v8.2: zero-MITM + triple + compression + kiro-cli/web" || true
	gh repo create kiro-unified --public --source=. --remote=origin --push
