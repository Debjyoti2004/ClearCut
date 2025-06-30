# Stage 1: Build stage
FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN rm -rf node_modules package-lock.json \
  && npm install cross-spawn@7.0.5 --save \
  && npm install

COPY . .

# Stage 2: Production stage
FROM node:18-alpine

WORKDIR /app

COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/. ./

EXPOSE 4000

CMD ["npm", "start"]
