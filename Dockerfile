# Use Nginx as the base image
FROM nginx:alpine

# Copy your HTML and CSS files into the Nginx default directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80
