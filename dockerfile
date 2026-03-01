FROM mcr.microsoft.com/playwright:v1.51.0-jammy

WORKDIR /app

# Dependências para módulos nativos como better-sqlite3 (se você adicionar depois)
RUN apt-get update && apt-get install -y python3 make g++ \
  && rm -rf /var/lib/apt/lists/*

COPY package.json package-lock.json* ./
RUN npm ci --omit=dev

COPY . .

ENV NODE_ENV=production

CMD ["npm", "start"]
