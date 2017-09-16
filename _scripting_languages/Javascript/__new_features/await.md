# await

```javascript
function getUsers() {
  return new Promise(resolve => {
    setTimeout(() => {
      var users = ['Brian', 'Erich', 'Rick'];
      resolve(users);
    }, 2000);
  });
}

async function displayUsers() {
  var users = await getUsers();
  console.log(users);
}

// Displays users after 2 seconds
displayUsers(); //  ["Brian", "Erich", "Rick"]
````
