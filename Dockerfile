# Step 1: Build React frontend
FROM node:18 AS build
WORKDIR /app
COPY package.json package-lock.json ./
COPY client ./client
RUN cd client && npm install && npm run build

# Step 2: Run backend server (Express)
FROM node:18
WORKDIR /app

# Copy only backend package files and install
COPY package.json package-lock.json ./
RUN npm install

# Copy backend source code (e.g., server.js, routes/)
COPY . .

# Copy frontend build from previous stage into public directory
COPY --from=build /app/client/build ./client/build

EXPOSE 3000
CMD ["npm", "start"]
