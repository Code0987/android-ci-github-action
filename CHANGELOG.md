# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-07-06

### Deprecated

- The action is **deprecated and unmaintained**. Workflows emit a GitHub Actions warning on every run pointing to the migration guide.
- Marketplace branding updated to signal deprecation (`alert-triangle` / yellow).
- README documents migration to `actions/setup-java`, `android-actions/setup-android`, and `gradle/actions/setup-gradle`.

### Added

- Explicit `args` input in `action.yml` (replaces undocumented implicit Docker args only).
- `VERSION` file and this changelog for semver releases (`vMAJOR.MINOR.PATCH` plus moving `vMAJOR` tag).
- Release workflow that creates GitHub Releases, generates an SPDX SBOM for the action image, and attaches `sbom.spdx.json` to the release.
- CI workflow updates: modern `actions/checkout`, pull-request runs, and SBOM generation on builds.

### Fixed

- Entrypoint rejects empty commands instead of running an empty `sh -c`.
- Legacy README example pinned to a release tag and corrected `GRADLE_USER_HOME` path guidance.

### Security

- Release artifacts include an image SBOM to improve supply-chain visibility for remaining consumers.

[1.0.0]: https://github.com/code0987/android-ci-github-action/releases/tag/v1.0.0
