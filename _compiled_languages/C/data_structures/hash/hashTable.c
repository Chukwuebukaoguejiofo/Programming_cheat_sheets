#include <stdlib.h>
#include <stdio.h>
#include <limits.h>
#include <string.h>

//
// Hash Table
//

typedef struct Node{
    char * key;
    char * value;
    struct Node * next;
} Node;


typedef struct htable{
    int size;
    Node ** table; // array of pointers
} HTable;


/**
 * Create a new htable. 
 */
HTable * createHTable(int size){

    // Allocate the table itself. 
    HTable * htable = malloc(sizeof(HTable));

    // Allocate pointers to the head nodes.
    htable->table = malloc(sizeof(Node *) * size);

    htable->size = size;

    // init the enties
    int i;
    for(i = 0; i < size; i++){
        htable->table[i] = NULL;
    }

    return htable;
}

/**
 * Hash a string to get an index for the underlying array `htable->table` 
 */
int hashFunction(HTable * htable, char * key){

    unsigned long int hashval;
    int i = 0;

    // Convert our string to an integer.
    while(hashval < ULONG_MAX && i < strlen(key)){
        hashval = hashval << 8; // asme as: `hashval * 256`
        hashval += key[i];
        i++;
    }

    return hashval % htable->size;
}

/**
 * Create an node. 
 */
Node * createNode(char * key, char * value){
    Node * node = (Node *)malloc(sizeof(Node));
    node->key = strdup(key);
    node->value = strdup(value);
    node->next = NULL;

    return node;
}

/**
 * Insert a node into a hash table. 
 */
void insert(HTable * htable, char * key, char * value){

    int index = hashFunction(htable, key);

    Node * currentNode = htable->table[index];

    while(currentNode != NULL && currentNode->key != NULL && strcmp(key, currentNode->key) > 0){
        currentNode = currentNode->next;
    }

    // If there's already a node.  Let's replace that string.
    if(currentNode != NULL && currentNode->key != NULL && strcmp(key, currentNode->key) == 0){

        free(currentNode->value);
        currentNode->value = strdup(value);

    // Nope, could't find it. add a node.
    } else { 
        Node * newNode = createNode(key, value);

        // We're at the start of the linked list in this index.
        if(currentNode == htable->table[index]){
            newNode->next = currentNode;
            htable->table[index] = newNode;

        // We're at the end of the linked list in this index.
        } else if (currentNode == NULL){
            currentNode->next = newNode;

        // We're in the middle of the list.
        } else {
            newNode->next = currentNode;
            currentNode->next = newNode;
        }
    }
}

/* Retrieve an node from a hash table. */
char * get(HTable * htable, char * key){

    int index = hashFunction(htable, key);

    Node * currentNode = htable->table[index];

    /* Step through the index, looking for our value. */
    while(currentNode != NULL && currentNode->key != NULL && strcmp(key, currentNode->key) > 0){
        currentNode = currentNode->next;
    }

    // Did we actually find anything?
    if(currentNode == NULL || currentNode->key == NULL || strcmp(key, currentNode->key) != 0){
        return NULL;
    }else{
        return currentNode->value;
    }

}

int main(){
    
    // size needs to be 2 to the power of any number. (2^10)
    HTable * htable = createHTable(1024); 

    insert(htable, "one", "1");
    insert(htable, "two", "2");
    insert(htable, "three", "3");
    insert(htable, "four", "4");

    printf("%s\n", get(htable, "one"));
    printf("%s\n", get(htable, "two"));
    printf("%s\n", get(htable, "three"));
    printf("%s\n", get(htable, "four"));

    return 0;
}
