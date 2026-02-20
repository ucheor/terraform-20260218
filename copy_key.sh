#!/bin/bash
# copy_key.sh

echo "${key_content}" > /home/ubuntu/${key_name}.pem
chown ubuntu:ubuntu /home/ubuntu/${key_name}.pem
chmod 400 /home/ubuntu/${key_name}.pem

