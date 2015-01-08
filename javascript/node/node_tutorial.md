# Node.js PART 1

- documentation: http://nodejs.org/api/http.html#http_response_writehead_statuscode_reas onphrase_headers

- allows you to build scalable network applications

### what you can build
   - websocket server, (the socket stays open) (like a chat server)

   - fast file upload client (non blocking) (event based, on callbacks)

   - Ad server

   - real time data apps

   - Not a web framework

   - Not multi-threaded server (but two events can happen the same time!!!)


# blocking vs non-blocking code

```js
//blocking code
var contents = fs.readFileSync('/etc/hosts');
console.log(contents); // doing this first,
console.log('Doing something else'); // then doing this after

//non-blocking code
fs.readFileSync('/etc/hosts', function(err, contents){
  console.log(contents); // execute this whennever its ready!
});
console.log('Doing something else');


//non-blocking code (another way to do it!)
var callback = function(err, contents){
  console.log(contents); // execute this whennever its ready!
};
fs.readFileSync('/etc/hosts', callback);
console.log('Doing something else');

```


# node.js hello world

```js
var http = require('http'); // how we require modules
http.createServer(function(request, response){
  response.writeHead(200);  // status code in head
  response.write("hello world"); // response body
  response.end(); // close connection
}).listen(8080); // listen for connections on this port

console.log('listening on port 8080...');
```

```bash
$ node hello.js # "listening on port 8080..."

# keep the server running before running a curl command!!! TIP
$ curl http://localhost:8080  # "hello world"  

# you can see it on the browser also!
# http://localhost:8080/  # "hello world"

```


# how node works

- it registers events, like 'request', 'connection', 'close' (it can have nested events too!)
- it has an event loop (checking for events)
  - events are processed on at a time on the event loop (like a queue)




# example with long running process

```js

// 1. request comes in, and triggers the request event

var http = require('http');

http.createServer(function(request, response){  // request event
  response.writeHead(200);
  response.write("dog is running.");
  setTimeout(function(){                        // timeout event
    response.write("dog is done.");
    response.end();
  }, 5000); // pause for 5 seconds
}).listen(8080);

```




# example of server reading a html file:

```js
// app.js

var http = require('http');
var fs = require('fs');

http.createServer(function(request, response) {
  response.writeHead(200, {'Content-Type':'text/html'});
  fs.readFile('index.html', function(error, contents){
    response.write(contents);
    response.end();
  });

}).listen(8080);


```

```html
<!-- index.html -->
<p>hello there</p>
```

```bash
$ node app.js


$ curl http://localhost:8080 # <p>hello there</p>
```




# tips

```js
// instead of:
response.write("hello");
response.end();

// you can do:
response.end("Hello");

```



# Node.js PART 2

### node can listen to events in the html DOM

- like 'click', 'submit', 'hover'...


# Many objects in Node also emit events!

- they inherit from `EventEmitter` constructor
- `net.Server` class inherits from `EventEmitter`, and emits `request` event
- `fs.readStream` inherits from `EventEmitter`, and emits `data` event




```js
// Custom event emitters
var EventEmitter = require('events').EventEmitter;
var logger = new EventEmitter(); // we want it to emit events like: 'error', 'warn', 'info'

// we want to build event listeners, for those events
logger.on('error', function(message){
  console.log('ERR: ' + message);
});

// to call that event, (event emitters) :
logger.emit('error', 'Spilled Milk'); // any aditional parameters here will be passed to the listeners
logger.emit('error', 'Eggs Cracked');  // 'Err: Eggs Cracked'
```





# how does the request generate a event?

```js
http.createServer(function(request, response){ ... })

// the above code and below are the same!
var server = http.createServer();
server.on('request', function(request, response){ ... });

//...

server.on('close', function(){ ... });
```




# example of chat (not complete?)

```js
var events = require('events');
var EventEmitter = events.EventEmitter;

var chat = new EventEmitter();
var users = [], chatlog = [];

chat.on('message', function(message) {
  chatlog.push(message);
});

chat.on('join', function(nickname) {
  users.push(nickname);
});

// Emit events here
chat.emit('message', "hello there");
chat.emit('join', "welcome");

```





# listening for an event multiple times

```js
var http = require('http');
var server = http.createServer();

server.on('request', function(request, response) {
  response.writeHead(200);
  response.write("Hello, this is dog");
  response.end();
});

server.on('request', function(request, response) {
  console.log("New request coming in...");
});

server.on('close', function(){
  console.log("Closing down the server...");
});



server.listen(8080);

```









# Node.js PART 3  (streams)


- access data piece by piece, chunck by chunk...
- you can start manipulation that data as soon as it arrieves in the server
- streams are like channels, where data can flow through
- there are different type of streams
  - readable streams
  - writeable streams
  - readable and writeable streams
  - ...
- look at the streams2 API (Node version v0.10.x)

- the `request` object is a readable stream
- and the `response` object is a writeable stream
- we (the server) write data to the `response`




