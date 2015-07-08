# Minecraft with Oracle Java 8 Dockerfile
#
# Pull base image.

FROM dockerfile/ubuntu

# Install Java.
RUN \
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
add-apt-repository -y ppa:webupd8team/java && \
apt-get update && \
apt-get install -y oracle-java8-installer && \
rm -rf /var/lib/apt/lists/* && \
rm -rf /var/cache/oracle-jdk8-installer

# install dependencies
RUN apt-get update && \
apt-get install -y libxtst6 libxrender1 libxi6 

# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV _JAVA_OPTIONS -Xmx1024M

# remove display
ENV DISPLAY=:0

# add files
ADD files/ /data

# Define default command.
CMD ["/bin/bash"] 

# ENTRYPOINT ["java", "-Xmx1024M", "-Xms1024M", "-jar", "minecraft_server.1.8.7.jar", "nogui"]
ENTRYPOINT ["/data/start.sh"]

#RUN java -Xmx1024M -Xms1024M -jar minecraft_server.1.8.7.jar nogui 
