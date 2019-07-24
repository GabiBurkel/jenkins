FROM jenkins/jenkins:lts
USER root

# check this out for more infos on building docker images in a dockerized
# jenkins container:
# https://medium.com/@manav503/how-to-build-docker-images-inside-a-jenkins-container-d59944102f30

RUN apt-get -y update

RUN apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

RUN apt-get -y update

RUN apt-get -y install docker-ce docker-ce-cli

RUN usermod -aG docker jenkins

# // install docker stuff

RUN apt-get install -y sudo sshpass


RUN rm -rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean

# drop back to the regular jenkins user - good practice
USER jenkins


# check this out for more infos on pre-installation of plugins
# https://github.com/jenkinsci/docker#installing-more-tools
