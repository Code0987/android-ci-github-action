# Android CI Github Action

> [!WARNING]
> **DEPRECATED.** This action is no longer maintained.
>
> The bundled base image (`code0987/android-ci:latest`) was last published in **October 2020** and is not suitable for modern Android Gradle Plugin (AGP 8+) or current JDKs.
>
> Prefer the [migration guide](#migration-guide) below. Existing callers should pin a release tag (for example `@v1.0.0`) instead of `@master` until they migrate. This repository may receive compatibility fixes only.

[![CI](https://github.com/code0987/android-ci-github-action/actions/workflows/build.yml/badge.svg)](https://github.com/code0987/android-ci-github-action/actions/workflows/build.yml)
[![GitHub release](https://img.shields.io/github/v/release/code0987/android-ci-github-action?include_prereleases)](https://github.com/code0987/android-ci-github-action/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A GitHub Action that ran builds inside a Docker image with the Android SDK and common CI packages.

More details on the legacy image: [code0987/android-ci](https://github.com/code0987/android-ci).

See [CHANGELOG.md](CHANGELOG.md) for version history.

## Migration guide

GitHub-hosted `ubuntu-latest` runners already include Android SDK components. The maintained replacement is a small workflow using official setup actions—no custom Docker action required.

```yml
name: Android CI

on:
  push:
  pull_request:

permissions:
  contents: read

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Set up JDK
        uses: actions/setup-java@v4
        with:
          distribution: temurin
          java-version: '17'

      - name: Set up Android SDK
        uses: android-actions/setup-android@v3

      - name: Set up Gradle
        uses: gradle/actions/setup-gradle@v4

      - name: Run checks
        run: |
          chmod +x ./gradlew
          ./gradlew check

      - name: Upload APKs
        if: success()
        uses: actions/upload-artifact@v4
        with:
          name: apks
          path: app/build/outputs/apk/**/*.apk
          if-no-files-found: ignore
```

### Why migrate

| Legacy action | Recommended approach |
| --- | --- |
| Rebuilds a ~1.4GB Docker image on every job | Uses the hosted runner toolchain |
| Unmaintained SDK / JDK from 2020 | Current cmdline-tools, JDK 17/21, AGP 8+ |
| Implicit `args` shell passthrough | Explicit `run:` steps with caching |
| Pin `@master` (moving target) | Pin action versions (`@v4`, `@v3`) |

### If you still need a container image

Use `jobs.<id>.container` with a **maintained** Android SDK image, or build your own from current `cmdline-tools`. Do not rely on `code0987/android-ci:latest`.

```yml
jobs:
  build:
    runs-on: ubuntu-latest
    container: <your-maintained-android-sdk-image>
    steps:
      - uses: actions/checkout@v4
      - run: ./gradlew check
```

## Legacy usage (deprecated)

Kept for historical reference only. **Do not start new projects on this action.**

```yml
name: Android CI

on: [push]

jobs:
  android-ci:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Android CI Github Action (deprecated)
        uses: code0987/android-ci-github-action@v1.0.0
        with:
          args: |
            export GRADLE_USER_HOME="$PWD/.gradle"
            chmod +x ./gradlew
            ./gradlew check
```

## Versioning and releases

This project uses [Semantic Versioning](https://semver.org/).

- Release tags: `vMAJOR.MINOR.PATCH` (for example `v1.0.0`)
- Moving major tag: `v1` → latest `v1.x.y`
- Changelog: [CHANGELOG.md](CHANGELOG.md)
- GitHub Releases include release notes and an image SBOM (`sbom.spdx.json`) when published via the release workflow

Pin a release tag in workflows (`@v1.0.0` or `@v1`), never `@master`.

## License

[MIT](LICENSE)
