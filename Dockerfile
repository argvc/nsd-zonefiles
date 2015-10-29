FROM greyia/nsd:wheezy
ENV DEBIAN_FRONTEND noninteractive

ADD . /etc/nsd3/.

RUN chmod 0777 /etc/nsd3/run.sh && \
    mkdir -p /var/run/nsd3 && chown nsd /var/run/nsd3 && \
    /usr/sbin/nsdc rebuild

EXPOSE 53
WORKDIR /etc/nsd3/
# ENTRYPOINT ["/usr/sbin/nsd", "-d", "-c", "/etc/nsd3/nsd.conf"]
ENTRYPOINT ["/etc/nsd3/run.sh"]
CMD ["nsd"]

