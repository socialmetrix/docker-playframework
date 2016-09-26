# PlayFramework! Docker Images

We build this repository to maintain **[PlayFramework](https://www.playframework.com/download#older-versions)** docker images for the latest MINOR and PATCH version of each **RELEASE 1.X**

## Supported tags and respective Dockerfile links
All images are based on [anapsix/alpine-java](https://hub.docker.com/r/anapsix/alpine-java/) image and are minimalistic. This image also support CERTS so Java can connect to HTTPS.


## Due a major retagging made by `anapsix/alpine-java`, where they changed Alpine version, we experienced a break on compatibility. In order to avoid further problems, we added a new version tag on our side to try to keep a stable version between releases.

The version tag is added by the [build-all.sh](https://github.com/socialmetrix/docker-playframework/blob/master/build-all.sh#L11)


# USAGE

### You can use this image as development environment:

```bash
docker run -it --rm \
  -v $(pwd)/src:/app \
  socialmetrix/play:1.2.5.6-1.0 \
  play new test
```

If you have `.m2` / `.ivy2` with credentials you want to use, just map them as below:
```bash
docker run \
  -p 9000:9000 -d \
  -v ~/.ivy2:/root/.ivy2 \
  -v $(pwd)/src:/app \
  socialmetrix/play:1.2.5.6-1.0 \
  play run test
```

### As base image to pack your application:
Below a example of `Dockerfile` using version `1.2.5.6-1.0`, setting `id` to `prod` and installing `sass` module.

```
FROM socialmetrix/play:1.2.5.6-1.0
MAINTAINER https://socialmetrix.com

COPY src/ /app/

RUN echo y | play install sass-1.1 && \
  echo prod | play id

CMD ["play", "run"]
```
