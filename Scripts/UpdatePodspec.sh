#!/bin/bash

set -o pipefail

PODSPEC_FILE="TestKit.podspec"
TAG=$(git for-each-ref refs/tags --sort=-taggerdate --format='%(refname:short)' --count=1)
if ! [ -n "$TAG" ]; then
  TAG='0.0.0'
fi
LAST_TAG_COMPONENT=`echo $TAG | awk -F "." '{print $3}'`
NEW_TAG=`echo $TAG | awk -F "." '{print $1 "." $2 ".'$(($LAST_TAG_COMPONENT + 1))'" }'`

sed -i '' "s/$TAG/$NEW_TAG/" $PODSPEC_FILE