# Jenkins 

###### Download jenkins, macOs on the left side of the website:
```
https://jenkins.io/download/
```


###### Install it


###### Go to http://localhost:8080/


###### Copy path to password from the jenkins app: (example)
```bash
$ sudo cat /Users/Shared/Jenkins/Home/secrets/initialAdminPassword
```

###### Jenkins might display a message saying its offline, so do:
```bash
# use http, instead of https
$ subl /Users/Shared/Jenkins/Home/hudson.model.UpdateCenter.xml 
```

###### Go to http://localhost:8080/restart

###### click "Install suggested plugins"

###### Fill form to create user/password
```
admin admin
```


###### Shutdown?
```
http://localhost:8080/exit
# confirm POST request
```

```bash
# to find jenkins process
$ ps -e | grep jenkins 
```
