// TODO: needs verification - I did not reference any existing implementation


import java.util.Arrays;

/**
 * Path compression
 * Union by rank
 */
class DisjointSets {
    int[] arr;

    public DisjointSets(int size){
        arr = new int[size];
        for (int i=0;i<size;i++){
            arr[i] = -1;
        }
    }

    /**
     * Union by rank
     * using negative numbers
     * the smaller negative number
     */
    public void union(int a, int b) {
        if (arr[b] < 0){ // check if b is negative or not
            if (arr[a] < 0){
                // both are negative (means both are roots)
                if (arr[b] < arr[a]){
                    // b has higher rank (smallest negative)
                    arr[b] += arr[a];
                    arr[a] = b;
                }else{
                    // same rank
                    arr[a] += arr[b];
                    arr[b] = a;
                }
            }else{
                // b is negative (root), a is positive
                int rootOfA = find(a);
                union(rootOfA, b); // recurse with both as roots
            }
        }else{
            if (arr[a] < 0){
                // b is positive, a is negative (root)
                int rootOfB = find(b);
                union(a, rootOfB); // recurse with both as roots
            }else{
                // both are positive
                int rootOfA = find(a);
                int rootOfB = find(b);
                union(rootOfA, rootOfB); // recurse with both as roots
            }
        }
    }

    public int find(int i) { // recursive
        if (arr[i] < 0) return i;

//        // path compression (we are already doing it in 'union' method)
//        int root = find(arr[i]);
//        arr[i] = root;
//        return root;

        return find(arr[i]);
    }
}

public class DisjointSetsExample {
    public static void main(String[] args) {
        DisjointSets ds = new DisjointSets(10);

        // 0,1,2,3,4
        ds.union(0,1);
        ds.union(1,2);
        ds.union(2,3);
        ds.union(3,4);

        // 5,6,7,8,9
        ds.union(5,6);
        ds.union(6,7);
        ds.union(7,8);
        ds.union(8,9);

        System.out.println("0: " + ds.find(0)); // 0
        System.out.println("1: " + ds.find(1)); // 0
        System.out.println("2: " + ds.find(2)); // 0
        System.out.println("3: " + ds.find(3)); // 0
        System.out.println("4: " + ds.find(4)); // 0
        System.out.println("5: " + ds.find(5)); // 5
        System.out.println("6: " + ds.find(6)); // 5
        System.out.println("7: " + ds.find(7)); // 5
        System.out.println("8: " + ds.find(8)); // 5
        System.out.println("9: " + ds.find(9)); // 5

        System.out.println(Arrays.toString(ds.arr)); // [-5, 0, 0, 0, 0, -5, 5, 5, 5, 5]
    }
}
