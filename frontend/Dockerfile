# Build stage
FROM node:alpine AS build
WORKDIR /app
COPY . .
RUN npm ci
RUN npm run build

#Serve stage
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
