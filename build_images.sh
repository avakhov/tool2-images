#!/bin/bash

# export DOCKER_BUILDX='docker buildx build --platform linux/amd64,linux/arm64 --push'
export ARCH=$(uname -m)
export DOCKER_BUILDX="docker buildx build --platform linux/$ARCH --push"

export UNISON_VERSION="v3"
export DEV_BASE_VERSION="v4"
export RUBY_BUILD_VERSION_251="v3"
export RUBY_BUILD_VERSION_266="v3"
export RUBY_BUILD_VERSION_274="v3"
export RUBY_BUILD_VERSION_275="v3"
export RUBY_BUILD_VERSION_302="v3"
export RUBY_BUILD_VERSION_322="v3"

set -ex
cat Dockerfile-unison | $DOCKER_BUILDX -t tool2/unison:$UNISON_VERSION-$ARCH -
# cat Dockerfile-dev-base | $DOCKER_BUILDX -t tool2/dev-base:$DEV_BASE_VERSION-$ARCH -
#
# (cat Dockerfile-dev-base; cat dev-ruby) | $DOCKER_BUILDX --build-arg='RUBY_VERSION=2.5.1' -t tool2/dev-ruby:2.5.1-$RUBY_BUILD_VERSION_251-$ARCH -
# (cat Dockerfile-dev-base; cat dev-ruby) | $DOCKER_BUILDX --build-arg='RUBY_VERSION=2.6.6' -t tool2/dev-ruby:2.6.6-$RUBY_BUILD_VERSION_266-$ARCH -
# (cat Dockerfile-dev-base; cat dev-ruby) | $DOCKER_BUILDX --build-arg='RUBY_VERSION=2.7.4' -t tool2/dev-ruby:2.7.4-$RUBY_BUILD_VERSION_274-$ARCH -
# (cat Dockerfile-dev-base; cat dev-ruby) | $DOCKER_BUILDX --build-arg='RUBY_VERSION=2.7.5' -t tool2/dev-ruby:2.7.5-$RUBY_BUILD_VERSION_275-$ARCH -
# (cat Dockerfile-dev-base; cat dev-ruby) | $DOCKER_BUILDX --build-arg='RUBY_VERSION=3.0.2' -t tool2/dev-ruby:3.0.2-$RUBY_BUILD_VERSION_302-$ARCH -
# (cat Dockerfile-dev-base; cat dev-ruby) | $DOCKER_BUILDX --build-arg='RUBY_VERSION=3.2.2' -t tool2/dev-ruby:3.2.2-$RUBY_BUILD_VERSION_322-$ARCH -

echo done.
