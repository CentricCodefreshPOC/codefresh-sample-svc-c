#!/bin/bash
TAGS=($(git tag)) 
REPO="aiforaplatform/$(basename $(pwd))"

for TAG in "${TAGS[@]}"; do
  echo "Checking out tag $TAG"
  git checkout "tags/$TAG" -f
  echo "Building Docker image $REPO:$TAG"
  docker build -t "$REPO:$TAG" .
  echo "Pushing Docker image $REPO:$TAG"
  docker push "$REPO:$TAG"
done