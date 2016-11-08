// http://www.codebytes.in/2014/10/red-black-tree-java-implementation.html

var RED = 0;
var BLACK = 1;

/**
 * var nil = new Node(-1); 
 */
function Node(key){
    this.color = BLACK;
    this.left = nil, 
    this.right = nil, 
    this.parent = nil;
    this.key = key;
}

/**
 * var nil = new Node(-1); 
 */
function NilNode(key){
    return new Node(-1);
}

var nil = new NilNode(-1); 


/**
 *
 */
function RedBlackTree(){

   var self = this;

   self.printTree = printTree;
   self.findNode = findNode;
   self.insert = insert;
   self.fixTree = fixTree;
   self.rotateLeft = rotateLeft;
   self.rotateRight = rotateRight;
   self._deleteTree = _deleteTree;
   self.transplant = transplant;
   self._delete = _delete;
   self._deleteFixup = _deleteFixup;
   self.treeMinimum = treeMinimum;
   self.getRoot = getRoot;

   self.print = print;


   //      

    
    var root = nil;

    function getRoot(){
        return root;
    }

    function print(){
        self.printTree(rbt.getRoot());
    }

    function printTree(node) {
        if (node == nil) {
            return;
        }
        printTree(node.left);
        console.log(((node.color==RED)?"Color: Red ":"Color: Black ")+"Key: "+node.key+" Parent: "+node.parent.key+"\n");
        printTree(node.right);
    }

    function findNode(nodeToFind, node) {
        if (root == nil) {
            return null;
        }

        if (nodeToFind.key < node.key) {
            if (node.left != nil) {
                return findNode(nodeToFind, node.left);
            }
        } else if (nodeToFind.key > node.key) {
            if (node.right != nil) {
                return findNode(nodeToFind, node.right);
            }
        } else if (nodeToFind.key == node.key) {
            return node;
        }
        return null;
    }

    function insert(value) {
        node = new Node(value);

        temp = root;
        if (root == nil) {
            root = node;
            node.color = BLACK;
            node.parent = nil;
        } else {
            node.color = RED;
            while (true) {
                if (node.key < temp.key) {
                    if (temp.left == nil) {
                        temp.left = node;
                        node.parent = temp;
                        break;
                    } else {
                        temp = temp.left;
                    }
                } else if (node.key >= temp.key) {
                    if (temp.right == nil) {
                        temp.right = node;
                        node.parent = temp;
                        break;
                    } else {
                        temp = temp.right;
                    }
                }
            }
            fixTree(node);
        }
    }

    //Takes as argument the newly inserted node
    function fixTree(node) {
        while (node.parent.color == RED) {
            uncle = nil;
            if (node.parent == node.parent.parent.left) {
                uncle = node.parent.parent.right;

                if (uncle != nil && uncle.color == RED) {
                    node.parent.color = BLACK;
                    uncle.color = BLACK;
                    node.parent.parent.color = RED;
                    node = node.parent.parent;
                    continue;
                } 
                if (node == node.parent.right) {
                    //Double rotation needed
                    node = node.parent;
                    rotateLeft(node);
                } 
                node.parent.color = BLACK;
                node.parent.parent.color = RED;
                //if the "else if" code hasn't executed, this
                //is a case where we only need a single rotation 
                rotateRight(node.parent.parent);
            } else {
                uncle = node.parent.parent.left;
                 if (uncle != nil && uncle.color == RED) {
                    node.parent.color = BLACK;
                    uncle.color = BLACK;
                    node.parent.parent.color = RED;
                    node = node.parent.parent;
                    continue;
                }
                if (node == node.parent.left) {
                    //Double rotation needed
                    node = node.parent;
                    rotateRight(node);
                }
                node.parent.color = BLACK;
                node.parent.parent.color = RED;
                //if the "else if" code hasn't executed, this
                //is a case where we only need a single rotation
                rotateLeft(node.parent.parent);
            }
        }
        root.color = BLACK;
    }

    function rotateLeft(node) {
        if (node.parent != nil) {
            if (node == node.parent.left) {
                node.parent.left = node.right;
            } else {
                node.parent.right = node.right;
            }
            node.right.parent = node.parent;
            node.parent = node.right;
            if (node.right.left != nil) {
                node.right.left.parent = node;
            }
            node.right = node.right.left;
            node.parent.left = node;
        } else {//Need to rotate root
            right = root.right;
            root.right = right.left;
            right.left.parent = root;
            root.parent = right;
            right.left = root;
            right.parent = nil;
            root = right;
        }
    }

    function rotateRight(node) {
        if (node.parent != nil) {
            if (node == node.parent.left) {
                node.parent.left = node.left;
            } else {
                node.parent.right = node.left;
            }

            node.left.parent = node.parent;
            node.parent = node.left;
            if (node.left.right != nil) {
                node.left.right.parent = node;
            }
            node.left = node.left.right;
            node.parent.right = node;
        } else {//Need to rotate root
            left = root.left;
            root.left = root.left.right;
            left.right.parent = root;
            root.parent = left;
            left.right = root;
            left.parent = nil;
            root = left;
        }
    }

    //Deletes whole tree
    function _deleteTree(){ 
        root = nil;
    }
    
    //Deletion Code .
    
    //This operation doesn't care about the new Node's connections
    //with previous node's left and right. The caller has to take care
    //of that.
    function transplant(target, _with){ 
          if(target.parent == nil){
              root = _with;
          }else if(target == target.parent.left){
              target.parent.left = _with;
          }else
              target.parent.right = _with;
          _with.parent = target.parent;
    }
    
    function _delete(value){

        z = new Node(value)


        if((z = findNode(z, root))==null)return false;
        var x;
        var y = z; // temporary reference y
        var y_original_color = y.color;
        
        if(z.left == nil){
            x = z.right;  
            transplant(z, z.right);  
        }else if(z.right == nil){
            x = z.left;
            transplant(z, z.left); 
        }else{
            y = treeMinimum(z.right);
            y_original_color = y.color;
            x = y.right;
            if(y.parent == z)
                x.parent = y;
            else{
                transplant(y, y.right);
                y.right = z.right;
                y.right.parent = y;
            }
            transplant(z, y);
            y.left = z.left;
            y.left.parent = y;
            y.color = z.color; 
        }
        if(y_original_color==BLACK)
            _deleteFixup(x);  
        return true;
    }
    
    function _deleteFixup(x){  
        while(x!=root && x.color == BLACK){ 
            if(x == x.parent.left){
                w = x.parent.right;
                if(w.color == RED){
                    w.color = BLACK;
                    x.parent.color = RED;
                    rotateLeft(x.parent);
                    w = x.parent.right;
                }
                if(w.left.color == BLACK && w.right.color == BLACK){
                    w.color = RED;
                    x = x.parent;
                    continue;
                }
                else if(w.right.color == BLACK){
                    w.left.color = BLACK;
                    w.color = RED;
                    rotateRight(w);
                    w = x.parent.right;
                }
                if(w.right.color == RED){
                    w.color = x.parent.color;
                    x.parent.color = BLACK;
                    w.right.color = BLACK;
                    rotateLeft(x.parent);
                    x = root;
                }
            }else{
                w = x.parent.left;
                if(w.color == RED){
                    w.color = BLACK;
                    x.parent.color = RED;
                    rotateRight(x.parent);
                    w = x.parent.left;
                }
                if(w.right.color == BLACK && w.left.color == BLACK){
                    w.color = RED;
                    x = x.parent;
                    continue;
                }
                else if(w.left.color == BLACK){
                    w.right.color = BLACK;
                    w.color = RED;
                    rotateLeft(w);
                    w = x.parent.left;
                }
                if(w.left.color == RED){
                    w.color = x.parent.color;
                    x.parent.color = BLACK;
                    w.left.color = BLACK;
                    rotateRight(x.parent);
                    x = root;
                }
            }
        }
        x.color = BLACK; 
    }
    
    function treeMinimum(subTreeRoot){  
        while(subTreeRoot.left!=nil){
            subTreeRoot = subTreeRoot.left;
        }
        return subTreeRoot;
    }
    
    // function consoleUI() {
    //     Scanner scan = new Scanner(System.in);
    //     while (true) {
    //         console.log("\n1.- Add items\n"
    //                 + "2.- Delete items\n"
    //                 + "3.- Check items\n"
    //                 + "4.- Printtree\n"
    //                 + "5.- Delete tree\n");
    //         choice = scan.nextInt();

    //         item;
    //         node;
    //         switch (choice) {
    //             case 1:
    //                 item = scan.nextInt();
    //                 while (item != -999) {
    //                     node = new Node(item);
    //                     insert(node);
    //                     item = scan.nextInt();
    //                 }
    //                 printTree(root);
    //                 break;
    //             case 2:
    //                 item = scan.nextInt();
    //                 while (item != -999) {
    //                     node = new Node(item);
    //                     console.log("\nDeleting item " + item);
    //                     if (_delete(node)) {
    //                         console.log(": _deleted!");
    //                     } else {
    //                         console.log(": does not exist!");
    //                     }
    //                     item = scan.nextInt();
    //                 }
    //                 console.log();
    //                 printTree(root);
    //                 break;
    //             case 3:
    //                 item = scan.nextInt();
    //                 while (item != -999) {
    //                     node = new Node(item);
    //                     console.log((findNode(node, root) != null) ? "found" : "not found");
    //                     item = scan.nextInt();
    //                 }
    //                 break;
    //             case 4:
    //                 printTree(root);
    //                 break;
    //             case 5:
    //                 _deleteTree();
    //                 console.log("Tree _deleted!");
    //                 break;
    //         }
    //     }
    // }
    // public static function main(String[] args) {
    //     RedBlackTree rbt = new RedBlackTree();
    //     rbt.consoleUI();
    // }
}

