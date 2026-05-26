# Gunakan base image nginx
FROM nginx:alpine

# Copy isi folder web ke direktori default Nginx
COPY ./public /usr/share/nginx/html

# Expose port 80 di dalam container
EXPOSE 80
