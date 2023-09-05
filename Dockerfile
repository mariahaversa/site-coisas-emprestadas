FROM ubuntu:latest
RUN apt-get update 
RUN apt-get install -y nginx
RUN mkdir /app
WORKDIR /app
COPY . . /app/
RUN echo "server {listen 8080; root /app; index home.html; location / {try_files \$uri \$uri/ /home.html;}}" > /etc/nginx/sites-available/default
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
