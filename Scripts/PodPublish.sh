#!/bin/bash

set -o pipefail

echo 'Podspec Lint'
pod lib lint --allow-warnings

echo 'Podspec Publish'
pod trunk push --allow-warnings