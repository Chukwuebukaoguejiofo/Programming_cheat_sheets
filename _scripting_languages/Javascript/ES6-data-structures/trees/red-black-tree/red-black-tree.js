// ES6 red-black tree

// reference:
// http://www.codebytes.in/2014/10/red-black-tree-java-implementation.html?m=1


/**
 * TODO:
 * - check if tests are correct
 * - create a CLI for user input
 * - make sure `nil` is FINAL
*/
class Node {
    constructor(){
        this.key = null;
        this.color = null;
        this.parent = null;
        this.left = null;
        this.right = null;
    }

    toString(){
        return `Node { key: ${this.key}, color: ${this.getColor()}, parent: ${this.hasParent()}, left: ${this.hasLeft()}, right: ${this.hasRight()} }`;
    }

    getColor(){
        return this.color == 0 ? 'RED' : 'BLACK';
    }

    hasParent(){
        if(this.parent){
            if(this.parent.key){
              return this.parent.key
            }
            return true;
        }

        return false;
    }

    hasLeft(){
        if(this.left){
            if(this.left.key){
              return this.left.key
            }
            return true;
        }

        return false;
    }

    hasRight(){
        if(this.right){
            if(this.right.key){
              return this.right.key
            }
            return true;
        }

        return false;
    }
}

class RBT {
    constructor(){
        this.RED = 0;
        this.BLACK = 1;
        this.nil = this.getEmptyNode();
        this.root = this.nil; // starts out as sentinel
    }

    /**
     * sentinel nodes are BLACK
     */
    getEmptyNode(){
        let node = new Node();
        node.key = -1;
        node.color = this.BLACK;
        return node;
    }

    /**
     * new nodes are RED
     */
    createNewNode(key){
        let node = this.getEmptyNode();
        node.key = key;
        node.color = this.RED;
        this.parent = this.nil;
        this.left = this.nil;
        this.right = this.nil;
        return node;
    }

    insert(key) {
        let node = this.createNewNode(key);
        let temp = this.root; // root will go down
        if (this.root == this.nil) {
            this.root = node;
            node.color = this.BLACK;
            node.parent = this.nil;
            node.left = this.nil;
            node.right = this.nil;
        } else {
            node.parent = this.nil;
            node.left = this.nil;
            node.right = this.nil;
            node.color = this.RED;
            while (true) {
                if (node.key < temp.key) {
                    if (temp.left == this.nil) {
                        temp.left = node;
                        node.parent = temp;
                        break;
                    } else {
                        temp = temp.left;
                    }
                } else if (node.key >= temp.key) {
                    if (temp.right == this.nil) {
                        temp.right = node;
                        node.parent = temp;
                        break;
                    } else {
                        temp = temp.right;
                    }
                }
            }
            this.fixTree(node);
        }
    }

    printTree(node) {
        if (node == this.nil) {
            return;
        }
        this.printTree(node.left);
        // console.log(((node.color==this.RED)?"Color: Red ":"Color: Black ")+"Key: "+node.key+" Parent: "+node.parent.key+"\n");
        console.log(node.toString());
        this.printTree(node.right);
    }

    /**
     * Takes as argument the newly inserted node
     */
    fixTree(node) {
        while (node.parent.color == this.RED) {
            let uncle = this.nil;
            if (node.parent == node.parent.parent.left) {
                uncle = node.parent.parent.right;

                if (uncle != this.nil && uncle.color == this.RED) {
                    node.parent.color = this.BLACK;
                    uncle.color = this.BLACK;
                    node.parent.parent.color = this.RED;
                    node = node.parent.parent;
                    continue;
                }
                if (node == node.parent.right) {
                    //Double rotation needed
                    node = node.parent;
                    this.rotateLeft(node);
                }
                node.parent.color = this.BLACK;
                node.parent.parent.color = this.RED;
                //if the "else if" code hasn't executed, this
                //is a case where we only need a single rotation
                this.rotateRight(node.parent.parent);
            } else {
                uncle = node.parent.parent.left;
                 if (uncle != this.nil && uncle.color == this.RED) {
                    node.parent.color = this.BLACK;
                    uncle.color = this.BLACK;
                    node.parent.parent.color = this.RED;
                    node = node.parent.parent;
                    continue;
                }
                if (node == node.parent.left) {
                    //Double rotation needed
                    node = node.parent;
                    this.rotateRight(node);
                }
                node.parent.color = this.BLACK;
                node.parent.parent.color = this.RED;
                //if the "else if" code hasn't executed, this
                //is a case where we only need a single rotation
                this.rotateLeft(node.parent.parent);
            }
        }
        this.root.color = this.BLACK;
    }

