

```javascript
async function f() {
  return 1;
}
```

```
The word “async” before a function means one simple thing: a function always returns a promise. 
If the code has return <non-promise> in it, then JavaScript automatically wraps it into a resolved 
promise with that value.
```

```
https://javascript.info/async-await
```


```js
async function f() {
  return 1;
}

f().then(alert); // 1
```


- `await` works only inside async functions


```js
async function f() {

  let promise = new Promise((resolve, reject) => {
    setTimeout(() => resolve("done!"), 1000)
  });

  let result = await promise; // wait till the promise resolves (*)

  alert(result); // "done!"
}

f();
```
