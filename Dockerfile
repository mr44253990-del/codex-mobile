FROM node:20-bookworm

WORKDIR /app

RUN apt-get update && apt-get install -y \
    git \
    curl \
    ripgrep \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g @openai/codex

ENV CODEX_HOME=/codex-home
ENV PORT=10000

RUN mkdir -p /codex-home

RUN git clone https://github.com/friuns2/codex-mobile.git /app/codex-mobile

WORKDIR /app/codex-mobile

RUN npm install
RUN npm run build

EXPOSE 10000

CMD ["sh", "-c", "npx codex-web-local --port ${PORT} --no-password --no-login"]
