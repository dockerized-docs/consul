# dockerized-docs-consul

# What is it? #
Dockerzied Consul documentation for offline use.

# Image description #
- Base image: `centos/httpd-24-centos7`
- The https://www.consul.io site is mirrored using httrack

# How to use this image #

```console
$ docker run -d genadipost/dockerized-docs-consul
```

You can test it by visiting http://container-ip:8080