// usage


var rbt = new RedBlackTree();

rbt.insert(7);
rbt.insert(5);
rbt.insert(6);
rbt.insert(10);
rbt.insert(9);
rbt.insert(2);
rbt.insert(3);
rbt.insert(1);
rbt.insert(8);
rbt.insert(4);
rbt.print(); // (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)


/* OUTPUT: 
Color: Black Key: 1 Parent: 2
Color: Black Key: 2 Parent: 4
Color: Black Key: 3 Parent: 2
Color: Black Key: 4 Parent: -1
Color: Black Key: 5 Parent: 6
Color: Black Key: 6 Parent: 4
Color: Black Key: 7 Parent: 8
Color: Red Key: 8 Parent: 6
Color: Black Key: 9 Parent: 8
Color: Red Key: 10 Parent: 9
*/


rbt._delete(1) // true
rbt._delete(10) // true
rbt.print(); // (2, 3, 4, 5, 6, 7, 8, 9)


/* OUTPUT: 
Color: Black Key: 2 Parent: 3
Color: Red Key: 3 Parent: 6
Color: Red Key: 4 Parent: 5
Color: Black Key: 5 Parent: 3
Color: Black Key: 6 Parent: -1
Color: Black Key: 7 Parent: 8
Color: Red Key: 8 Parent: 6
Color: Black Key: 9 Parent: 8
*/
