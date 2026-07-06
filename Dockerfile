FROM code0987/android-ci:latest

LABEL org.opencontainers.image.title="Android CI Github Action"
LABEL org.opencontainers.image.description="DEPRECATED: Unmaintained Docker action for Android CI. Base image last updated October 2020. Migrate to setup-java, setup-android, and setup-gradle."
LABEL org.opencontainers.image.source="https://github.com/code0987/android-ci-github-action"
LABEL org.opencontainers.image.url="https://github.com/code0987/android-ci-github-action"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.vendor="code0987"
LABEL org.opencontainers.image.version="1.0.0"
LABEL maintenance.status="deprecated"

LABEL "com.github.actions.name"="Android CI Github Action (deprecated)"
LABEL "com.github.actions.description"="DEPRECATED: Unmaintained. Migrate to actions/setup-java, android-actions/setup-android, and gradle/actions/setup-gradle."
LABEL "com.github.actions.icon"="alert-triangle"
LABEL "com.github.actions.color"="yellow"

LABEL "repository"="https://github.com/code0987/android-ci-github-action"
LABEL "homepage"="https://github.com/code0987/android-ci-github-action"
LABEL "maintainer"="code0987 <durgapalneeraj@gmail.com>"

COPY entrypoint.sh /
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
