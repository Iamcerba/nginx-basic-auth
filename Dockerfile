FROM nginx:1.23.4-bullseye

RUN apt-get -y update \
    && apt-get install --no-install-recommends -y apache2-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV FORWARD_URL=http://host.docker.internal:80

WORKDIR /opt

COPY auth.conf auth.htpasswd run.sh ./

RUN chmod -R a+rwx,g-w,o-w,ug-s,-t ./run.sh

CMD ["./run.sh"]
