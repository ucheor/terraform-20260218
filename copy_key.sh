#!/bin/bash
# copy_key.sh

echo "${key_content}" > /home/ubuntu/${key_name}.pem
chown ubuntu:ubuntu /home/ubuntu/${key_name}.pem
chmod 400 /home/ubuntu/${key_name}.pem

# #!/bin/bash
# # Write the private key content to the file
# cat << 'EOF' > /home/ubuntu/key.pem
# ${private_key}
# EOF

# # Set permissions
# chown ubuntu:ubuntu /home/ubuntu/key.pem
# chmod 400 /home/ubuntu/key.pem