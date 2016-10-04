$ ssh root@72.14.183.208 # login into another machine.

$ ssh root@72.14.183.208 "ls -la" # login into another machine and execute a command.

$ spc -r root@72.14.183.208:/var/foo .  # secure copy from another computer to your current computer.

$ rsync -r . root@72.14.183.208:/var/foo # sync the server files with what is in your current computer.
