#
# Ubuntu Dockerfile
#

# Pull base image.
FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
# Install.
COPY sources.list /etc/apt/sources.list
RUN apt-get update && \
  apt-get install -y byobu curl git htop man unzip vim wget

RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd
RUN apt-get install -y build-essential
RUN apt-get install -y python-software-properties software-properties-common 

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
