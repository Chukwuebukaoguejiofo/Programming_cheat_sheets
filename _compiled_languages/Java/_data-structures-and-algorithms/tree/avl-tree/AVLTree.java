class Node { 
    int key, height; 
    Node left, right; 
  
    Node(int d) { 
        key = d; 
        height = 0;
    } 

    @Override
    public String toString(){
      return "k:"+key;
    }
} 
  
class AVLTree { 
    Node root; 
  
    int getHeight(Node n) { 
        if (n == null) return 0; 
        return n.height;
    } 

    void setHeight(Node n){
      n.height = max(getHeight(n.left), getHeight(n.right)) + 1; 
    }
  
    int max(int a, int b) { 
        return (a > b) ? a : b; 
    } 

    int getBalance(Node n) { 
        if (n == null) return 0; 
        return getHeight(n.left) - getHeight(n.right); 
    } 
  
    Node rightRotate(Node a) {
        Node b = a.left; 
        Node c = b.right; 
        b.right = a; 
        a.left = c; 
  
        setHeight(a);
        setHeight(b);
  
        return b; 
    } 
  
    Node leftRotate(Node a) {
        Node b = a.right; 
        Node c = b.left; 
        b.left = a; 
        a.right = c; 
  
        setHeight(a);
        setHeight(b);
  
        return b; 
    } 
  
    Node insert(Node node, int key) { 
        if (node == null) return (new Node(key)); 
  
        if (key < node.key) 
            node.left = insert(node.left, key); 
        else if (key > node.key) 
            node.right = insert(node.right, key); 
        else
            return node; // no dups
  
      return insertFixUp(node, key);
    } 

    Node insertFixUp(Node node, int key){
      setHeight(node);
      int balance = getBalance(node); 
      
      // LL Case 
      if (balance > 1 && key < node.left.key)
          return rightRotate(node); 

      // RR Case 
      if (balance < -1 && key > node.right.key) 
          return leftRotate(node); 

      // LR Case 
      if (balance > 1 && key > node.left.key) { 
          node.left = leftRotate(node.left); 
          return rightRotate(node); 
      } 

      // RL Case 
      if (balance < -1 && key < node.right.key) { 
          node.right = rightRotate(node.right); 
          return leftRotate(node); 
      } 

      return node; 
    }
  
    void inOrder(Node n){
      if(n == null) return;
      inOrder(n.left);
      System.out.println(n);  
      inOrder(n.right); 
    }
} 

class Main {
  public static void main(String[] args) {
    AVLTree tree = new AVLTree();
    tree.root = tree.insert(tree.root, 7); 
    tree.root = tree.insert(tree.root, 3); 
    tree.root = tree.insert(tree.root, 5); 
    tree.root = tree.insert(tree.root, 9); 
    tree.root = tree.insert(tree.root, 2); 
    tree.root = tree.insert(tree.root, 6); 
    tree.root = tree.insert(tree.root, 1); 
    tree.root = tree.insert(tree.root, 4); 
    tree.root = tree.insert(tree.root, 8); 

    tree.inOrder(tree.root); 
  }
}
