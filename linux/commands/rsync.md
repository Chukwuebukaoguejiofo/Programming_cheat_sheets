### rsync


```bash
# sync  folders, the <src-folder> will be under the <dest-folder>
# so `$ rsync -r src dest ` will sync src with dest/src
# $ rsync -r <src-folder> <dest-folder> 


# sync the server files with what is in your current computer.
$ rsync -r . root@111.222.333.444:/var/foo 
```
