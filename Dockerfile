# Step 1: Build React frontend
FROM node:18 AS build
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
RUN npm install
COPY . ./
RUN npm run build

# Step 2: Run backend server (e.g., Express)
FROM node:18
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
RUN npm install
COPY --from=build /app/build ./client/build
COPY . .

EXPOSE 80
CMD ["npm", "start"]
