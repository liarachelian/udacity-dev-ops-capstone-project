#This will allow you to create a Duckhune game in a Dockerfile
FROM brettt89/silverstripe-web:7.3-debian-stretch
#use a suitable working images
WORKDIR /app
#make a app directory from where to work form

RUN git clone https://github.com/MattSurabian/DuckHunt-JS.git
# Clone the git hiub repo for the files

RUN cp -r DuckHunt-JS/dist/* /var/www/html
break the docker file.

EXPOSE 80
EXPOSE 443
#expose the port in the docker file

