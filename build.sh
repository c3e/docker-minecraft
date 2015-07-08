#!/bin/sh

JAVA_VERSION=1.0.0

docker build $@ --rm -t c3e/minecraft:${OWNCLOUD_VERSION} .

