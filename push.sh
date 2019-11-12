#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

checkout_branch() {
    git add ${TRAVIS_BUILD_DIR}/*.js
    git checkout -b gh-pages
    git commit -a -m "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add travis-origin https://${GH_TOKEN}@github.com/roedoejet/mtd-starter.git > /dev/null 2>&1
  git push --force travis-origin gh-pages
}

setup_git
checkout_branch
upload_files