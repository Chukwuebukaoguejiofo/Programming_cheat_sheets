# SSL


[RailsCast SSL](http://railscasts.com/episodes/357-adding-ssl?autoplay=true)

[Pow Website](http://pow.cx/)

###### Using Pow and Nginx




```bash
curl get.pow.cx | sh # install pow
# To uninstall Pow, `curl get.pow.cx/uninstall.sh | sh`
# to restart pow
launchctl stop cx.pow.powd

cd ~/.pow
ln -s ~/Desktop/RailsApps/bootstrapApp/BootstrapApp . # symlink your app's root folder
# http://BootstrapApp.dev  will be available!
```


```bash
# install nginx
brew install nginx

cd /usr/local/etc/nginx

# generates server.key and server.csr files
openssl req -new -nodes -keyout server.key -out server.csr # create certificates

# generate certificate file (server.crt) using the previously created files 
# from the previous command above
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

# edit the nginx config file, see railscast video on SSL on how to do this
subl nginx.conf

# test it
sudo nginx -t

# start nginx
sudo nginx 


# now go to the broser  
# use safari browser (and click 'continue')
# DONT USE chrome and firefox, because they do not seem to have a 'one time' option
https://BootstrapApp.dev # will be available!



# to restart your app, after app config changes:
touch tmp/restart.txt
```
