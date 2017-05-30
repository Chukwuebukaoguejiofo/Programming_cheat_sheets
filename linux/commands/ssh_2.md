# SSH tutorial


[tutorial](https://www.cyberciti.biz/faq/how-to-set-up-ssh-keys-on-linux-unix/)


```bash

#
# Create a key pair (if you dont have one)
#
# -t rsa                             -> Specifies the type of key to create. The possible values are “rsa1” for protocol version 1 and 
#                                       “dsa”, “ecdsa”, “ed25519”, or “rsa” for protocol version 2.
# -b 4096                            -> Specifies the number of bits in the key to create
# -f ~/.ssh/vps-cloud.web-server.key -> Specifies the filename of the key file.
# -C "My web-server key"             -> Set a new comment.
#
ssh-keygen -t rsa -b 4096 -f ~/.ssh/vps-cloud.web-server.key -C "My web-server key"

#
# Copy the client's public key to the server
# Your public key will be added to ~/.ssh/authorized_keys file in the server
# (Or just copy your public key to the remote server in the ~/.ssh/authorized_keys file)
#
ssh-copy-id -i ~/.ssh/id_rsa.pub user_in_server@server_ip

# test
ssh user_in_server@server_ip 
```
