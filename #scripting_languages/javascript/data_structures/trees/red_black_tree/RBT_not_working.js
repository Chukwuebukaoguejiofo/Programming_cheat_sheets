// this is a translation from Java

// ISSUES:  null.get()

function AtomicReference(){
    var val = null;
    this.get = function(){
        return val;
    }

    this.set = function(v){
        val = v;
    }
}

/**
 * Date 10/29/2015
 * @author Tushar Roy
 *
 * Red Black Tree
 *
 * Time complexity
 * Insert - O(logn)
 * Delete - O(logn)
 * Search - O(logn)
 *
 * Does not work for duplicates.
 *
 * References
 * http://pages.cs.wisc.edu/~skrentny/cs367-common/readings/Red-Black-Trees/
 * https://en.wikipedia.org/wiki/Red%E2%80%93black_tree
 */
function RedBlackTree(){
    var self = this;
    
    // public functions
    self.insert = insert;
    self.printRedBlackTree = printRedBlackTree;
    self._delete = _delete;
    self.validateRedBlackTree = validateRedBlackTree;


    var Color = {
        RED: 'RED',
        BLACK: 'BLACK'
    }

    function Node() {
        // this.data = undefined;
        // this.color = undefined;
        // this.left = undefined;
        // this.right = undefined;
        // this.parent = undefined;
        // this.isNullLeaf = false;
    }

    function createBlackNode(data) {
        var node = new Node();
        node.data = data;
        node.color = Color.BLACK;
        node.left = createNullLeafNode(node);
        node.right = createNullLeafNode(node);
        return node;
    }

    function createNullLeafNode(parent) {
        var leaf = new Node();
        leaf.color = Color.BLACK;
        leaf.isNullLeaf = true;
        leaf.parent = parent;
        return leaf;
    }

    function createRedNode(parent, data) {
        var node = new Node();
        node.data = data;
        node.color = Color.RED;
        node.parent = parent;
        node.left = createNullLeafNode(node);
        node.right = createNullLeafNode(node);
        return node;
    }

    /**
     * Main insert method of red black tree.
     */
    function insert(root, data) {
        return _insert(null, root, data);
    }

    /**
     * Main _delete method of red black tree.
     */
    function _delete(root, data) {
        var rootReference = new AtomicReference();
        _delete(root, data, rootReference);
        if(rootReference.get() == null) {
            return root;
        } else {
            return rootReference.get();
        }
    }

    /**
     * Main print method of red black tree.
     */
    function printRedBlackTree(root) {
        printRedBlackTree(root, 0);
    }

    /**
     * Main validate method of red black tree.
     */
    function validateRedBlackTree(root) {

        if(root == null) {
            return true;
        }
        //check if root is black
        if(root.color != Color.BLACK) {
            console.log("Root is not black");
            return false;
        }
        //Use of AtomicInteger solely because java does not provide any other mutable int wrapper.
        var blackCount = 0;
        //make sure black count is same on all path and there is no red red relationship
        return checkBlackNodesCount(root, blackCount, 0) && noRedRedParentChild(root, Color.BLACK);
    }

    function rightRotate(root, changeColor) {
        var parent = root.parent;
        root.parent = parent.parent;
        if(parent.parent != null) {
            if(parent.parent.right == parent) {
                parent.parent.right = root;
            } else {
                parent.parent.left = root;
            }
        }
        var right = root.right;
        root.right = parent;
        parent.parent = root;
        parent.left = right;
        if(right != null) {
            right.parent = parent;
        }
        if(changeColor) {
            root.color = Color.BLACK;
            parent.color = Color.RED;
        }
    }

    function leftRotate(root, changeColor) {
        var parent = root.parent;
        root.parent = parent.parent;
        if(parent.parent != null) {
            if(parent.parent.right == parent) {
                parent.parent.right = root;
            } else {
                parent.parent.left = root;
            }
        }
        var left = root.left;
        root.left = parent;
        parent.parent = root;
        parent.right = left;
        if(left != null) {
            left.parent = parent;
        }
        if(changeColor) {
            root.color = Color.BLACK;
            parent.color = Color.RED;
        }
    }

    function findSiblingNode(root) {
        var parent = root.parent;
        if(isLeftChild(root)) {
            return parent.right.isNullLeaf ? null : parent.right;
        } else {
            return parent.left.isNullLeaf ? null : parent.left;
        }
    }

    function isLeftChild(root) {
        var parent = root.parent;
        if(parent.left == root) {
            return true;
        } else {
            return false;
        }
    }

    function _insert(parent, root, data) {
        if(root  == null || root.isNullLeaf) {
            //if parent is not null means tree is not empty
            //so create a red leaf node
            if(parent != null) {
                return createRedNode(parent, data);
            } else { //otherwise create a black root node if tree is empty
                return createBlackNode(data);
            }
        }

        //duplicate insertion is not allowed for this tree.
        if(root.data == data) {
            throw "Duplicate data " + data;
            // console.log('Error: duplicate data: ' + data);
        }
        //if we go on left side then isLeft will be true
        //if we go on right side then isLeft will be false.
        var isLeft;
        if(root.data > data) {
            var left = _insert(root, root.left, data);
            //if left becomes root parent means rotation
            //happened at lower level. So just return left
            //so that nodes at upper level can set their
            //child correctly
            if(left == root.parent) {
                return left;
            }
            //set the left child returned to be left of root node
            root.left = left;
            //set isLeft to be true
            isLeft = true;
        } else {
            var right = _insert(root, root.right, data);
            //if right becomes root parent means rotation
            //happened at lower level. So just return right
            //so that nodes at upper level can set their
            //child correctly
            if(right == root.parent) {
                return right;
            }
            //set the right child returned to be right of root node
            root.right = right;
            //set isRight to be true
            isLeft = false;
        }

        if(isLeft) {
            //if we went to left side check to see Red-Red conflict
            //between root and its left child
            if(root.color == Color.RED && root.left.color == Color.RED) {
                //get the sibling of root. It is returning optional means
                //sibling could be empty
                var sibling = findSiblingNode(root);
                //if sibling is empty or of BLACK color
                if(sibling !== null || sibling.get().color == Color.BLACK) {
                    //check if root is left child of its parent
                    if(isLeftChild(root)) {
                        //this creates left left situation. So do one right rotate
                        rightRotate(root, true);
                    } else {
                        //this creates left-right situation so do one right rotate followed
                        //by left rotate

                        //do right rotation without change in color. So sending false.
                        //when right rotation is done root becomes right child of its left
                        //child. So make root = root.parent because its left child before rotation
                        //is new root of this subtree.
                        rightRotate(root.left, false);
                        //after rotation root should be root's parent
                        root = root.parent;
                        //then do left rotate with change of color
                        leftRotate(root, true);
                    }

                } else {
                    //we have sibling color as RED. So change color of root
                    //and its sibling to Black. And then change color of their
                    //parent to red if their parent is not a root.
                    root.color = Color.BLACK;
                    sibling.get().color = Color.BLACK;
                    //if parent's parent is not null means parent is not root.
                    //so change its color to RED.
                    if(root.parent.parent != null) {
                        root.parent.color = Color.RED;
                    }
                }
            }
        } else {
            //this is mirror case of above. So same comments as above.
            if(root.color == Color.RED && root.right.color == Color.RED) {
                var sibling = findSiblingNode(root);
                if(sibling !== null || sibling.get().color == Color.BLACK) {
                    if(!isLeftChild(root)) {
                        leftRotate(root, true);
                    } else {
                        leftRotate(root.right, false);
                        root = root.parent;
                        rightRotate(root, true);
                    }
                } else {
                    root.color = Color.BLACK;
                    sibling.get().color = Color.BLACK;
                    if(root.parent.parent != null) {
                        root.parent.color = Color.RED;
                    }
                }
            }
        }
        return root;
    }

    /**
     * Using atomicreference because java does not provide mutable wrapper. Its like
     * double pointer in C.
     */
    function _delete(root, data, rootReference) {
        if(root == null || root.isNullLeaf) {
            return;
        }
        if(root.data == data) {
            //if node to be _deleted has 0 or 1 null children then we have
            //_deleteOneChild use case as discussed in video.
            if(root.right.isNullLeaf || root.left.isNullLeaf) {
                _deleteOneChild(root, rootReference);
            } else {
                //otherwise look for the inorder successor in right subtree.
                //replace inorder successor data at root data.
                //then _delete inorder successor which should have 0 or 1 not null child.
                var inorderSuccessor = findSmallest(root.right);
                root.data = inorderSuccessor.data;
                _delete(root.right, inorderSuccessor.data, rootReference);
            }
        }
        //search for the node to be _deleted.
        if(root.data < data) {
            _delete(root.right, data, rootReference);
        } else {
            _delete(root.left, data, rootReference);
        }
    }

    function findSmallest(root) {
        var prev = null;
        while(root != null && !root.isNullLeaf) {
            prev = root;
            root = root.left;
        }
        return prev != null ? prev : root;
    }

    /**
     * Assumption that node to be _deleted has either 0 or 1 non leaf child
     */
    function _deleteOneChild(nodeToBeDelete, rootReference) {
        var child = nodeToBeDelete.right.isNullLeaf ? nodeToBeDelete.left : nodeToBeDelete.right;
        //replace node with either one not null child if it exists or null child.
        replaceNode(nodeToBeDelete, child, rootReference);
        //if the node to be _deleted is BLACK. See if it has one red child.
        if(nodeToBeDelete.color == Color.BLACK) {
            //if it has one red child then change color of that child to be Black.
            if(child.color == Color.RED) {
                child.color = Color.BLACK;
            } else {
                //otherwise we have double black situation.
                _deleteCase1(child, rootReference);
            }
        }
    }


    /**
     * If double black node becomes root then we are done. Turning it into
     * single black node just reduces one black in every path.
     */
    function _deleteCase1(doubleBlackNode, rootReference) {
        if(doubleBlackNode.parent == null) {
            rootReference.set(doubleBlackNode);
            return;
        }
        _deleteCase2(doubleBlackNode, rootReference);
    }

    /**
     * If sibling is red and parent and sibling's children are black then rotate it
     * so that sibling becomes black. Double black node is still double black so we need
     * further processing.
     */
    function _deleteCase2(doubleBlackNode, rootReference) {
        var siblingNode = findSiblingNode(doubleBlackNode).get();
        if(siblingNode.color == Color.RED) {
            if(isLeftChild(siblingNode)) {
                rightRotate(siblingNode, true);
            } else {
                leftRotate(siblingNode, true);
            }
            if(siblingNode.parent == null) {
                rootReference.set(siblingNode);
            }
        }
        _deleteCase3(doubleBlackNode, rootReference);
    }

    /**
     * If sibling, sibling's children and parent are all black then turn sibling into red.
     * This reduces black node for both the paths from parent. Now parent is new double black
     * node which needs further processing by going back to case1.
     */
    function _deleteCase3(doubleBlackNode, rootReference) {

        var siblingNode = findSiblingNode(doubleBlackNode).get();

        if(doubleBlackNode.parent.color == Color.BLACK && siblingNode.color == Color.BLACK && siblingNode.left.color == Color.BLACK
                && siblingNode.right.color == Color.BLACK) {
            siblingNode.color = Color.RED;
            _deleteCase1(doubleBlackNode.parent, rootReference);
        } else {
            _deleteCase4(doubleBlackNode, rootReference);
        }
    }

    /**
     * If sibling color is black, parent color is red and sibling's children color is black then swap color b/w sibling
     * and parent. This increases one black node on double black node path but does not affect black node count on
     * sibling path. We are done if we hit this situation.
     */
    function _deleteCase4(doubleBlackNode, rootReference) {
        var siblingNode = findSiblingNode(doubleBlackNode).get();
        if(doubleBlackNode.parent.color == Color.RED && siblingNode.color == Color.BLACK && siblingNode.left.color == Color.BLACK
        && siblingNode.right.color == Color.BLACK) {
            siblingNode.color = Color.RED;
            doubleBlackNode.parent.color = Color.BLACK;
            return;
        } else {
            _deleteCase5(doubleBlackNode, rootReference);
        }
    }

    /**
     * If sibling is black, double black node is left child of its parent, siblings right child is black
     * and sibling's left child is red then do a right rotation at siblings left child and swap colors.
     * This converts it to _delete case6. It will also have a mirror case.
     */
    function _deleteCase5(doubleBlackNode, rootReference) {
        var siblingNode = findSiblingNode(doubleBlackNode).get();
        if(siblingNode.color == Color.BLACK) {
            if (isLeftChild(doubleBlackNode) && siblingNode.right.color == Color.BLACK && siblingNode.left.color == Color.RED) {
                rightRotate(siblingNode.left, true);
            } else if (!isLeftChild(doubleBlackNode) && siblingNode.left.color == Color.BLACK && siblingNode.right.color == Color.RED) {
                leftRotate(siblingNode.right, true);
            }
        }
        _deleteCase6(doubleBlackNode, rootReference);
    }

    /**
     * If sibling is black, double black node is left child of its parent, sibling left child is black and sibling's right child is
     * red, sibling takes its parent color, parent color becomes black, sibling's right child becomes black and then do
     * left rotation at sibling without any further change in color. This removes double black and we are done. This
     * also has a mirror condition.
     */
    function _deleteCase6( doubleBlackNode, rootReference) {
        var siblingNode = findSiblingNode(doubleBlackNode).get();
        siblingNode.color = siblingNode.parent.color;
        siblingNode.parent.color = Color.BLACK;
        if(isLeftChild(doubleBlackNode)) {
            siblingNode.right.color = Color.BLACK;
            leftRotate(siblingNode, false);
        } else {
            siblingNode.left.color = Color.BLACK;
            rightRotate(siblingNode, false);
        }
        if(siblingNode.parent == null) {
            rootReference.set(siblingNode);
        }
    }

    function replaceNode(root, child, rootReference) {
        child.parent = root.parent;
        if(root.parent == null) {
            rootReference.set(child);
        }
        else {
            if(isLeftChild(root)) {
                root.parent.left = child;
            } else {
                root.parent.right = child;
            }
        }
    }

    function printRedBlackTree(root, space) {
        if(root == null || root.isNullLeaf) {
            return;
        }
        printRedBlackTree(root.right, space + 5);
        for(var i=0; i < space; i++) {
            console.log(" ");
        }
        console.log(root.data + " " + (root.color == Color.BLACK ? "B" : "R"));
        printRedBlackTree(root.left, space + 5);
    }

    function noRedRedParentChild(root, parentColor) {
        if(root == null) {
            return true;
        }
        if(root.color == Color.RED && parentColor == Color.RED) {
            return false;
        }

        return noRedRedParentChild(root.left, root.color) && noRedRedParentChild(root.right, root.color);
    }

    function checkBlackNodesCount(root, blackCount, currentCount) {

        if(root.color == Color.BLACK) {
            currentCount++;
        }

        if(root.left == null && root.right == null) {
            if(blackCount.get() == 0) {
                blackCount.set(currentCount);
                return true;
            } else {
                return currentCount == blackCount.get();
            }
        }
        return checkBlackNodesCount(root.left, blackCount, currentCount) && checkBlackNodesCount(root.right, blackCount, currentCount);
    }

    
}

