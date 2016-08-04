/** 
 * http://www.cburch.com/cs/340/reading/btree/
 * 
 * http://technicalpostsbyarifkhan.blogspot.com/2014/01/b-tree-data-structure-explained.html
 *
 * this type of tree is NOT fully loaded into memory,
 * instead each node if fetched from a file 
 * (and since fetching data from a file is slow, we should fetch as less as possible)
 * these fetches are called 'BLOCKS' and your OS as a speicif 'BLOCK SIZE' that varies from 4K, 8K, and more???
 * 
 * data retrieved from DISK (external memory) is refered as 'BLOCK'
 * when data is retrieved from DISK (external memory) and added to the memory, it is called a 'PAGE'
 * 
 * 
 * 
 * the pointers are ints that refer to a offset in the database file
 * 
 * the are 3 types of nodes: root, internal-nodes and leaf-nodes
 * the leaf nodes should also be a doublely linked list, for range queries
 * 
 * 
 * /


