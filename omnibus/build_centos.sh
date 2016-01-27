#!/bin/bash

yum install -y fakeroot rpm-build
bundle install --without development

#wtf - stupid errors from the old git in centos 5
git config --global user.email "you@example.com"
git config --global user.name "Your Name"

bundle exec omnibus build chef12
