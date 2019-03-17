#!/bin/bash
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi
CHEF_PUBLIC_KEY='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDAM0taJvMRcEClm2VOzaHQtjTXgd+t1b2XXAYgKGeMRLnbhJcC5TPFefe22Khh9tiydFzSzUW0yWcy4kax3chptqGSBuYq1QYpuFVD6nDoUF8pb9booHJMqmg2WQz6i5T8P+j2bD/DmZxeA+gS/q3PEdzrKD2ZlNn4IRXo6CeYwnBGRJDkG5iFHEY/QtA0L6XnaXY/Q4vwYuERhwWfbXMD5VmEOd4wY7TIFtOlvO5KdXNArqSWeo4uVidEhBf4RYvCZ2E0jEM9HxvdwefSdymbPGBwb8twUL17DTPRROouu63G6XFIf35Br82qwwCVG7A7NygPuQ/S/nN2yQw75apKUY8F93AAGBGnoJeiGKugL5YRwwlvvkM0WIFTIa6g6oAXG0OwXBr92//+nI77MRczWljZn0/7m+1hfiuH68f3h2tISy3xZYB3isz4+Yg6TSfpoLkl4YO4dATSIAK++Fve6bC42Sdt48s8IkgiExgaQcwBfcBQbSFdSGzFlgTMsKNa7t4Zy/+jTGe/UvGRjWlfTyISvsxjLb5y2wq1NTA9ALrP8uSNx27nw5OrB5xPtXhBtiUIXKob+5TF3I7PfPMJ3WszPuTClDXVgpHI0yVtq1iWcv7BwDsiV878/GL5j8BjV57Fo9zFrLrsBqRg7WnvL1rprM4Djc9zvY+63QkYhw== chef-user'
CHEF_USER="chef"
adduser --disabled-password --gecos "" $CHEF_USER
mkdir -p /home/$CHEF_USER/.ssh
echo $CHEF_PUBLIC_KEY >> /home/ansible/.ssh/authorized_keys
echo "$CHEF_USER ALL=(ALL) NOPASSWD:ALL" | sudo EDITOR='tee -a' visudo
