#!/usr/bin/env bash

apt-get update
apt-get install -y debconf-utils software-properties-common apt-transport-https ca-certificates curl gnupg2 default-jre-headless
add-apt-repository -y ppa:webupd8team/java
apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
apt-get install -y oracle-java8-installer
apt install oracle-java8-set-default -y
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | apt-key add -
echo deb https://pkg.jenkins.io/debian-stable binary/ | tee /etc/apt/sources.list.d/jenkins.list
apt-get update
apt-get install git -y
apt-get install jenkins -y
systemctl start jenkins

apt install salt-master

curl -L https://www.opscode.com/chef/install.sh | bash

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
apt update
apt install docker-ce -y