#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5eac6c8d4cb326001a81da45/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5eac6c8d4cb326001a81da45
curl -s -X POST https://api.stackbit.com/project/5eac6c8d4cb326001a81da45/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5eac6c8d4cb326001a81da45/webhook/build/publish > /dev/null
