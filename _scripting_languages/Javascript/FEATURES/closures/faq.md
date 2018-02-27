# FAQ

- Do closures in JavaScript make a copy of the parent scope variables or just refer to them?

```javascript
// It's a reference, and this is easy to prove:

var arr = ['Keven Spacey', 'Dracula', 'Franklyn D. Roosevelt'];
 
function outer(obj) {
  return function inner() { console.log(obj) };
}
 
var inner = outer(arr); 
inner(); // ['Keven Spacey', 'Dracula', 'Franklyn D. Roosevelt'];
 
arr.push('Jean-Luc Picard');
 
inner(); // ['Keven Spacey', 'Dracula', 'Franklyn D. Roosevelt', 'Jean-Luc Picard']
```
