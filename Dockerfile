FROM nginx
RUN apt-get update && \
    apt-get install -y certbot python3-certbot-nginx && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 80
EXPOSE 443
