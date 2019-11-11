#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_exported_files() {
  git checkout -b build
  git add ${TRAVIS_BUILD_DIR}/*.js
  git commit -a -m "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add travis-origin https://${GH_TOKEN}@github.com/roedoejet/mtd-starter.git > /dev/null 2>&1
  git push travis-origin build
}

setup_git
commit_exported_files
upload_files