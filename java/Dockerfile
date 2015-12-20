# Basic install of couchdb
#
# This will move the couchdb http server to port 8101 so adjust the port for your needs. 
#
# Currently installs couchdb 1.3.1

FROM moyan/ubuntu
RUN apt-get install -y openjdk-8-jdk

# Default to UTF-8 file.encoding
RUN update-alternatives --display java

WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Define default command.
CMD ["bash"]
