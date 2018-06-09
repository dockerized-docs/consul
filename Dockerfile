FROM centos/httpd-24-centos7

ENV SUMMARY="Consul Documentation" \
    DESCRIPTION="Consul Documentation as it seen in https://www.consul.io \
The image is based on centos/httpd-24-centos7 to run unprivileged httpd container."

LABEL summary="$SUMMARY" \
      description="$DESCRIPTION" \
      io.k8s.description="$DESCRIPTION" \
      io.k8s.display-name="Consul Documentation" \
      io.openshift.expose-services="8080:http,8443:https" \
      io.openshift.tags="documentation,docs,consul" \
      name="dockerized-docs/consul" \
      maintainer="Genadi Postrilko <genadipost@gmail.com>"

user root

# Install httrack to get docs
RUN yum -y install httrack

USER default

RUN mkdir -p /opt/app-root/src/consul-website \
    && cd /opt/app-root/src/consul-website \
    && httrack https://www.consul.io

RUN cp -R /opt/app-root/src/consul-website/www.consul.io/* /var/www/html/ \
    && rm -rf /opt/app-root/src/consul-website

CMD ["/usr/bin/run-httpd"]
