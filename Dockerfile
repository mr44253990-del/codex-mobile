FROM node:20-bookworm

WORKDIR /app

RUN apt-get update && apt-get install -y \
    git \
    curl \
    ripgrep \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

ENV PORT=10000
ENV CODEX_HOME=/codex-home

RUN mkdir -p /codex-home

RUN npm install -g @openai/codex

EXPOSE 10000

CMD ["sh", "-c", "npx --yes @brutalstrikedevs/codexapp --port ${PORT} --no-tunnel --no-open --no-login"]
