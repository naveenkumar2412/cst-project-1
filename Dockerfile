# Stage 1: Build the app
FROM node:18 AS build
WORKDIR /app
COPY . .
RUN npm install && npm run build && npm run start


