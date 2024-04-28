FROM ruby:3.3-bookworm

RUN apt-get update
RUN apt-get install vim --yes

COPY root_home/.bashrc /root/.bashrc
COPY root_home/.vimrc /root/.vimrc

WORKDIR /usr/src/ruby-in-docker

COPY --chmod=755 usr/local/bin/entrypoint.sh /usr/local/bin/
ENTRYPOINT entrypoint.sh
