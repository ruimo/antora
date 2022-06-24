#!/bin/sh

docker run -e HOME=/documents -t --rm -u $(id -u) -v $(pwd):/documents/ ruimo/antora npx antora --cache-dir=./.cache/antora --fetch antora-playbook.yml --stacktrace
