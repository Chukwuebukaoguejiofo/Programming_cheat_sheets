#include <stdio.h>
#include <stdlib.h>

typedef struct DisjointSet{
    int * array;
    int size;
    int capacity;
} DisjointSet;

DisjointSet * createDisjointSet(int capacity){
    DisjointSet * disjointSet = (DisjointSet *)malloc(sizeof(DisjointSet));
    disjointSet->size = 0;
    disjointSet->capacity = capacity;
    
    disjointSet->array = (int *)malloc(sizeof(int) * capacity);
    
    int i;
    
    // initialize array:
    for(i = 0; i < capacity; i++){
        disjointSet->array[i] = -1;
    }
    
    return disjointSet;
}

int find(DisjointSet ** disjointSet, int index){
    int parent = (*disjointSet)->array[index];
    
    if(parent < 0){
        return index;
    }
    
    (*disjointSet)->array[index] = find(disjointSet, parent);
    
    return (*disjointSet)->array[index]; // do I need this line?
    
}

void _union(DisjointSet ** disjointSet, int x, int y){
    int xP = find(disjointSet, x);
    int yP = find(disjointSet, y);
    
    if(xP == yP){
        return;
    }
    
    if((*disjointSet)->array[xP] < (*disjointSet)->array[yP]){
        (*disjointSet)->array[y] = xP;
    }else if((*disjointSet)->array[xP] > (*disjointSet)->array[yP]){
        (*disjointSet)->array[x] = yP;
    }else if((*disjointSet)->array[xP] == (*disjointSet)->array[yP]){
        (*disjointSet)->array[yP] = xP;
        (*disjointSet)->array[xP]--;
    }
}

void display(DisjointSet ** disjointSet){
    int i;
    
    for(i = 0; i < (*disjointSet)->capacity; i++){
        int val = (*disjointSet)->array[i];
        
        printf("%d [%d] \n", i, val);
    }
}

int main()
{
    DisjointSet * disjointSet = createDisjointSet(10);
    
    _union(&disjointSet, 1,2);
    _union(&disjointSet, 1,3);
    _union(&disjointSet, 3,4);
    _union(&disjointSet, 4,5);
    
    find(&disjointSet, 1);
    
    display(&disjointSet);
   

    return 0;
}

