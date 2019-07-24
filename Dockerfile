FROM jenkins/jenkins:lts
USER root
RUN apt-get update \ 
    && apt-get install -y sudo sshpass

RUN rm -rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean

# drop back to the regular jenkins user - good practice
USER jenkins


# check this out for more infos on pre-installation of plugins
# https://github.com/jenkinsci/docker#installing-more-tools
