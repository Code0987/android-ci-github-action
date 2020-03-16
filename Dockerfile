FROM code0987/android-ci:latest

LABEL "com.github.actions.name"="Android CI"
LABEL "com.github.actions.description"="Build Android projects"
LABEL "com.github.actions.icon"="box"
LABEL "com.github.actions.color"="green"

LABEL "repository"="https://github.com/code0987/android-ci/build"
LABEL "homepage"="https://github.com/code0987/android-ci/github-action"
LABEL "maintainer"="code0987 <durgapalneeraj@gmail.com>"

COPY entrypoint.sh /
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
