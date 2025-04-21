FROM node:18-alpine AS build-stage

WORKDIR /app
COPY frontend/package*.json ./
RUN npm install

COPY frontend .
RUN npm run build

# nginx image for serving static files
FROM nginx:alpine AS production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Optional: Custom nginx config for SPA routing
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
