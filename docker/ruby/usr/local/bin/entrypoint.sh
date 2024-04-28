#!/bin/bash


# throw error if Gemfile has been modified since Gemfile.lock
bundle config --global frozen 1

bundle install
bundle binstubs --all
bin/rspec --init

exec irb