# how to read from the (browser) request?

- the `request` object is a readable stream
  - it inherits from `EventEmitter`
  - it can emit the events:
    - the `readable` event, that is fired when the data is ready to be consumed, read...
    - the `end` event, when the client is done sending all the data


# lets print what we receive from the request

```js

var http = require('http');

http.createServer(function(request, response){  // request event
  response.writeHead(200);



  //------------------------------------------------------------
  request.on('readable', function(){
  	var chunk = null;
  	while(null !== (chunk = request.read())){
      console.log(chunk.toString());
      // we have to call the .toString() because the chunks are BUFFERS (it could be binary data)
  	}
  });

  request.on('end', function(){
    response.end();
  });
  //------ the above code can be substituted by the below ------
  //request.pipe(response);

  // // so when you send data with it will show it to the client:
  // // $  curl -d 'hello' http://localhost:8080
  // // the client will see 'hello', but on the node server terminal... (what?, why?)
  //------------------------------------------------------------





}).listen(8080);


```



# reading and writting a file (using streams)
```js
var fs = require('fs');
var file = fs.createReadStream("readme.md");
var newFile = fs.createWriteStream("readme_copy.md");

file.pipe(newFile); // copy the contents of `file` to the `newFile`

// we can pipe any read stream into any write stream
```






# uploading a file (using streams)

```js
var fs = require('fs');
var http = require('http');

http.createServer(function(request, response){
  var newFile = fs.createWriteStream("readme_copy.md"); // we will write to that file
  request.pipe(newFile);

  request.on('end', function(){
  	response.end('uploaded!');
  });
}).listen(8080);


// $ curl --upload-file readme.md http://localhost:8080  # 'uploaded!'
// it created the new file 'readme_copy.md' with the contents of the old file!!!
```








# file upload showing the progress in percentage

- you need the `HTTP Server` and `File System` modules (that we were using before)

```js
// $ curl --upload-file brian_the_vine.jpg http://localhost:8080 # it could be a html form in the browser...



var fs = require('fs');
var http = require('http');

http.createServer(function(request, response){
  var newFile = fs.createWriteStream("readme_copy.md"); // we will write to that file

  // get size of file
  var fileBytes = request.headers['content-length'];

  // keep track of how many bytes were uploaded to the server
  var uploadedBytes = 0;


  // keep track of file upload in percentage!
  request.on('readable', function(){
  	var chunk = null;
  	while(null !== (chunk = request.read())){
  	  uploadedBytes += chunk.length;
  	  var progress = (uploadedBytes / fileBytes) * 100;
  	  response.write("progress: " + parseInt(progress, 10) + "%\n");
  	  // parseInt("number", 10) // 10 is decimal representation, it also rounds it!
  	}
  });







  request.pipe(newFile); // taking care of the actual upload

  request.on('end', function(){
  	response.end('uploaded!\n');
  });
}).listen(8080);

```



















# Node.js PART 4  (module)


### examples:

```js
var http = require('http');

var fs = require('fs');

```


### create a custom module


```js
// custom_hello.js (module)

var hello = function(){
  console.log("hello!");
};

module.exports = hello; // make module's function public! so others can use it


// this way, the module will only have a single public function `hello`
```

```js
// app.js

var hello = require('./custom_hello'); // how to require your custom module!

hello(); // calling the module's public method!
```


### another custom module (another way to write modules)

```js
// custom_goodbye.js (module)

exports.goodbye = function(){
  console.log("bye!");
};


// this way you can have multiple public functions on this module!
```

```js
// app.js

var gb = require('./custom_goodbye'); // how to require your custom module!

gb.goodbye(); // calling the module's public method!

// or in one line:
// require('./custom_goodbye').goodbye();
```




### module with multiple public methods

```js
// my_module.js

var foo = function(){ ... };
var bar = function(){ ... };
var baz = function(){ ... }; // its the module's private function

exports.foo = foo
exports.bar = bar
```

```js
// app.js

var myMod = require('./my_module');
myMod.foo();
myMod.bar();

```



# making http requests

```js
// make_request.js

var http = require('http');

var makeRequest = function(message){
      //var message = "hello world";
      var options = {
        host: 'localhost', port: 8080, path: '/', method: 'POST'
      };

      var request = http.request(options, function(response){
        response.on('data', function(){
          console.log(data); // log response body
        });
      });

      request.write()message; // begins the request above!
      request.end();
};

makeRequest("hello world encapsulated!");

// now allow this function to be available as the module's public function
module.exports = makeRequest;
```

```js
// app.js

var makeRequest = require('./make_request');

makeRequest("hello there again!");
makeRequest("who are you?");

```



# how does Node look for the modules?
  - same directory as the application for a file with that name
  - node will look in `<my_app_folder>/node_modules/make_request.js` directory
  - node will look in `~/brianspinos777/node_modules/make_request.js` directory
  - node will look in `~/node_modules/make_request.js` directory
  - node will look in `/node_modules/make_request.js` directory (root path)

```js


```
