    rotateLeft(node) {
        if (node.parent != this.nil) {
            if (node == node.parent.left) {
                node.parent.left = node.right;
            } else {
                node.parent.right = node.right;
            }
            node.right.parent = node.parent;
            node.parent = node.right;
            if (node.right.left != this.nil) {
                node.right.left.parent = node;
            }
            node.right = node.right.left;
            node.parent.left = node;
        } else {//Need to rotate this.root
            let right = this.root.right;
            this.root.right = right.left;
            right.left.parent = this.root;
            this.root.parent = right;
            right.left = this.root;
            right.parent = this.nil;
            this.root = right;
        }
    }

    rotateRight(node) {
        if (node.parent != this.nil) {
            if (node == node.parent.left) {
                node.parent.left = node.left;
            } else {
                node.parent.right = node.left;
            }

            node.left.parent = node.parent;
            node.parent = node.left;
            if (node.left.right != this.nil) {
                node.left.right.parent = node;
            }
            node.left = node.left.right;
            node.parent.right = node;
        } else {//Need to rotate this.root
            let left = this.root.left;
            this.root.left = this.root.left.right;
            left.right.parent = this.root;
            this.root.parent = left;
            left.right = this.root;
            left.parent = this.nil;
            this.root = left;
        }
    }

    findNode(findNode, node) {
        if (this.root == this.nil) {
            return null;
        }

        if (findNode.key < node.key) {
            if (node.left != this.nil) {
                return this.findNode(findNode, node.left);
            }
        } else if (findNode.key > node.key) {
            if (node.right != this.nil) {
                return this.findNode(findNode, node.right);
            }
        } else if (findNode.key == node.key) {
            return node;
        }
        return null;
    }

    //Deletes whole tree
    deleteTree(){
        this.root = this.nil;
    }

    treeMinimum(subTreeRoot){
        while(subTreeRoot.left !== this.nil){
            subTreeRoot = subTreeRoot.left;
        }
        return subTreeRoot;
    }

    //
    // Deletion code
    //

    /**
     * This operation doesn't care about the new Node's connections
     * with previous node's left and right. The caller has to take care
     * of that.
     */
    transplant(target, with2){
          if(target.parent == this.nil){
              this.root = with2;
          }else if(target == target.parent.left){
              target.parent.left = with2;
          }else
              target.parent.right = with2;
          with2.parent = target.parent;
    }

    delete(z){
        if((z = this.findNode(z, this.root))==null)return false;
        let x;
        let y = z; // temporary reference y
        let y_original_color = y.color;

        if(z.left == this.nil){
            x = z.right;
            this.transplant(z, z.right);
        }else if(z.right == this.nil){
            x = z.left;
            this.transplant(z, z.left);
        }else{
            y = this.treeMinimum(z.right);
            y_original_color = y.color;
            x = y.right;
            if(y.parent == z)
                x.parent = y;
            else{
                this.transplant(y, y.right);
                y.right = z.right;
                y.right.parent = y;
            }
            this.transplant(z, y);
            y.left = z.left;
            y.left.parent = y;
            y.color = z.color;
        }
        if(y_original_color==this.BLACK)
            this.deleteFixup(x);
        return true;
    }

    deleteFixup(x){
        while(x!=this.root && x.color == this.BLACK){
            if(x == x.parent.left){
                let w = x.parent.right;
                if(w.color == this.RED){
                    w.color = this.BLACK;
                    x.parent.color = this.RED;
                    this.rotateLeft(x.parent);
                    w = x.parent.right;
                }
                if(w.left.color == this.BLACK && w.right.color == this.BLACK){
                    w.color = this.RED;
                    x = x.parent;
                    continue;
                }
                else if(w.right.color == this.BLACK){
                    w.left.color = this.BLACK;
                    w.color = this.RED;
                    this.rotateRight(w);
                    w = x.parent.right;
                }
                if(w.right.color == this.RED){
                    w.color = x.parent.color;
                    x.parent.color = this.BLACK;
                    w.right.color = this.BLACK;
                    this.rotateLeft(x.parent);
                    x = this.root;
                }
            }else{
                let w = x.parent.left;
                if(w.color == this.RED){
                    w.color = this.BLACK;
                    x.parent.color = this.RED;
                    this.rotateRight(x.parent);
                    w = x.parent.left;
                }
                if(w.right.color == this.BLACK && w.left.color == this.BLACK){
                    w.color = this.RED;
                    x = x.parent;
                    continue;
                }
                else if(w.left.color == this.BLACK){
                    w.right.color = this.BLACK;
                    w.color = this.RED;
                    this.rotateLeft(w);
                    w = x.parent.left;
                }
                if(w.left.color == this.RED){
                    w.color = x.parent.color;
                    x.parent.color = this.BLACK;
                    w.left.color = this.BLACK;
                    this.rotateRight(x.parent);
                    x = this.root;
                }
            }
        }
        x.color = this.BLACK;
    }


}


