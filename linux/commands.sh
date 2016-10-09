# login into another machine.
$ ssh root@72.14.183.208 

# login into another machine and execute a command.
$ ssh root@72.14.183.208 "ls -la" 

# secure copy from another computer to your current computer.
$ spc -r root@72.14.183.208:/var/foo .  

# sync the server files with what is in your current computer.
$ rsync -r . root@72.14.183.208:/var/foo 

# creates a symlink (pointer to a file/folder) so you can treat the symlink just as the normal file/folder
$ ln -s foo foo_pointer 
