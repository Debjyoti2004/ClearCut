# stage 1: 
FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm run build

# stage 2: 
FROM nginx:stable-alpine

RUN apk update && apk upgrade libxml2

RUN rm -rf /usr/share/nginx/html/*

COPY default.conf /etc/nginx/conf.d/default.conf

COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
