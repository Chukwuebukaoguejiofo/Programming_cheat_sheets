// STATUS: I created this myself, after understanding the concept a little bit
//         we dont have the delete logic yet

/*
==================================================================================
============================== WARNING: NEEDS TESTING ============================
==================================================================================
*/


/*
 RBT 

4 scenarios:

Z is root -- color B 
z.U is R -- recolor (P, GP, U), and check GP for violations
z.U B (triangle) -- rotate z.P , check child for violations??? in the direction it was rotated ???
z.U B (line) -- rotate  z.GP (to the opposite direction of Z) , and recolor original P and GP  


new nodes are RED 

violation: consecutive RED nodes  

=================================

p = n.p
g = n.p.p
isPR = (p == g.r) ? true : false
u = isPR ? g.l : g.r
isNR = (n == p.r) ? true : false
isGPR = (GP == GP.p.r) ? true : false

if(isPR && isNR) // RR 
if(!isPR && !isNR) // LL 
if(isPR && !isNR) // RL 
if(!isPR && isNR) // LR 

if(isPR){
  if(isNR){
    // RR
    leftRotate(GP)
  }else{
    // RL
    rightRotate(P)
    leftRotate(GP);
  }
}else{
  if(isNR){
    // LR
    leftRotate(P)
    rightRotate(GP);
  }else{
    // LL
    rightRotate(GP)
  }
}

=================================
*/


/**
 * NOTES:
 *
 * - rotate only on black uncle?
 * - on red uncle - only recolor?
 * - need to check if I am coloring correctly
 * - remember to update the root pointer and set it to black
 */

class Node{
    int RED = 1;
    int BLACK = 0;
    int color;
    int key;
    Node parent, left, right;
    Node(int key, int color){
        this.key = key;
        this.color = color;
    }

    @Override
    public String toString(){
        //return "k:"+key;

        /**
         * Node{key=1, color=BLACK, parent=3, left=-1, right=2}
         */
        String format = "Node{key=%s, color=%s, parent=%s, left=%s, right=%s}";
        String colorString =  ((color == RED)?"RED":"BLACK");
        int parentKey = (parent == null) ? -1 : parent.key;
        int leftKey = (left == null) ? -1 : left.key;
        int rightKey = (right == null) ? -1 : right.key;

        return String.format(
                format,
                key,
                colorString,
                parentKey,
                leftKey,
                rightKey
        );
    }
}

class RBT{
    Node root;
    int RED = 1;
    int BLACK = 0;

    Node nullNode = new Node(-1, BLACK);

    void insert(int key){
        Node nn = new Node(key, RED);
        nn.left = nullNode;
        nn.right = nullNode;

        if(root == null){
            root = nn;
            nn.color = BLACK;
            return;
        }

        // ...normal BST insertion algorithm here...
        Node c = root;
        Node leaf = null;

        while(c != nullNode){ // c != null WILL NOT WORK, because we still have nullNodes right? :)
            leaf = c;

            if (key > c.key)
                c = c.right;
            else if (key < c.key)
                c = c.left;
            else
                return; // no dups
        }

        if (key > leaf.key)
            leaf.right = nn;
        if (key < leaf.key)
            leaf.left = nn;

        nn.parent = leaf; // attach parent to new node!


        insertFix(nn);
    }

    void insertFix(Node c){
        while(c.parent != null && c.parent.color == RED){ // main source of violation: RED->RED
            Node p = c.parent;
            Node g = c.parent.parent;
            boolean isPR = (p == g.right) ? true : false;
            Node u = isPR ? g.left : g.right;
            boolean isNR = (c == p.right) ? true : false;
            //boolean isGPR = (g == g.parent.right) ? true : false;
            boolean isUR = c.color == RED;

            if (isUR) { // re-color u, p, g
                g.color = RED;
                p.color = BLACK;
                u.color = BLACK;
                c = g; // should be inside a while?  <<<===================
                continue; // does this stop everything and go back to the top of the while loop? test it out
            }

            if (!isUR) { // rotate, re-color p, g
                g.color = RED;
                p.color = BLACK;

                // rotate only if uncle is black ???

                if(isPR && isNR){ // RR
                    leftRotate(g);
                    return;
                }
                if(!isPR && !isNR){ // LL
                    rightRotate(g);
                    return;
                }
                if(isPR && !isNR){ // RL
                    rightRotate(p);
                    leftRotate(g);
                    return;
                }
                if(!isPR && isNR){ // LR
                    leftRotate(p);
                    rightRotate(g);
                    return;
                }
            }
        }

        if (c == root){ // while going up the tree, we may encounter the root, so we need to prevent errors like roo.parent or root.parent.parent :)
            root.color = BLACK;
            return;
        }
    }

    Node leftRotate(Node a){
        Node x = a.parent;

        Node b = a.right;
        Node c = b.left;

        b.left = a;
        a.right = c;

        c.parent = a;
        a.parent = b;
        b.parent = x;

        return b;
    }

    Node rightRotate(Node a){
        Node x = a.parent;

        Node b = a.left;
        Node c = b.right;

        b.right = a;
        a.left = c;

        c.parent = a;
        a.parent = b;
        b.parent = x;

        return b;
    }

    void inOrder(Node c){
        if (c == nullNode) return; // no left  // c == null WILL NOT WORK, we are checking for nullNode right? :)
        inOrder(c.left);
        System.out.println(c);
        inOrder(c.right);
    }
}

class Main3 {
    public static void main(String[] args) {
        RBT t = new RBT();

        t.insert(3);
        t.insert(6);
        t.insert(4);
        t.insert(8);
        t.insert(1);
        t.insert(5);
        t.insert(9);
        t.insert(2);
        t.insert(7);

        t.inOrder(t.root);
    }
}

/* OUTPUT:

                   3B
              /         \
           1B             6B
         /    \         /     \
               2R      4B        8B
              /  \    / \      /   \
                        5R    7R     9R
                        / \  / \    / \


Node{key=1, color=BLACK, parent=3, left=-1, right=2}
Node{key=2, color=RED, parent=1, left=-1, right=-1}
Node{key=3, color=BLACK, parent=-1, left=1, right=6}
Node{key=4, color=BLACK, parent=6, left=-1, right=5}
Node{key=5, color=RED, parent=4, left=-1, right=-1}
Node{key=6, color=BLACK, parent=3, left=4, right=8}
Node{key=7, color=RED, parent=8, left=-1, right=-1}
Node{key=8, color=BLACK, parent=6, left=7, right=9}
Node{key=9, color=RED, parent=8, left=-1, right=-1}

*/
