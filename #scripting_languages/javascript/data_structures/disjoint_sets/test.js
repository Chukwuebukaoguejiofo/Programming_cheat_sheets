// disjoint set


function DisjointSet(n){
    var self = this;
    
    self.size = n;
    self.array = [];
    

    self.union = union;
    self.find = find;
    self.print = print;

    function init(n){
        for(var i = 0; i < self.size; i++){
            self.array[i] = i;
        }
    }
    init();

    function union(x, y){        
        var xParent = find(x);
        var yParent = find(y);

        if(xParent > -1 && yParent > -1){
            // both don't have rank
            self.array[xParent] = yParent;
            self.array[yParent] = -1;
        }else if(xParent < 0 && yParent < 0){
            // both have rank
            if(xParent < yParent){
                // x has higher rank
                self.array[xParent] -= 1;
                self.array[yParent] = yParent;
            }else{
                // y has higher rank
                self.array[yParent] -= 1;
                self.array[xParent] = yParent;
            }
        }else if(xParent < 0 && yParent > -1){
            // only x has rank
            self.array[yParent] = xParent;
            self.array[xParent] -= 1;
        }else if(xParent > -1 && yParent < 0){
            // only y has rank
            self.array[xParent] = yParent;
            self.array[yParent] -= 1;
        }
    }

    function find(x){
        var parent = self.array[x];

        if(x == self.array[x]){
            return x;
        }

        while(parent > -1){
            parent = self.array[parent];
        }

        return parent;
    }

    function print(){
        for(var i=0;i<self.array.length;i++){
            console.log(i + ' [' + self.array[i] + '] ');
        }
    }
}

var set = new DisjointSet(10);


set.union(2,3);


set.print();

set.union(2,3);


set.print();
