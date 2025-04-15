# Stage 1: Build the app
FROM node:18 AS build
WORKDIR /app
COPY . .
RUN npm install && npm run build && npm run start

# Stage 2: Serve the build with NGINX
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
