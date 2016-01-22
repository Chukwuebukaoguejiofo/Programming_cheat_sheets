//------------------------------------------ express hello world app
var express = require('express');
var app = express();

//------------------------------------------ modules
var hello = require('./my_modules/custom_hello'); // how to require your custom module!
//hello();
var gb = require('./my_modules/custom_goodbye');
// gb.goodbye();

//------------------------------------------ root path
app.get('/', function(request, response){
    response.send('Hello World root\n');
});

//------------------------------------------ using modules
app.get('/see_my_module1', function(request, response){
    response.send('-> ' +hello()+'\n');
});

//------------------------------------------ using modules
app.get('/see_my_module2', function(request, response){
    response.send('-> ' +gb.goodbye()+'\n');
});

//------------------------------------------ text
app.get('/users', function(request, response){
    response.send('Hello World users\n');
});

//------------------------------------------ json
app.get('/my_json', function(request, response){
    var myData = {name: 'brian', age: 27};
    response.json(myData);
});

//------------------------------------------ html
app.get('/my_html', function(request, response){
    var myData = '<h1>hello</h1>';
    response.send(myData);
});

//------------------------------------------ sending files
app.get('/html_file', function(request, response){
  response.sendFile(__dirname + '/public/foo.html');
});

//------------------------------------------ ejs template
// - I need a '/views' folder in the root directory of my app
// - response.render('foo.ejs'); will look in that folder!
app.get('/using_templates', function(request, response){
    response.locals = {bar: "bar1", baz: "baz2"};
    response.render('foo.ejs');
});

//------------------------------------------ dynamic routes
app.get('/users/:name', function(request, response){
   var name = request.params.name;
   response.send('hello ' + name);
});

//------------------------------------------ routes
var blocks = require('./routes/blocks');
app.use('/blocks', blocks)
// curl -i http://localhost:3000/blocks/
// curl -i http://localhost:3000/blocks/foo

//------------------------------------------ port
app.listen(3000);

// curl -i http://localhost:3000        # 'Hello World root\n'
// curl -i http://localhost:3000/users  # 'Hello World users\n'
