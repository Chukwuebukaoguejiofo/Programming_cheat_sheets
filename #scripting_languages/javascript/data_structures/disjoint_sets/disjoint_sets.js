/** 
 * Disjoint sets
 * https://www.youtube.com/watch?v=gcmjC-OcWpI&index=14&list=PLlipSLnrfrUlclWAcvmyxcn6R7tzwALhM
 */
function DisjointSet(size){
    var self = this;

    self.size = size;
    self.array = [];
    self.init = init;
    self.union = union;
    self.find = find;
    self.print = print;
    self.init();

    function init(){
        for(var i = 0; i < this.size; i++){
            self.array[i] = -1;
        }
    }

    function union(x, y){
        var xP = find(x);
        var yP = find(y);

        if(self.array[xP] < self.array[yP]){
            self.array[y] = xP;
            self.array[xP]--;
        }else if(self.array[xP] > self.array[yP]){
            self.array[x] = yP;
            self.array[yP]--;
        }else if(self.array[xP] == self.array[yP]){
            self.array[x] = yP;
            self.array[yP]--;
        }
    }

    function find(x){
        if(self.array[x] < 0){
            return x;
        }
        // there was a bug whe I did not use the return on the function call...
        return find(self.array[x]); 
    }

    function print(){
        for(var i = 0; i < this.size; i++){
            console.log(i + ' [' + self.array[i] + ']');
        }
    }
}


var set = new DisjointSet(10);

set.union(1,2);
set.union(2,3);
set.union(3,4);
set.union(4,5);


set.find(1); // 2
set.find(2); // 2
set.find(3); // 2
set.find(4); // 2
set.find(5); // 2

set.find(6); // 6
set.find(7); // 7
set.find(8); // 8
set.find(9); // 9



