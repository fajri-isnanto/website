# Use the official Nginx base image
FROM nginx:latest

# Set the working directory to /usr/share/nginx/html
WORKDIR /usr/share/nginx/html

# Copy all files from the current directory to the working directory
COPY . .

# Expose port 8020
EXPOSE 8020

# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]
