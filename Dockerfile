FROM ubuntu:trusty
MAINTAINER Nicolas Pouillard [https://nicolaspouillard.fr]

RUN apt-get update && \
    apt-get install -y software-properties-common python-software-properties && \
    sudo add-apt-repository ppa:k-dg/litecoin && \
    apt-get update && \
    apt-get install -y litecoind && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV HOME /litecoin
RUN useradd -s /bin/bash -m -d /litecoin litecoin
RUN chown litecoin:litecoin -R /litecoin

USER litecoin

VOLUME ["/litecoin"]

WORKDIR /litecoin

EXPOSE 9332

CMD ["/usr/bin/litecoind", "-datadir=/litecoin", "--printtoconsole"]
