#include <stdlib.h>
#include <stdio.h>
#include <limits.h>
#include <string.h>


typedef struct entry{
    char * key;
    char * value;
    struct entry * next;
}Entry;


typedef struct hashtable{
    int size;
    struct entry * *table;
}HashTable;


/* Create a new hashtable. */
HashTable * createHashTable(int size){

    /* Allocate the table itself. */
    HashTable * hashtable = malloc(sizeof(HashTable));

    /* Allocate pointers to the head nodes. */
    hashtable->table = malloc(sizeof(Entry *) * size);


    /* init the enties */
    for(int i = 0; i < size; i++){
        hashtable->table[i] = NULL;
    }

    hashtable->size = size;

    return hashtable;
}

/* Hash a string for a particular hash table. */
int hashFunction(HashTable * hashtable, char * key){

    unsigned long int hashval;
    int i = 0;

    /* Convert our string to an integer */
    while(hashval < ULONG_MAX && i < strlen(key)){
        hashval = hashval << 8;
        hashval += key[i];
        i++;
    }

    return hashval % hashtable->size;
}

/* Create an entry. */
Entry * createEntry(char * key, char * value){
    Entry * newEntry = malloc(sizeof(Entry));
    newEntry->key = strdup(key);
    newEntry->value = strdup(value);
    newEntry->next = NULL;

    return newEntry;
}

/* Insert an entry into a hash table. */
void insertIntoHashTable(HashTable * hashtable, char * key, char * value){
    Entry * newEntry = NULL;
    Entry * last = NULL;

    int index = hashFunction(hashtable, key);

    Entry * next = hashtable->table[index];

    while(next != NULL && next->key != NULL && strcmp(key, next->key) > 0){
        last = next;
        next = next->next;
    }

    /* There's already an entry.  Let's replace that string. */
    if(next != NULL && next->key != NULL && strcmp(key, next->key) == 0){

        free(next->value);
        next->value = strdup(value);

    /* Nope, could't find it.  Time to grow an entry. */
    } else{
        newEntry = createEntry(key, value);

        /* We're at the start of the linked list in this index. */
        if(next == hashtable->table[index]){
            newEntry->next = next;
            hashtable->table[index] = newEntry;

        /* We're at the end of the linked list in this index. */
        } else if (next == NULL){
            last->next = newEntry;

        /* We're in the middle of the list. */
        } else {
            newEntry->next = next;
            last->next = newEntry;
        }
    }
}

/* Retrieve an entry from a hash table. */
char * getFromHashTable(HashTable * hashtable, char * key){
    int index = 0;
    Entry * entry;

    index = hashFunction(hashtable, key);

    /* Step through the index, looking for our value. */
    entry = hashtable->table[index];
    while(entry != NULL && entry->key != NULL && strcmp(key, entry->key) > 0){
        entry = entry->next;
    }

    /* Did we actually find anything? */
    if(entry == NULL || entry->key == NULL || strcmp(key, entry->key) != 0){
        return NULL;

    } else{
        return entry->value;
    }

}


int main(){
    HashTable * hashtable = createHashTable(1024); // size needs to be a power of 2

    insertIntoHashTable(hashtable, "one", "1");
    insertIntoHashTable(hashtable, "two", "2");
    insertIntoHashTable(hashtable, "three", "3");
    insertIntoHashTable(hashtable, "four", "4");

    printf("%s\n", getFromHashTable(hashtable, "one"));
    printf("%s\n", getFromHashTable(hashtable, "two"));
    printf("%s\n", getFromHashTable(hashtable, "three"));
    printf("%s\n", getFromHashTable(hashtable, "four"));

    return 0;
}
