FROM debian:latest

ENV APT_PACKAGES etcd-server etcd-client
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
    && apt-get upgrade --yes \
    && apt-get install --yes --no-install-recommends ${APT_PACKAGES} \
    && apt-get autoremove --yes \
    && apt-get clean

USER etcd
COPY ./files/etcd.yml /etc/etcd.yml

CMD ["/usr/bin/etcd", "--config-file=/etc/etcd.yml"]
