//
// Pointer study - with functions
//

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int ALPHABET_COUNT = 26;

//
// Structs
//

typedef struct Node {
  int isWord;
  struct Node * array[26]; // DONT use double pointer, we loose the size
} Node;

Node * createNode(){
  Node * node = (Node*)malloc(sizeof(Node*));
  node->isWord = 0; // false
  for(int i=0;i<ALPHABET_COUNT;i++){
    node->array[i] = NULL;
  }
  return node;
}

void printNode(Node * node){
  printf("Node@%p{isWord=%d, array=[", node, node->isWord);

  for(int i=0;i<ALPHABET_COUNT;i++){
    if (node->array[i] == NULL) {
      printf(". ");
    }else{
      printf("%p ", node->array[i]);
    }
  }
  printf("]}\n\n");
}

void func1(Node node){ // we get a struct copy
  printf("func1(Node node) called...\n");

  // changes is performed on the copy, not on the original
  node.isWord = 1010;

  // since it is a copy, it has another address
  printf("Node@%p{isWord=%d, array=[...]}", &node, node.isWord);
  printf("  <------ DIFF ADDRESS !!!\n\n");
}

void func2(Node * node){ // we can change the struct we point to :)
  printf("func2(Node * node) called...\n");

  // node->isWord = 2020;
  (*node).isWord = 2020;

  // printf("Node@%p{isWord=%d, array=[...]}\n\n", node, node->isWord);
  printf("Node@%p{isWord=%d, array=[...]}\n\n", node, (*node).isWord);
}

void func3(Node ** node){  // we can change the struct we point to :)
  printf("func3(Node ** node) called...\n");

  // (*node)->isWord = 3030;
  (**node).isWord = 3030;

  // printf("Node@%p{isWord=%d, array=[...]}\n\n", (*node), (*node)->isWord);
  printf("Node@%p{isWord=%d, array=[...]}\n\n", (&**node), (**node).isWord);
}

//
// Main function
//

int main(){

  // struct:
  Node nodeOLD = *createNode();
  nodeOLD.isWord = 1111;
  nodeOLD.array[10] = createNode();
  nodeOLD.array[20] = createNode();
  nodeOLD.array[25] = createNode();
  Node node = nodeOLD; // copy is done by using same types


  printf("ORIGINAL STRUCT:\n");
  printNode(&node);

  // method will actually receive a copy of the struct, with diff address
  func1(node);

  // struct (changed?):
  printf("ORIGINAL STRUCT (changed by func1? NO):\n");
  printNode(&node);

  Node * npOLD = &node;
  Node * np = npOLD;
  func2(np); // passing a node pointer


  // struct (changed?):
  printf("ORIGINAL STRUCT (changed by func2? YES):\n");
  printNode(&node);


  Node ** nppOLD = &np;
  Node ** npp = nppOLD;
  func3(npp);

  // struct (changed?):
  printf("ORIGINAL STRUCT (changed by func3? YES):\n");
  printNode(&node);



  printf("=======================\n\n");

  //
  // How to create new copy, and same copy
  //
  Node * original = createNode();
  printf("original:\n");
  printNode(original);

  Node * copy = original;
  printf("copy (BUT SAME ADDRESS, so same struct):\n");
  printNode(copy);


 // change newCode: it DONE change original
  printf("changing copy (CHANGES BOTH original and copy)...\n\n");
  copy->array[10] = createNode();


  printf("original again:\n");
  printNode(original);

  printf("copy again:\n");
  printNode(copy);




  printf("=======================\n\n");
  Node * n1 = createNode();
  n1->isWord = 1111;
  printf("n1:\n");
  printNode(n1);

  Node * n2 = createNode();
  n1->isWord = 2222;
  printf("n2:\n");
  printNode(n2);

  Node * n3 = createNode();
  n1->isWord = 3333;
  printf("n3:\n");
  printNode(n3);


  Node * currentNode;

  currentNode = n1;
  printf("currentNode (pointing to n1):\n");
  printNode(currentNode);

  currentNode = n2;
  printf("currentNode (pointing to n2):\n");
  printNode(currentNode);

  currentNode = n3;
  printf("currentNode (pointing to n3):\n");
  printNode(currentNode);







  return 0;
}

/* OUTPUT

ORIGINAL STRUCT:
Node@0x7ffee237e918{isWord=1111, array=[. . . . . . . . . . 0x7f8434c01710 . . . . . . . . . 0x7f8434c01720 . . . . 0x7f8434c01730 ]}

func1(Node node) called...
Node@0x7ffee237e7a0{isWord=1010, array=[...]}  <------ DIFF ADDRESS !!!

ORIGINAL STRUCT (changed by func1? NO):
Node@0x7ffee237e918{isWord=1111, array=[. . . . . . . . . . 0x7f8434c01710 . . . . . . . . . 0x7f8434c01720 . . . . 0x7f8434c01730 ]}

func2(Node * node) called...
Node@0x7ffee237e918{isWord=2020, array=[...]}

ORIGINAL STRUCT (changed by func2? YES):
Node@0x7ffee237e918{isWord=2020, array=[. . . . . . . . . . 0x7f8434c01710 . . . . . . . . . 0x7f8434c01720 . . . . 0x7f8434c01730 ]}

func3(Node ** node) called...
Node@0x7ffee237e918{isWord=3030, array=[...]}

ORIGINAL STRUCT (changed by func3? YES):
Node@0x7ffee237e918{isWord=3030, array=[. . . . . . . . . . 0x7f8434c01710 . . . . . . . . . 0x7f8434c01720 . . . . 0x7f8434c01730 ]}

=======================

original:
Node@0x7f8434c01740{isWord=0, array=[. . . . . . . . . . . . . . . . . . . . . . . . . . ]}

copy (BUT SAME ADDRESS, so same struct):
Node@0x7f8434c01740{isWord=0, array=[. . . . . . . . . . . . . . . . . . . . . . . . . . ]}

changing copy (CHANGES BOTH original and copy)...

original again:
Node@0x7f8434c01740{isWord=0, array=[. . . . . . . . . . 0x7f8434c01750 . . . . . . . . . . . . . . . ]}

copy again:
Node@0x7f8434c01740{isWord=0, array=[. . . . . . . . . . 0x7f8434c01750 . . . . . . . . . . . . . . . ]}

=======================

n1:
Node@0x7f8434c01760{isWord=1111, array=[. . . . . . . . . . . . . . . . . . . . . . . . . . ]}

n2:
Node@0x7f8434c01770{isWord=0, array=[. . . . . . . . . . . . . . . . . . . . . . . . . . ]}

n3:
Node@0x7f8434c01780{isWord=0, array=[. . . . . . . . . . . . . . . . . . . . . . . . . . ]}

currentNode (pointing to n1):
Node@0x7f8434c01760{isWord=3333, array=[. . . . . . . . . . . . . . . . . . . . . . . . . . ]}

currentNode (pointing to n2):
Node@0x7f8434c01770{isWord=0, array=[. . . . . . . . . . . . . . . . . . . . . . . . . . ]}

currentNode (pointing to n3):
Node@0x7f8434c01780{isWord=0, array=[. . . . . . . . . . . . . . . . . . . . . . . . . . ]}

*/
