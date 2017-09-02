# Angular 4

###### Links
https://github.com/angular/angular-cli
https://www.typescriptlang.org/docs/handbook/basic-types.html
https://jsonplaceholder.typicode.com/


```bash
$ nvm use 8.0.0
$ npm install -g @angular/cli
$ ng new blog
$ cd blog
$ ng serve # npm start
```

###### Folders to add

```bash
$ mkdir \
src/app/components \
src/app/services \
src/app/pages \
src/app/guards
```


###### Generators

```bash
$ ng g c components/home
$ ng g c components/groups
$ ng g c components/users
$ ng g s services/users # remember to provide it in app.module.ts
```


###### Services

```bash
# 1. Generate the service
#    remember to provide it in app.module.ts 
#    in the providers: [UsersService]
$ ng g s services/users 

# 2. import it in a component
# 3. pass it in the constructor of the component
# 4. use it on `ngOnInit` function of component
```

###### Twitter-Bootstrap installation

```bash
$ npm install bootstrap --save
```

```css
/* styles.css */
@import "~bootstrap/dist/css/bootstrap.css";
```



###### Guards (6 types)

```bash
$ ng g guard guards/auth
```


```javascript
// CanActivate

import { AuthGuard } from './guards/auth.guard';
{
  path: '',
  canActivate: [AuthGuard],
  component: HomeComponent
},

providers: [
    UsersService,
    AuthGuard
  ],
```

###### Todo:

- Forms
- Input
- Output
- Geek Batman
