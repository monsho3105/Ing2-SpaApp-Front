# ---- Etapa 1: compilar Angular 21 ----
FROM node:22-alpine AS build
WORKDIR /app

# Cachear dependencias
COPY package*.json ./
RUN npm ci || npm install

# Compilar la aplicación
COPY . .
RUN npm run build

# ---- Etapa 2: servir con Nginx ----
FROM nginx:alpine

# Configuración de Nginx (SPA + proxy /api -> backend:8080)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Angular 21 genera dist/<nombre-proyecto>/browser
COPY --from=build /app/dist/*/browser /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
