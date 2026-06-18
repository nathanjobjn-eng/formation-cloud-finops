FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY ./index.html /usr/share/nginx/html/
COPY ./style.css /usr/share/nginx/html/
COPY ./image_site/ /usr/share/nginx/html/image_site/
EXPOSE 80