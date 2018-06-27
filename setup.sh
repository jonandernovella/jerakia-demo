#!/bin/bash -eu


command -v jerakia || {

  echo "
[jerakia]
name=Repository for crayfishx/jerakia application.
baseurl=https://rpm.packager.io/gh/crayfishx/jerakia/centos7/stable
enabled=1
gpgcheck=0
" | tee /etc/yum.repos.d/jerakia.repo

  yum install -y epel-release
  yum install -y jerakia unzip python-requests vim python2-pip

  # install ansible
  yum install -y ansible
  echo "localhost ansible_connection=local" > /etc/ansible/hosts

  # install docker
  curl -L -o /tmp/docker.rpm https://download.docker.com/linux/centos/7/x86_64/stable/Packages/docker-ce-18.03.1.ce-1.el7.centos.x86_64.rpm
  yum install -y /tmp/docker.rpm || true

  # install terraform, packer
  mkdir -p ~/bin
  curl -LC - -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip
  curl -LC - -o /tmp/packer.zip https://releases.hashicorp.com/packer/1.1.3/packer_1.1.3_linux_amd64.zip
  unzip -oq /tmp/terraform.zip -d /usr/local/bin
  unzip -oq /tmp/packer.zip -d /usr/local/bin
  ansible all -m lineinfile -a "dest=/root/.bashrc line='alias packer=/usr/local/bin/packer'"

  # install jinja2 tools
  pip install --upgrade pip setuptools
  pip install jinja2-cli jcp
}

# copy/refresh test data
rm -rf /var/lib/jerakia/data; mkdir -p /var/lib/jerakia
cp -r /tmp/data /var/lib/jerakia/
cp -f /tmp/policy.d/* /etc/jerakia/policy.d/

echo "test data lookup without server"
jerakia lookup --namespace httpd port

# Start Jerakia server
sudo systemctl start jerakia

# Start Docker
# sudo systemctl start docker