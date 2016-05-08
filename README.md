# PlayFramework! Docker Images

We build this repository to maintain **[PlayFramework](https://www.playframework.com/download#older-versions)** docker images for the latest MINOR and PATCH version of each **RELEASE 1.X**

## Supported tags and respective Dockerfile links
All images are based on the official [java:7-alpine](https://hub.docker.com/_/java/) image and are minimalistic.

* [1.2.5.6-alpine](1.2.5.6-alpine/Dockerfile)
* [1.2.6.2-alpine](1.2.6.2-alpine/Dockerfile)
* [1.2.7.2-alpine](1.2.7.2-alpine/Dockerfile)
* [1.3.4-alpine](1.3.4-alpine/Dockerfile)
* [1.4.2-alpine](1.4.2-alpine/Dockerfile)
* **latest** means **1.4.2-alpine**

## Usage


### You can use this image as development environment:

```bash
docker run -it --rm \
  -v $(pwd)/src:/app \
  socialmetrix/play:1.2.5.6-alpine \
  play new test
```

If you have `.m2` / `.ivy2` with credentials you want to use, just map them as below:
```bash
docker run \
  -p 9000:9000 -d \
  -v ~/.ivy2:/root/.ivy2 \
  -v $(pwd)/src:/app \
  socialmetrix/play:1.2.5.6-alpine \
  play run test
```

### As base image to pack your application:
Below a example of `Dockerfile` using version `1.2.5.6-alpine`, setting `id` to `prod` and installing `sass` module.

```
FROM socialmetrix/play:1.2.5.6-alpine
MAINTAINER https://socialmetrix.com

COPY src/ /app/

RUN echo y | play install sass-1.1 && \
  echo prod | play id

CMD ["play", "run"]
```
