FROM greyia/debian:wheezy
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install ruby gem -y && \
    gem install rake serverspec --no-rdoc --no-ri 
RUN apt-get install net-tools -y 
# NSD3

RUN apt-get install nsd3 -y 

