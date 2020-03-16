FROM code0987/android-ci:latest

LABEL "com.github.actions.name"="Android CI Github Action"
LABEL "com.github.actions.description"="A Github action of image for building Android apps with support for multiple SDK Build Tools. This Docker image contains the Android SDK and most common packages necessary for building Android apps in a CI tool."
LABEL "com.github.actions.icon"="box"
LABEL "com.github.actions.color"="green"

LABEL "repository"="https://github.com/code0987/android-ci-github-action"
LABEL "homepage"="https://github.com/code0987/android-ci-github-action"
LABEL "maintainer"="code0987 <durgapalneeraj@gmail.com>"

COPY entrypoint.sh /
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
