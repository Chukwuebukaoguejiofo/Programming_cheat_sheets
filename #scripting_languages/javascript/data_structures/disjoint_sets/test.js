// disjoint set


function DisjointSet(n){
	debugger;
	this.size = n;
	this.array = [0,1,2,3,4,5,6,7,8,9];
	

	this.union = union;
	this.find = find;

	// (function makeSets(){
	// 	for(var i = 0; i < this.size; i++){
	// 		this.array[i] = i;
	// 	}
	// })();

	function union(x, y){

		debugger;
		var xParent = find(x);
		var yParent = find(y);

		if(xParent > -1 && yParent > -1){
			// both don't have rank
			this.array[xParent] = yParent;
			this.array[yParent] = -1;
		}else if(xParent < 0 && yParent < 0){
			// both have rank
			if(xparent < yParent){
				// x has higher rank
				this.array[xParent] -= 1;
				this.array[yParent] = yParent;
			}else{
				// y has higher rank
				this.array[yParent] -= 1;
				this.array[xParent] = yParent;
			}
		}else if(xParent < 0 && yParent > -1){
			// only x has rank
			this.array[yParent] = xParent;
			this.array[xParent] -= 1;
		}else if(xParent > -1 && yParent < 0){
			// only y has rank
			this.array[xParent] = yParent;
			this.array[yParent] -= 1;
		}
	}

	function find(x){
		debugger;
		var parent = this.array[x];
		while(parent > -1){
			parent = this.array[parent];
		}

		return parent;
	}
}

var set = new DisjointSet(10);


set.union(2,3);
