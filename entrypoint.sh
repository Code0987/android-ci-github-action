#!/bin/sh
set -eu

echo "::warning title=android-ci-github-action deprecated::This action is deprecated and unmaintained. The base image (code0987/android-ci) was last published in October 2020 and is unsuitable for modern AGP/JDK. Migrate to actions/setup-java, android-actions/setup-android, and gradle/actions/setup-gradle. See https://github.com/code0987/android-ci-github-action#migration-guide" >&2

if [ "$#" -eq 0 ] || [ -z "$*" ]; then
  echo "::error::No commands provided. Pass build commands via the 'args' input (deprecated)." >&2
  exit 1
fi

sh -c "$*"
