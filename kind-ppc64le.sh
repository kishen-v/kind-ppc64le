#!/bin/bash

git submodule update --init
cd kind
git apply ../build-ppc64le.patch
cd images
echo "Building base image"
pushd base && TAG=latest REGISTRY=quay.io/kviswana make push
popd
pushd kindnet && TAG=latest REGISTRY=quay.io/kviswana make push
popd
pushd haproxy && TAG=latest REGISTRY=quay.io/kviswana make push
popd
pushd local-path-helper && TAG=latest REGISTRY=quay.io/kviswana make push
popd
pushd local-path-provisioner && TAG=latest REGISTRY=quay.io/kviswana make push
popd
echo "All images  built"
