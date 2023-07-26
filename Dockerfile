FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Install the awscli
RUN apk add --no-cache groff less && \
    apk add --no-cache --virtual .build-deps \
    python3 \
    py3-pip \
    && pip3 install --no-cache-dir awscli \
    && apk del .build-deps

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install the application dependencies
RUN npm install --silent

# Copy the application code to the container
COPY . .

# Set the required environment variables for awscli
ENV AWS_ACCESS_KEY_ID=<your-access-key-id>
ENV AWS_SECRET_ACCESS_KEY=<your-secret-access-key>
ENV AWS_DEFAULT_REGION=<your-default-region>

# Build the React application
RUN npm run build

# Expose the desired port
EXPOSE 3000

# Run the application
CMD [ "npm", "start" ]
