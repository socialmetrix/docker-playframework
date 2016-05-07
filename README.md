# PlayFramework! Docker Images

We build this repository to maintain **[PlayFramework 1.x](https://www.playframework.com/download#older-versions)** docker images for the latest MINOR and PATCH version of each release 1.x

##Supported tags and respective Dockerfile links

* [1.2.5.6-alpine](1.2.5.6-alpine/Dockerfile)
* [1.2.6.2-alpine](1.2.6.2-alpine/Dockerfile)
* [1.2.7.2-alpine](1.2.7.2-alpine/Dockerfile)
* [1.3.4-alpine](1.3.4-alpine/Dockerfile)
* [1.4.2-alpine](1.4.2-alpine/Dockerfile)

##Usage

###You can use this image as develop environment:

```bash
docker run -it --rm -v $(pwd)/src:/app play:1.2.5.6-alpine play new test

docker run -p 9000:9000 -d -v $(pwd)/src:/app play:1.2.5.6-alpine play run test
```

###Or as base to pack your application:
Below a example of `Dockerfile` using version 1.2.5.6, setting `id` to `prod` and installing `sass` module.

```
FROM play:1.2.5.6-alpine
MAINTAINER https://socialmetrix.com

COPY src/ /app/

RUN echo y | play install sass-1.1 && \
  echo prod | play id

CMD ["play", "run"]
```