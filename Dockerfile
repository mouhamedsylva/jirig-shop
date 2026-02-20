FROM nginx:1.27-alpine

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY . /usr/share/nginx/html

RUN rm /usr/share/nginx/html/Dockerfile \
    /usr/share/nginx/html/nginx.conf \
    /usr/share/nginx/html/docker-compose.yml 2>/dev/null || true

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
