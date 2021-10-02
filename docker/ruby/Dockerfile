FROM ruby:3.0.2

RUN apt-get update
RUN apt-get install vim --yes

COPY ./docker/ruby/root_home/.bashrc /root/.bashrc
COPY ./docker/ruby/root_home/.vimrc /root/.vimrc

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/ruby-in-docker

COPY ./Gemfile ./Gemfile
COPY ./Gemfile.lock ./Gemfile.lock
RUN bundle install --binstubs
RUN bin/rspec --init
