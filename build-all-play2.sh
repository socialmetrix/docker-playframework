#!/usr/bin/env bash

read -r -d '' PLAY_VERSIONS <<-LIST
2.0.8
2.1.5
LIST

for PLAY_VERSION in $(echo $PLAY_VERSIONS); do
  echo "============= Building Play ${PLAY_VERSION} ============="
  docker build --build-arg PLAY_VERSION=${PLAY_VERSION} -t socialmetrix/play:${PLAY_VERSION} .
  echo
  echo
done

docker images socialmetrix/play

# Push to socialmetrix/play repo
for PLAY_VERSION in $(echo $PLAY_VERSIONS); do
  docker push socialmetrix/play:${PLAY_VERSION}
done
