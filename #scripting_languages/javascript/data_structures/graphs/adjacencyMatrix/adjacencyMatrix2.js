/**
 * Graph adjacency matrix
 */
function Graph(size){
  var self = this;

  self.array = [];

  self.init = init;
  self.connect = connect;
  self.isConnected = isConnected;

  self.init(size);

  function init(size){
    self.size = size;
    for(var i = 0; i < size; i++){
      self.array[i] = [];
    }
  }

  function connect(a,b,w){
    self.array[a][b] = w;
    self.array[b][a] = w;
  }

  function isConnected(a,b){
    return self.array[a][b] !== undefined;
  }
}

var graph = new Graph(10);

graph.connect(0,1,100);
graph.connect(0,2,100);
graph.connect(0,3,100);

graph.isConnected(0,1); // true
graph.isConnected(0,2); // true
graph.isConnected(0,3); // true

graph.isConnected(0,4); // false

