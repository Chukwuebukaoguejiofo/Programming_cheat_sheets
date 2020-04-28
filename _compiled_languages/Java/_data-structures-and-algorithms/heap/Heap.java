import java.util.Arrays;

class Heap{
    private int capacity = 10;
    private int size = 0;
    int[] items = new int[capacity];

    private int getLeftChildIndex(int parentIndex){ return 2 * parentIndex + 1; }
    private int getRightChildIndex(int parentIndex){ return 2 * parentIndex + 2; }
    private int getParentIndex(int childIndex){ return (childIndex - 1) / 2; }

    private boolean hasLeftChild(int index){ return getLeftChildIndex(index) < size; }
    private boolean hasRightChild(int index){ return getRightChildIndex(index) < size; }
    private boolean hasParent(int index){ return getParentIndex(index) >= 0; }

    private int getLeftChildValue(int index){ return items[getLeftChildIndex(index)]; }
    private int getRightChildValue(int index){ return items[getRightChildIndex(index)]; }
    private int getParentValue(int index){ return items[getParentIndex(index)]; }

    private void swap(int indexOne, int indexTwo){
        int temp = items[indexOne];
        items[indexOne] = items[indexTwo];
        items[indexTwo] = temp;
    }

    private void ensureCapacity(){
        if (size == capacity){
            items = Arrays.copyOf(items, capacity * 2);
            capacity *= 2;
        }
    }

    public int peek(){
        if (size == 0) throw new IllegalArgumentException();
        return items[0];
    }

    public int poll(){
        if (size == 0) throw new IllegalArgumentException();
        int item = items[0];
        items[0] = items[size - 1];
        size--;
        heapifyDown();
        return item;
    }

    public void add(int item){
        ensureCapacity();
        items[size] = item;
        size++;
        heapifyUp();
    }

    private void heapifyUp() {
        int index = size - 1;
        while(hasParent(index) && getParentValue(index) > items[index]){
            swap(getParentIndex(index), index);
            index = getParentIndex(index);
        }
    }

    private void heapifyDown() {
        int index = 0;
        while (hasLeftChild(index)){ // no right child if there is no left child!
            int smallerChildIndex = getLeftChildIndex(index); // assumption, will fix it bellow :)
            if (hasRightChild(index) && getRightChildValue(index) < getLeftChildValue(index)){
                smallerChildIndex = getRightChildIndex(index);
            }

            if (items[index] < items[smallerChildIndex]){
                break;
            }else{
                swap(index, smallerChildIndex);
            }
            index = smallerChildIndex;
        }
    }
}

public class HeapExample {
    public static void main(String[]args){
        Heap h = new Heap();
        h.add(2);
        h.add(8);
        h.add(7);
        h.add(6);
        h.add(5);
        h.add(0);
        h.add(9);
        h.add(4);
        h.add(3);
        h.add(1);

        System.out.println("min: " + h.poll());
        System.out.println("min: " + h.poll());
        System.out.println("min: " + h.poll());
        System.out.println("min: " + h.poll());
        System.out.println("min: " + h.poll());
        System.out.println("min: " + h.poll());
        System.out.println("min: " + h.poll());
        System.out.println("min: " + h.poll());
        System.out.println("min: " + h.poll());
        System.out.println("min: " + h.poll());
    }
}

/*

========== OUTPUT:
min: 0
min: 1
min: 2
min: 3
min: 4
min: 5
min: 6
min: 7
min: 8
min: 9

*/
