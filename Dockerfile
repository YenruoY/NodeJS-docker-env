FROM ubuntu:latest

RUN apt-get update && apt-get install -y locales \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

# Installing necessary packages
RUN apt-get install curl -y \
	&& apt-get install git vim -y

# Install node.js
RUN curl -sL https://deb.nodesource.com/setup_21.x | bash -
RUN apt-get install -y nodejs

# Create a new user
RUN useradd -ms /bin/bash node_user
USER node_user
WORKDIR /home/node_user

EXPOSE 5173 8000
COPY ./apps . 
CMD ["/bin/bash"]
