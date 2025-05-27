# Use the official Deno image
FROM denoland/deno:latest

# Set the working directory
WORKDIR /app

# Copy the application files
COPY . .

# Cache dependencies
RUN deno cache main.ts src/index.ts

# Define the command to run the app
ENTRYPOINT ["/bin/sh", "-c", "if [ -z \"$(ls -A /app/data)\" ]; then deno run -A /app/src/data.ts; fi && deno run -A /app/main.ts -A /app/src/index.ts"]

# Expose the data directory
VOLUME ["/app/data"]