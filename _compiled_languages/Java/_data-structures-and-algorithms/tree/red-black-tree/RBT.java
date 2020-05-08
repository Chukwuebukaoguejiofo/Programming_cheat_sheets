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


import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * NOTES:
 * - ISSUE: not updating parent-child pointers while having double-rotation cases
 * - remember to update the root pointer and set it to black <-------
 * - remember to update parent pointers <-----
 * - update output
 * - rotate only on black uncle?
 * - on red uncle - only recolor?
 * - need to check if I am coloring correctly
 */

enum Color { RED, BLACK }

class Node{
    int key;
    Color color;
    Node parent, left, right;

    Node(int key, Color color){
        this.key = key;
        this.color = color;
    }

    @Override
    public String toString(){
        /**
         * Node{key=1, color=BLACK, parent=3, left=-1, right=2}
         */
        String format = "Node{key=%s, color=%s, parent=%s, left=%s, right=%s}";
        String colorString =  color == Color.RED ? "RED" : "BLACK";
        int parentKey = parent == null ? -1 : parent.key;
        int leftKey = left == null ? -1 : left.key;
        int rightKey = right == null ? -1 : right.key;
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
    Node nullNode = new Node(-1, Color.BLACK);

    void insert(int key){
        Node nn = new Node(key, Color.RED);
        nn.left = nullNode;
        nn.right = nullNode;

        if(root == null){
            root = nn;
            nn.color = Color.BLACK;
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
        while(c.parent != null && c.parent.color == Color.RED){ // main source of violation: RED->RED
            Node p = c.parent;
            Node g = c.parent.parent;
            boolean isPR = p == g.right;
            Node u = isPR ? g.left : g.right;
            boolean isNR = c == p.right;
            //boolean isGPR = (g == g.parent.right) ? true : false;
            boolean isUR = u.color == Color.RED;

            /**
             * Uncle is RED (re-color u, p, g)
             */
            if (isUR) {
                g.color = Color.RED;
                p.color = Color.BLACK;
                u.color = Color.BLACK;
                c = g;
                continue; // stops everything and goes back to the top of the while loop
            }

            /**
             * Uncle is BLACK (rotate, re-color p, g)
             */

            g.color = Color.RED;
            p.color = Color.BLACK;

            if(isPR && isNR){ // RR
                leftRotate(g);
                break; // we still need to assign the root?
            }
            if(!isPR && !isNR){ // LL
                rightRotate(g);
                break; // we still need to assign the root?
            }
            if(isPR && !isNR){ // RL
                rightRotate(p); // TODO: check if parent-child pointers are updated
                leftRotate(g);
                break; // we still need to assign the root?
            }
            if(!isPR && isNR){ // LR
                leftRotate(p); // TODO: check if parent-child pointers are updated
                rightRotate(g);
                break; // we still need to assign the root?
            }
        }

        if (c == root){ // while going up the tree, we may encounter the root, so we need to prevent errors like roo.parent or root.parent.parent :)
            root.color = Color.BLACK;
            return;
        }

        if (c.parent != null){
            if (c == c.parent.right && c.parent.left == root){
                // c is right child
                root = c.parent;
                root.color = Color.BLACK;
                return;
            }

            if (c == c.parent.left && c.parent.right == root){
                // c is left child
                root = c.parent;
                root.color = Color.BLACK;
                return;
            }
        }else{
            // c.parent IS NULL, meaning SHOULD BE ROOT, but either its left or right child is set to ROOT
            // lets update to the TRUE ROOT!
            root = c;
            root.color = Color.BLACK;
        }
    }

    Node leftRotate(Node a){
        Node x = a.parent;

        int xStatus = 0;
        if (x != null)
            if (x.right == a) xStatus = 1; // x has right child
            else xStatus = -1; // x has left child

        //DEBUG:
        if (x == null) System.out.println("INFO_002");

        Node b = a.right;
        Node c = b.left;

        b.left = a;
        a.right = c;

        c.parent = a;
        a.parent = b;
        b.parent = x;

        if (x != null)
            if (xStatus == 1) x.right = b;
            else x.left = b; // -1

        return b;
    }

    Node rightRotate(Node a){
        Node x = a.parent;

        int xStatus = 0;
        if (x != null)
            if (x.right == a) xStatus = 1; // x has right child
            else xStatus = -1; // x has left child

        //DEBUG:
        if (x == null) System.out.println("INFO_001");

        Node b = a.left;
        Node c = b.right;

        b.right = a;
        a.left = c;

        c.parent = a;
        a.parent = b;
        b.parent = x;

        if (x != null)
            if (xStatus == 1) x.right = b;
            else x.left = b; // -1

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

        //
        //================================================================== TESTING 1,2,3,4,5,6 case:
        //

//        String res, treeState;
//
//        //============== insert 1
//        t.insert(1);
//        res = String.format("%s", t.root);
//        treeState = "Node{key=1, color=BLACK, parent=-1, left=-1, right=-1}";
//        System.out.println("PASS? " + res.equals(treeState) );
//
//
//        //============== insert 2
//        t.insert(2);
//        res = String.format("%s\n%s\n", t.root, t.root.right);
//        treeState =
//                "Node{key=1, color=BLACK, parent=-1, left=-1, right=2}\n" +
//                        "Node{key=2, color=RED, parent=1, left=-1, right=-1}\n";
//        System.out.println("PASS? " + res.equals(treeState) );
//
//
//        //============== insert 3
//        t.insert(3);
//        res = String.format("%s\n%s\n%s\n", t.root.left, t.root, t.root.right);
//        treeState =
//                "Node{key=1, color=RED, parent=2, left=-1, right=-1}\n" +
//                        "Node{key=2, color=BLACK, parent=-1, left=1, right=3}\n" +
//                        "Node{key=3, color=RED, parent=2, left=-1, right=-1}\n";
//        System.out.println("PASS? " + res.equals(treeState) );
//
//
//        //============== insert 4
//        t.insert(4);
//        res = String.format("%s\n%s\n%s\n%s\n", t.root.left, t.root, t.root.right, t.root.right.right);
//        treeState =
//                "Node{key=1, color=BLACK, parent=2, left=-1, right=-1}\n" +
//                        "Node{key=2, color=BLACK, parent=-1, left=1, right=3}\n" +
//                        "Node{key=3, color=BLACK, parent=2, left=-1, right=4}\n" +
//                        "Node{key=4, color=RED, parent=3, left=-1, right=-1}\n";
//        System.out.println("PASS? " + res.equals(treeState) );
//
//
//        //============== insert 5
//        t.insert(5);
//        res = String.format("%s\n%s\n%s\n%s\n%s\n", t.root.left, t.root, t.root.right, t.root.right.left, t.root.right.right);
//        treeState =
//                "Node{key=1, color=BLACK, parent=2, left=-1, right=-1}\n" +
//                        "Node{key=2, color=BLACK, parent=-1, left=1, right=4}\n" +
//                        "Node{key=4, color=BLACK, parent=2, left=3, right=5}\n" +
//                        "Node{key=3, color=RED, parent=4, left=-1, right=-1}\n" +
//                        "Node{key=5, color=RED, parent=4, left=-1, right=-1}\n";
//        System.out.println("PASS? " + res.equals(treeState) );
//
//
//        //============== insert 6
//        t.insert(6);
//        res = String.format("%s\n%s\n%s\n%s\n%s\n%s\n", t.root.left, t.root, t.root.right, t.root.right.left, t.root.right.right, t.root.right.right.right);
//        treeState =
//                "Node{key=1, color=BLACK, parent=2, left=-1, right=-1}\n" +
//                        "Node{key=2, color=BLACK, parent=-1, left=1, right=4}\n" +
//                        "Node{key=4, color=RED, parent=2, left=3, right=5}\n" +
//                        "Node{key=3, color=BLACK, parent=4, left=-1, right=-1}\n" +
//                        "Node{key=5, color=BLACK, parent=4, left=-1, right=6}\n" +
//                        "Node{key=6, color=RED, parent=5, left=-1, right=-1}\n";
//        System.out.println("PASS? " + res.equals(treeState) );
//
//
//        //System.out.println(res);
//
//
//
//        // adding extra random items:
//        Integer[] intArray = { 7,8,9,10,11,12,13,14,15,16,17,18,19,20,21};
//        List<Integer> intList = Arrays.asList(intArray);
//        Collections.shuffle(intList);
//        intList.forEach(t::insert);
//
//        t.inOrder(t.root);


        //================================================================== TESTING RL case:
        //

//        String res, treeState;
//
//        //============== insert 10
//        t.insert(10);
//        res = String.format("%s", t.root);
//        treeState = "Node{key=10, color=BLACK, parent=-1, left=-1, right=-1}";
//        System.out.println("PASS? " + res.equals(treeState) );
//
//
//        //============== insert 20
//        t.insert(20);
//        res = String.format("%s\n%s\n", t.root, t.root.right);
//        treeState =
//                "Node{key=10, color=BLACK, parent=-1, left=-1, right=20}\n" +
//                        "Node{key=20, color=RED, parent=10, left=-1, right=-1}\n";
//        System.out.println("PASS? " + res.equals(treeState) );
//
//
//        //============== insert 15
//        t.insert(15);
//        res = String.format("%s\n%s\n%s\n", t.root.left, t.root, t.root.right);
//        treeState =
//                "Node{key=10, color=RED, parent=15, left=-1, right=-1}\n" +
//                        "Node{key=15, color=BLACK, parent=-1, left=10, right=20}\n" +
//                        "Node{key=20, color=BLACK, parent=15, left=-1, right=-1}\n";
//        System.out.println("PASS? " + res.equals(treeState) );
//
//        System.out.println(res);

        //
        //================================================================== TESTING LR case:
        //

//        String res, treeState;
//
//        //============== insert 20
//        t.insert(20);
//        res = String.format("%s", t.root);
//        treeState = "Node{key=20, color=BLACK, parent=-1, left=-1, right=-1}";
//        System.out.println("PASS? " + res.equals(treeState) );
//
//
//        //============== insert 10
//        t.insert(10);
//        res = String.format("%s\n%s\n", t.root.left, t.root);
//        treeState =
//                "Node{key=10, color=RED, parent=20, left=-1, right=-1}\n" +
//                        "Node{key=20, color=BLACK, parent=-1, left=10, right=-1}\n";
//        System.out.println("PASS? " + res.equals(treeState) );
//
//
//        //============== insert 5
//        t.insert(5);
//        res = String.format("%s\n%s\n%s\n", t.root.left, t.root, t.root.right);
//        treeState =
//                "Node{key=5, color=RED, parent=10, left=-1, right=-1}\n" +
//                        "Node{key=10, color=BLACK, parent=-1, left=5, right=20}\n" +
//                        "Node{key=20, color=RED, parent=10, left=-1, right=-1}\n";
//        System.out.println("PASS? " + res.equals(treeState) );
//
//        //System.out.println(res);


        //
        //================================================================== TESTING RR case:
        //

//        String res, treeState;
//
//        //============== insert 1
//        t.insert(1);
//        res = String.format("%s", t.root);
//        treeState = "Node{key=1, color=BLACK, parent=-1, left=-1, right=-1}";
//        System.out.println("PASS? " + res.equals(treeState) );
//
//
//        //============== insert 2
//        t.insert(2);
//        res = String.format("%s\n%s\n", t.root, t.root.right);
//        treeState =
//                "Node{key=1, color=BLACK, parent=-1, left=-1, right=2}\n" +
//                        "Node{key=2, color=RED, parent=1, left=-1, right=-1}\n";
//        System.out.println("PASS? " + res.equals(treeState) );
//
//
//        //============== insert 3
//        t.insert(3);
//        res = String.format("%s\n%s\n%s\n", t.root.left, t.root, t.root.right);
//        treeState =
//                "Node{key=1, color=RED, parent=2, left=-1, right=-1}\n" +
//                        "Node{key=2, color=BLACK, parent=-1, left=1, right=3}\n" +
//                        "Node{key=3, color=RED, parent=2, left=-1, right=-1}\n";
//        System.out.println("PASS? " + res.equals(treeState) );

        //
        //================================================================== TESTING LL case:
        //

//        String res, treeState;
//
//        //============== insert 3
//        t.insert(3);
//        res = String.format("%s", t.root);
//        treeState = "Node{key=3, color=BLACK, parent=-1, left=-1, right=-1}";
//        System.out.println("PASS? " + res.equals(treeState) );
//
//
//        //============== insert 2
//        t.insert(2);
//        res = String.format("%s\n%s\n", t.root.left, t.root);
//        treeState =
//                "Node{key=2, color=RED, parent=3, left=-1, right=-1}\n" +
//                        "Node{key=3, color=BLACK, parent=-1, left=2, right=-1}\n";
//        System.out.println("PASS? " + res.equals(treeState) );
//
//
//        //============== insert 1
//        t.insert(1);
//        res = String.format("%s\n%s\n%s\n", t.root.left, t.root, t.root.right);
//        treeState =
//                "Node{key=1, color=RED, parent=2, left=-1, right=-1}\n" +
//                        "Node{key=2, color=BLACK, parent=-1, left=1, right=3}\n" +
//                        "Node{key=3, color=RED, parent=2, left=-1, right=-1}\n";
//        System.out.println("PASS? " + res.equals(treeState) );
//

        //
        //==================================================================
        //

    }
}

/* OUTPUT:  (incorrect, needs to be updated...)

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
