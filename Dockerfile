# Stage 1: Build the app
FROM node:18 AS build

# Set working directory
WORKDIR /app

# Copy package files first (better for caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Run build (assumes you have a build script in package.json)
RUN npm run build


# Start the app (optional in build stage, usually done in the final stage)
CMD ["npm", "start"]

