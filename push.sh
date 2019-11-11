#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

checkout_branch() {
    git add ${TRAVIS_BUILD_DIR}/*.js
    git checkout -b gh-pages
    git commit -a -m "Travis build: $TRAVIS_BUILD_NUMBER"
    git pull origin gh-pages
}

move_exported_files() {
    rm ${TRAVIS_BUILD_DIR}/assets/*.js
    mv ${TRAVIS_BUILD_DIR}/*.js ${TRAVIS_BUILD_DIR}/assets/
}

upload_files() {
  git remote add travis-origin https://${GH_TOKEN}@github.com/roedoejet/mtd-starter.git > /dev/null 2>&1
  git push travis-origin gh-pages
}

setup_git
checkout_branch
move_exported_files
upload_files