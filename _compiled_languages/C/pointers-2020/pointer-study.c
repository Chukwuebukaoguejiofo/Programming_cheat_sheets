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

  (*node).array[25] = createNode();
  for(int i=0;i<ALPHABET_COUNT;i++){
    if (node->array[i] == NULL) {
      printf(". ");
    }else{
      printf("%p ", node->array[i]);
    }
  }
  printf("]}\n");
}

void func1(Node node){ // we get a struct copy
  printf("func1...\n");

  // changes is performed on the copy, not on the original
  node.isWord = 1010;

  // since it is a copy, it has another address
  printf("Node@%p{isWord=%d, array=[...]}\n\n", &node, node.isWord);
}

void func2(Node * node){ // we can change the struct we point to :)
  printf("func2...\n");

  node->isWord = 2020;

  printf("Node@%p{isWord=%d, array=[...]}\n\n", node, (*node).isWord);
}

void func3(Node ** node){  // we can change the struct we point to :)
  printf("func3...\n");

  (*node)->isWord = 3030;

  printf("Node@%p{isWord=%d, array=[...]}\n\n", (*node), (*node)->isWord);
}

//
// Main function
//

int main(){

  // struct:
  Node node = *createNode();
  node.isWord = 1111;


  printf("ORIGINAL STRUCT:\n");
  printf("Node@%p{isWord=%d, array=[...]}\n\n", &node, node.isWord);

  // printf("STRUCT (in function):\n");
  // printNode(&node);

  // method will actually receive a copy of the struct, with diff address
  func1(node);

  // struct (changed?):
  printf("STRUCT (changed by func1? NO):\n");
  printf("Node@%p{isWord=%d, array=[...]}\n\n", &node, node.isWord);

  Node * np = &node;
  func2(np); // passing a node pointer


  // struct (changed?):
  printf("STRUCT (changed by func2? YES):\n");
  printf("Node@%p{isWord=%d, array=[...]}\n\n", &node, node.isWord);


  Node ** npp = &np;
  func3(npp);

  // struct (changed?):
  printf("STRUCT (changed by func3? YES):\n");
  printf("Node@%p{isWord=%d, array=[...]}\n\n", &node, node.isWord);

  return 0;
}

/* OUTPUT

ORIGINAL STRUCT:
Node@0x7ffee64419f0{isWord=1111, array=[...]}

func1...
Node@0x7ffee64418d0{isWord=1010, array=[...]}

STRUCT (changed by func1? NO):
Node@0x7ffee64419f0{isWord=1111, array=[...]}

func2...
Node@0x7ffee64419f0{isWord=2020, array=[...]}

STRUCT (changed by func2? YES):
Node@0x7ffee64419f0{isWord=2020, array=[...]}

func3...
Node@0x7ffee64419f0{isWord=3030, array=[...]}

STRUCT (changed by func3? YES):
Node@0x7ffee64419f0{isWord=3030, array=[...]}

*/
