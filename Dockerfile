FROM greyia/debian:wheezy
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install nsd3 -y 

ADD . /etc/nsd3/.

RUN mkdir -p /var/run/nsd3 && chown nsd /var/run/nsd3 && \
   /usr/sbin/nsdc rebuild

EXPOSE 53
CMD ["/usr/sbin/nsd", "-d", "-c", "/etc/nsd3/nsd.conf"]

