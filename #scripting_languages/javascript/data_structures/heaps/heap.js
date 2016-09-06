// heap data structure

function Heap(){
	var self = this;

	self.size = 0;
	self.array = [];
	self.parentIndex = parentIndex;
	self.rightChildIndex = rightChildIndex;
	self.leftChildIndex = leftChildIndex;
	self.isLeaf = isLeaf;
	self.isIndexInBounds = isIndexInBounds;
	self.siftUp = siftUp;
	self.siftDown = siftDown;
	self.push = push;
	self.pop = pop;
	self.peek = peek;

	function parentIndex(i){
		return Math.floor((i - 1) / 2);
	}

	function rightChildIndex(i){
		return i * 2 + 2;
	}

	function leftChildIndex(i){
		return i * 2 + 1;
	}

	function isLeaf(i){
		return i >= (Math.floor(self.size / 2));
	}

	function isIndexInBounds(i){
		return 0 <= i && i <= self.size;
	}

	function siftUp(i){
		pIndex = self.parentIndex(i);

		if( self.isIndexInBounds(pIndex) && self.array[i] < self.array[pIndex] ){
			// swap
			var temp = self.array[i];
			self.array[i] = self.array[pIndex];
			self.array[pIndex] = temp;

			self.siftUp(pIndex);
		} 
	}

	function siftDown(i){

		if(self.isLeaf(i)){
			return;
		}

		rightChildIndex = self.rightChildIndex(i);
		leftChildIndex = self.leftChildIndex(i);

		if( self.isIndexInBounds(rightChildIndex) ){
			if(self.array[leftChildIndex] < self.array[rightChildIndex]){
				if(self.array[leftChildIndex] < self.array[i]){
					// swap
					var temp = self.array[leftChildIndex];
					self.array[leftChildIndex] = self.array[i];
					self.array[i] = temp;

					self.siftDown(leftChildIndex);
				}
			}else{ // right child value is smaller
				if(self.array[rightChildIndex] < self.array[i]){
					// swap
					var temp = self.array[rightChildIndex];
					self.array[rightChildIndex] = self.array[i];
					self.array[i] = temp;

					self.siftDown(rightChildIndex);
				}
			}
		}

		if( self.isIndexInBounds(leftChildIndex) ){
			if(self.array[leftChildIndex] < self.array[i]){
				// swap
				var temp = self.array[leftChildIndex];
				self.array[leftChildIndex] = self.array[i];
				self.array[i] = temp;

				self.siftDown(leftChildIndex);
			}
		}
	}

	function push(data){
		// add to last index, siftUp

		var nextIndex = self.size;
		self.array[nextIndex] = data;

		self.siftUp(self.size);

		self.size++;

	}

	function pop(){
		// swap first and last, size--, siftDown top, return the pop

		if(self.size == 0){
			return;
		}

		var firstVal = self.array[0];
		var lastIndex = self.size - 1;

		// swap
		var temp = self.array[0];
		self.array[0] = self.array[lastIndex];
		self.array[lastIndex] = temp;

		self.array.pop();

		self.siftDown(0);

		self.size--;

		return firstVal;
	}
	
	function peek(){
		return self.array[0];
	}
}

var heap = new Heap();

heap.push(3);
heap.push(4);
heap.push(7);

heap.pop(); // 3
heap.pop(); // 4
heap.pop(); // 7
heap.pop(); // undefined
