#!/bin/bash
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi
ANSIBLE_PUBLIC_KEY='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQClU27017OMw3UCypIj04KBCtO9IwivgZl1raE2Y/w2DG52/Fh4NVIzKCS6o/elkXa/mUKn01ENRvQkE/MCubNyiyaWa745JzavjywOauUYwbLnTjrgfBNPWqXAYcQO4EV+RfECxEL4QdoJrQACWUi2JHAeQRDLVORPALKeZIODXZu08omA8FbH1wSxtLfb5o4jf8ZI/g2D0O/V/BSS8qgalhJMnOym6L/4SQWJ2roDpMld8t6nUYp4kGvU9EZ4rq0Dj4RXqHq3ixBffcSbTjybxwK3Q+9qcH7AKLk4VcposA/ltDe82IYT8XBN2sTjNNSZXB8y+1BzswgC3J1qGkLp ansible_user'
ANSIBLE_USER="ansible"
adduser --disabled-password --gecos "" $ANSIBLE_USER
mkdir -p /home/$ANSIBLE_USER/.ssh
echo $ANSIBLE_PUBLIC_KEY >> /home/ansible/.ssh/authorized_keys
echo "$ANSIBLE_USER ALL=(ALL) NOPASSWD:ALL" | sudo EDITOR='tee -a' visudo
