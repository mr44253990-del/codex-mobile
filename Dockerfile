FROM node:20-bookworm

WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl \
    git \
    ripgrep \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g codexapp

ENV PORT=10000
ENV HOST=0.0.0.0

EXPOSE 10000

CMD ["sh", "-c", "codexapp --no-tunnel --port ${PORT} --host 0.0.0.0"]
