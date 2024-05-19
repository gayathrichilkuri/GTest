FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    apache2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
COPY index.html /var/www/html
CMD ["apachectl", "-D", "FOREGROUND"]

#create a container
docker run -itd --name gayathri -p 80:80 gayathriweb:1.0.0

#create an image
docker build -t gayathriweb:1.0.0 . 
#index.html
<html>
 <h1>THIS IS MY DOCKER WEB SERVER</h1>
</hmtl>