#!/bin/bash
# install required package
apt-get update
apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    gnupg-agent \
    software-properties-common

# install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io
# add user to docker group to make docker accessible without sudo
gpasswd -a ubuntu docker

# copy ssh-key
cat <<EOF > /home/ubuntu/.ssh/id_rsa
${worker_access_private_key}
EOF
EOF
chmod 444 /home/ubuntu/.ssh/id_rsa
