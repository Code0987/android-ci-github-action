# Android CI Github Action

A Github action of image for building Android apps with support for multiple SDK Build Tools. This Docker image contains the Android SDK and most common packages necessary for building Android apps in a CI tool. 

More details [code0987/android-ci](https://github.com/code0987/android-ci).

### Usage and example

```yml
name: Android CI

on: [push]

jobs:

  android-ci:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v1

    - name: "Android CI Github Action"
      uses: code0987/android-ci-github-action@master
      with:
        args: |
          npm install
          export GRADLE_USER_HOME=`pwd`./src/.gradle
          chmod 755 ./src/gradlew 
          ./src/gradlew -p ./src check
```
