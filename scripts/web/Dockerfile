FROM nginx:alpine

RUN apk add --no-cache openssl

RUN mkdir -p /etc/nginx/certs

RUN openssl req -x509 -nodes -newkey rsa:2048 \
    -keyout /etc/nginx/certs/lab.key \
    -out /etc/nginx/certs/lab.crt \
    -days 3650 \
    -subj "/CN=10.24.96.130"

COPY default.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/index.html
COPY download/demo.exe /usr/share/nginx/html/download/demo.exe

EXPOSE 443
