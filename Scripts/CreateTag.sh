#!/bin/bash

set -o pipefail

TAG=$(git for-each-ref refs/tags --sort=-taggerdate --format='%(refname:short)' --count=1)
if ! [ -n "$TAG" ]; then
  TAG='0.0.0'
fi
FIRST_TAG_COMPONENT=`echo $TAG | awk -F "." '{print $3}'`
NEW_TAG=`echo $TAG | awk -F "." '{print '$(($FIRST_TAG_COMPONENT + 1))' "." $2 "." $3 }'`

git tag -a $NEW_TAG -m "New Release"
git push origin $NEW_TAG