/**
 * Test helper
 */


assertTrue = (a, b, msg) => {
    let result = a == b;

    if(result){
        console.log("TEST[PASSED]:" + msg);
    } else {
        let err = `\n\n${msg}\n\nactual:   ${a}\nexpected: ${b}\n\n`
        throw new Error(err);
    }
}


/**
 * Tests
 */


let rbt = new RBT();


assertTrue(`
${rbt.root.toString()}
`, `
Node { key: -1, color: BLACK, parent: false, left: false, right: false }
`, "Empty tree")

rbt.insert(1)


assertTrue(`
${rbt.root.parent.toString()}
${rbt.root.toString()}
${rbt.root.left.toString()}
${rbt.root.right.toString()}
`, `
Node { key: -1, color: BLACK, parent: false, left: false, right: false }
Node { key: 1, color: BLACK, parent: -1, left: -1, right: -1 }
Node { key: -1, color: BLACK, parent: false, left: false, right: false }
Node { key: -1, color: BLACK, parent: false, left: false, right: false }
`, "Inserting 1")


rbt.insert(2)

// TODO: sentinel parent needs to point to root as child
assertTrue(`
${rbt.root.parent.toString()}
${rbt.root.toString()}
${rbt.root.left.toString()}
${rbt.root.right.toString()}
`, `
Node { key: -1, color: BLACK, parent: false, left: false, right: false }
Node { key: 1, color: BLACK, parent: -1, left: -1, right: 2 }
Node { key: -1, color: BLACK, parent: false, left: false, right: false }
Node { key: 2, color: RED, parent: 1, left: -1, right: -1 }
`, "Inserting 2")


rbt.insert(3)

// TODO: sentinel parent needs to point to root as child

// ISSUE: parent has another parent ???
assertTrue(`
${rbt.root.parent.toString()}
${rbt.root.toString()}
${rbt.root.left.toString()}
${rbt.root.right.toString()}
`, `
Node { key: -1, color: BLACK, parent: 1, left: false, right: false }
Node { key: 2, color: BLACK, parent: -1, left: 1, right: 3 }
Node { key: 1, color: RED, parent: 2, left: -1, right: -1 }
Node { key: 3, color: RED, parent: 2, left: -1, right: -1 }
`, "Inserting 3")





rbt.insert(4)

// TODO: sentinel parent needs to point to root as child
// ISSUE: parent has another parent ??? [CIRCULAR]
assertTrue(`
${rbt.root.parent.toString()}
${rbt.root.toString()}
${rbt.root.left.toString()}
${rbt.root.right.toString()}
${rbt.root.right.right.toString()}
${rbt.root.right.right.right.toString()}
${rbt.root.right.right.left.toString()}
`, `
Node { key: -1, color: BLACK, parent: 1, left: false, right: false }
Node { key: 2, color: BLACK, parent: -1, left: 1, right: 3 }
Node { key: 1, color: BLACK, parent: 2, left: -1, right: -1 }
Node { key: 3, color: BLACK, parent: 2, left: -1, right: 4 }
Node { key: 4, color: RED, parent: 3, left: -1, right: -1 }
Node { key: -1, color: BLACK, parent: 1, left: false, right: false }
Node { key: -1, color: BLACK, parent: 1, left: false, right: false }
`, "Inserting 4")


const doSuffleArray = (count) => {
    // shuffle array
    for (var a=[],i=0;i<count;++i) a[i]=i + 10;
    // http://stackoverflow.com/questions/962802#962890
    function shuffle(array) {
      var tmp, current, top = array.length;
      if(top) while(--top) {
        current = Math.floor(Math.random() * (top + 1));
        tmp = array[current];
        array[current] = array[top];
        array[top] = tmp;
      }
      return array;
    }

    return shuffle(a);
};


//
// Add shuffled inputs
//

shuffledArray = doSuffleArray(20);
console.log("\n\nINPUTS:");
console.log(shuffledArray);
console.log("\n\n");
shuffledArray.forEach(n => rbt.insert(n));
rbt.printTree(rbt.root)




//
// Find a node:
//
foundNode = rbt.findNode(rbt.createNewNode(4), rbt.root)
console.log("\n\nfoundNode: " + foundNode.toString());


//
// treeMinimum
//

treeMinimumNode = rbt.treeMinimum(rbt.root.right.right)
console.log("\n\ntreeMinimumNode: " + treeMinimumNode.toString());


//
// Delete node
//

console.log("Delete node 15:");
wasDeleted = rbt.delete(rbt.createNewNode(15))
rbt.printTree(rbt.root)

//
// delete tree
//

rbt.deleteTree();
rbt.printTree(rbt.root)



