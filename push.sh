#!/bin/bash

REGISTRY=${1}
VERSION=${2}

for TYPE in core base pytorch video
do
  docker tag "dokai:$TYPE" "$REGISTRY:$VERSION-$TYPE"
  docker push "$REGISTRY:$VERSION-$TYPE"
done
