/*
==================================================================================
========================== WARNING: NOT COMPLETE, HAS BUGS =======================
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
  int color;
  int key;
  Node parent, left, right;
  Node(int key, int color){
    this.key = key;
    this.color = color;
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

    while(c != null){
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
            

    insertFix(nn);
  }

  void insertFix(Node c){
    while(c.parent != null && c.parent.color == RED){ // main source of violation: RED->RED 
      Node p = c.parent;
      Node g = c.parent.parent;
      boolean isPR = (p == g.right) ? true : false;
      Node u = isPR ? g.left : g.right;
      boolean isNR = (c == p.right) ? true : false;
      boolean isGPR = (g == g.parent.right) ? true : false;
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
    if (c == null) return; // no left
    inOrder(c.left);
    System.out.println(c);
    inOrder(c.right);
  }
}

class Main {
  public static void main(String[] args) {
    System.out.println("Hello world!");

    RBT t = new RBT();

    t.insert(1);
    t.insert(2);
    t.insert(3);
    t.insert(4);
    t.insert(5);
    t.insert(6);
    t.insert(7);
    t.insert(8);
    t.insert(9);

    t.inOrder(t.root);

    System.out.println("DONE");
  }
}