//------------------------------------ usage

var root = null;
var redBlackTree = new RedBlackTree();

console.log(redBlackTree);

root = redBlackTree.insert(root, 10);
root = redBlackTree.insert(root, 15);
root = redBlackTree.insert(root, -10);
root = redBlackTree.insert(root, 20);
root = redBlackTree.insert(root, 30);
root = redBlackTree.insert(root, 40);
root = redBlackTree.insert(root, 50);
root = redBlackTree.insert(root, -15);
root = redBlackTree.insert(root, 25);
root = redBlackTree.insert(root, 17);
root = redBlackTree.insert(root, 21);
root = redBlackTree.insert(root, 24);
root = redBlackTree.insert(root, 28);
root = redBlackTree.insert(root, 34);
root = redBlackTree.insert(root, 32);
root = redBlackTree.insert(root, 26);
root = redBlackTree.insert(root, 35);
root = redBlackTree.insert(root, 19);
redBlackTree.printRedBlackTree(root);

// root = redBlackTree._delete(root, 50);
// console.log(redBlackTree.validateRedBlackTree(root));
// root = redBlackTree._delete(root, 40);
// console.log(redBlackTree.validateRedBlackTree(root));
// root = redBlackTree._delete(root, -10);
// console.log(redBlackTree.validateRedBlackTree(root));
// root = redBlackTree._delete(root, 15);
// console.log(redBlackTree.validateRedBlackTree(root));
// root = redBlackTree._delete(root, 17);
// console.log(redBlackTree.validateRedBlackTree(root));
// root = redBlackTree._delete(root, 24);
// console.log(redBlackTree.validateRedBlackTree(root));
// root = redBlackTree._delete(root, 21);
// console.log(redBlackTree.validateRedBlackTree(root));
// root = redBlackTree._delete(root, 32);
// console.log(redBlackTree.validateRedBlackTree(root));
// root = redBlackTree._delete(root, 26);
// console.log(redBlackTree.validateRedBlackTree(root));
// root = redBlackTree._delete(root, 19);
// console.log(redBlackTree.validateRedBlackTree(root));
// root = redBlackTree._delete(root, 25);
// console.log(redBlackTree.validateRedBlackTree(root));
// root = redBlackTree._delete(root, 17);
// console.log(redBlackTree.validateRedBlackTree(root));
// root = redBlackTree._delete(root, -15);
// console.log(redBlackTree.validateRedBlackTree(root));
// root = redBlackTree._delete(root, 20);
// console.log(redBlackTree.validateRedBlackTree(root));
// root = redBlackTree._delete(root, 35);
// console.log(redBlackTree.validateRedBlackTree(root));
// root = redBlackTree._delete(root, 34);
// console.log(redBlackTree.validateRedBlackTree(root));
// root = redBlackTree._delete(root, 30);
// console.log(redBlackTree.validateRedBlackTree(root));
// root = redBlackTree._delete(root, 28);
// console.log(redBlackTree.validateRedBlackTree(root));
// root = redBlackTree._delete(root, 10);
// console.log(redBlackTree.validateRedBlackTree(root));
