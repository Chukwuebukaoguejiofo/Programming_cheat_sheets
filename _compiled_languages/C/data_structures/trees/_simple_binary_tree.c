#include<stdlib.h>
#include<stdio.h>

//
// Binary tree key structure
//

typedef struct Node {
    int key;
    int value;
    struct Node * right;
    struct Node * left;
} Node;


typedef struct Tree{
    int size; // not used yet...
    Node * root;
} Tree;

//
// function declarations (so we can implement the functions in any order!)
//

Tree * createTree();
Node * createNode(int key, int value);
void printNode(Node * node, char * msg);
void insertRecursive(Node ** node, int key, int value);
void insertIterative(Tree ** tree, Node ** node, int key, int value);
void insert(Tree ** tree, int key, int value);
void preOrder(Node * node);
void inOrder(Node * node);
void inOrder2(Tree * tree);
void postOrder(Node * node);
void deleteNode(Node * node);
void deleteNode2(Tree * tree);
Node * search2(Node ** node, int key);
Node * search(Tree ** tree, int key);

//
// implementations
//

Node * createNode(int key, int value){
    Node * node = (Node *)malloc(sizeof(Node));
    node->key = key;
    node->value = value;
    node->right = NULL;
    node->left = NULL;
    
    return node;
}

Tree * createTree(){
    Tree * tree = (Tree *)malloc(sizeof(Tree));
    tree->size = 0;
    tree->root = NULL;
    
    return tree;
}

void printNode(Node * node, char * msg){
    if(node != NULL){
        printf("    %s --> Node: (key: %d, value: %d) \n\n", msg, node->key, node->value);
    }else{
        printf("    Node Not Found --> Node: (key: %d, value: %d) \n\n", 0, 0);
    }
}

void insert(Tree ** tree, int key, int value){
    // insertRecursive( &((*tree)->root), key, value );
    insertIterative(tree,  &((*tree)->root), key, value );
}

void insertRecursive(Node ** node, int key, int value){
    
    if( *node == NULL ){
        Node * temp = createNode(key, value);
        *node = temp;
        return;
    }

    if(key < (*node)->key){
        insertRecursive( &(*node)->left, key, value);
    }else if(key > (*node)->key){
        // insertRecursive( &(*node)->right, key, value);
        insertRecursive( &(*node)->right, key, value);
    }

}

void insertIterative(Tree ** tree, Node ** node, int key, int value){

    Node * newNode = createNode(key, value);
    
    if( *node == NULL ){
        *node = newNode;
        (*tree)->root = *node;
        return;
    }

    Node * currentNode = *node;

    while(1){
        if( key > (currentNode)->key){
            if((currentNode)->right == NULL){
                (currentNode)->right = newNode;
                return;
            }else{
                currentNode = (currentNode)->right;
            }
        }else{
            if((currentNode)->left == NULL){
                (currentNode)->left = newNode;
                return;
            }else{
                currentNode = (currentNode)->left;
            }
        }
    }

}

void preOrder(Node * node){
    if(node != NULL){
        printNode(node, "");
        preOrder(node->left);
        preOrder(node->right);
    }

}

void inOrder(Node * node){
    if(node != NULL){
        inOrder(node->left);
        printNode(node, "");
        inOrder(node->right);
    }
}

void inOrder2(Tree * tree){
    inOrder(tree->root);
}

void postOrder(Node * node){
    if(node != NULL){
        postOrder(node->left);
        postOrder(node->right);
        printNode(node, "");
    }
}

void deleteNode(Node * node){
    if(node != NULL){
        deleteNode(node->left);
        deleteNode(node->right);

        printNode(node, "FREE");
        free(node);
    }
}

void deleteNode2(Tree * tree){
    deleteNode(tree->root);
}

Node * search(Tree ** tree, int key){
    return search2( &((*tree)->root), key);
}

Node* search2(Node ** node, int key){
    if( *node == NULL ){
        return NULL;
    }

    if(key < (*node)->key){
        search2( &((*node)->left), key );
    }else if(key > (*node)->key){
        search2( &((*node)->right), key );
    }else if(key == (*node)->key){
        return *node;
    }
}

void main(){

    Tree * tree = createTree();

    insert(&tree, 6, 60);
    insert(&tree, 3, 30);
    insert(&tree, 8, 80);
    insert(&tree, 2, 20);
    insert(&tree, 7, 70);
    insert(&tree, 4, 40);
    insert(&tree, 1, 10);
    insert(&tree, 5, 50);
    insert(&tree, 9, 90);

    printf("In Order Display\n");
    inOrder2(tree);

    printf("Pre Order Display\n");
    preOrder(tree->root);

    printf("Post Order Display\n");
    postOrder(tree->root);

    Node * result = search(&tree, 4);
    printNode(result, "Result:");

    Node * result2 = search(&tree, 10000);
    printNode(result2, "Result:");

    deleteNode2(tree);

}
