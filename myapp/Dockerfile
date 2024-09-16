FROM nginx:1.23.3

ARG VERSION=0.0.3

# Configuration 
ADD conf /etc/nginx
# Content
ADD content /usr/share/nginx/html

RUN sed -i 's/{{VERSION}}/'"$VERSION"'/g' /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
