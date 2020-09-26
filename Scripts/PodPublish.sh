#!/bin/bash

set -o pipefail

echo 'Podspec Lint'
pod lib lint --allow-warnings
pod trunk push TestKit.podspec