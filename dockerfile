# Use the official nginx image
FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/* 
# Copy your website files into nginx html directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 90

