FROM ubuntu:latest

RUN apt-get update && apt-get install -y locales \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

# Installing necessary packages
RUN apt-get install curl -y \
	&& apt-get install git vim tmux wget sudo -y

# Create a new user
RUN echo ubuntu:toor | chpasswd
USER ubuntu
WORKDIR /home/ubuntu

# Install node.js
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

RUN npm install node  # command not tested for automation

EXPOSE 5173 8000 8080
COPY ./apps .
CMD ["/bin/bash"]

##########################################
# Needs .bashrc before curl command
