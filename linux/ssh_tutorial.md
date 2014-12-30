# SSH

```bash
# ssh <user>@<machine_or_IP>
ssh brian@computer.com
ssh brianspinos777@98.247.120.193
# it will ask for the password

# go into a specific folder (not sure if it works)
ssh brian@computer.com:~/some_folder


# how to exit from ssh
$ exit
```


# key pair

```bash
# public key and private key (I guess you can change their names)
# id_rsa - that is you password/file
id_rsa

# the public key, wich goes to the server you want to enter into:
id_rsa.pub



~/.ssh # this is where the magic happens!

# generate the key pair, in the ~/.ssh folder:
# it will ask you to choose a name for the file, you can just press enter
# it will ask you to create a 'passphrase', you can just press enter
$ ssh-keygen -C "this is a comment, its usualy an email address..."


# copy contents of the public key to the server:
$ cat id_rsa.pub | pbcopy


# paste contents of your public keys into this file:
# each pub key should go into a separate line
~/.ssh/authorized_keys

```
