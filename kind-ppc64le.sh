#!/bin/bash

git clone --depth=1 https://github.com/kubernetes-sigs/kind.git
cd kind
git apply ../ppc64le.patch
echo "Building base image"
cd images/base && REGISTRY=quay.io/kviswana make push
cd images/kindnet && REGISTRY=quay.io/kviswana make push
cd images/haproxy && REGISTRY=quay.io/kviswana make push
cd images/local-path-helper && REGISTRY=quay.io/kviswana make push
cd images/local-path-provisioner && REGISTRY=quay.io/kviswana make push
echo "All images built"
