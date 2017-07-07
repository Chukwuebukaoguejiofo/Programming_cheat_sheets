# Angular 2 (Start an app)

```bash
# use node 6.9.0
nvm use 6.9.0


# install the app generator
npm install -g @angular/cli


# create the app
ng new blog
cd blog
npm start 
# Go to http://localhost:4200


# tutorial
# https://angular.io/guide/quickstart
```


```
blog/src/main.ts # Angular entry point

blog/src/app/app.module.ts # Where other components are registered

# Component example:
blog/src/app/foos/foos.component.ts # The class
blog/src/app/foos/foos.component.html
blog/src/app/foos/foos.component.css
```
