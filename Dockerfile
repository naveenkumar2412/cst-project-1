# Step 1: Build React frontend
FROM node:18 AS build
WORKDIR /app
COPY package.json package-lock.json ./
COPY . ./
RUN npm install
RUN npm run build

# Step 2: Run backend (Express)
FROM node:18
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . ./
COPY --from=build /app/build ./build

EXPOSE 80
CMD ["npm", "start"]
