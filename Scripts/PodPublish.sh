#!/bin/bash

set -o pipefail

TAG=$(git for-each-ref refs/tags --sort=-taggerdate --format='%(refname:short)' --count=1)
git checkout $TAG

echo 'Podspec Lint'
pod lib lint --allow-warnings

echo 'Podspec Publish'
pod trunk push --allow-warnings