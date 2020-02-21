#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e5068fed742cf001981fec9/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e5068fed742cf001981fec9
curl -s -X POST https://api.stackbit.com/project/5e5068fed742cf001981fec9/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e5068fed742cf001981fec9/webhook/build/publish > /dev/null
