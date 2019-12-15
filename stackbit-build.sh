#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5df61534d03a0a00144bf54d/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5df61534d03a0a00144bf54d
curl -s -X POST https://api.stackbit.com/project/5df61534d03a0a00144bf54d/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5df61534d03a0a00144bf54d/webhook/build/publish > /dev/null
