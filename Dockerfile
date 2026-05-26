# Gunakan base image nginx
FROM nginx:alpine

# Copy semua file statis ke direktori default Nginx
COPY . /usr/share/nginx/html

# Expose port 80 di dalam container
EXPOSE 80
