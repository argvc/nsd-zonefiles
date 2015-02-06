FROM greyia/debian:wheezy
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install openssh-server -y
RUN mkdir -p /root/.ssh/
ADD authorized_keys /root/.ssh/authorized_keys
RUN chmod 700 /root/.ssh/ && \
    sed -i -e '/^UsePAM\s\+yes/d' /etc/ssh/sshd_config 

EXPOSE 22
# NSD3

RUN apt-get install nsd3 -y 

ADD . /etc/nsd3/.

RUN chmod 0777 /etc/nsd3/run.sh && \
    mkdir -p /var/run/nsd3 && chown nsd /var/run/nsd3 && \
    /usr/sbin/nsdc rebuild

EXPOSE 53
# ENTRYPOINT ["/usr/sbin/nsd", "-d", "-c", "/etc/nsd3/nsd.conf"]
ENTRYPOINT ["/etc/nsd3/run.sh"]
CMD ["nsd"]

