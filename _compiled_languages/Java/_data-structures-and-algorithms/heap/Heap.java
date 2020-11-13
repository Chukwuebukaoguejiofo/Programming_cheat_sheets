package com.example;

import java.util.Arrays;

class Heap{
    private int capacity;
    private int size;
    int[] items;

    public Heap(int capacity){
        this.capacity = capacity;
        size = 0;
        items = new int[capacity];
    }

    private int getLeftChildIndex(int parentIndex){ return 2 * parentIndex + 1; }
    private int getRightChildIndex(int parentIndex){ return 2 * parentIndex + 2; }
    private int getParentIndex(int childIndex){ return (childIndex - 1) / 2; }

    private boolean hasLeftChild(int i){ return getLeftChildIndex(i) < size; }
    private boolean hasRightChild(int i){ return getRightChildIndex(i) < size; }
    private boolean hasParent(int i){ return i > 0; } // HACK!

    private int getLeftChildValue(int i){ return items[getLeftChildIndex(i)]; }
    private int getRightChildValue(int i){ return items[getRightChildIndex(i)]; }
    private int getParentValue(int i){ return items[getParentIndex(i)]; }

    private void swap(int i, int j){
        int temp = items[i];
        items[i] = items[j];
        items[j] = temp;
    }

    private void ensureCapacity(){
        if (size == capacity){
            capacity *= 1.5;
            items = Arrays.copyOf(items, capacity);
        }
    }

    public int peek(){
        if (size == 0) throw new IllegalArgumentException();
        return items[0];
    }

    public int remove(){
        if (size == 0) throw new IllegalArgumentException();
        int item = items[0];
        items[0] = items[size - 1];
        size--;
        bubbleDown();
        return item;
    }

    public void add(int item){
        ensureCapacity();
        items[size] = item;
        size++;
        bubbleUp();
    }

    private void bubbleUp() {
        int i = size - 1;
        while(hasParent(i) && getParentValue(i) > items[i]){
            swap(getParentIndex(i), i);
            i = getParentIndex(i);
        }
    }

    private void bubbleDown() {
        int i = 0;
        while (hasLeftChild(i)){ // no right child if there is no left child!
            int smallerChildIndex = getLeftChildIndex(i); // assumption, will fix it bellow :)
            if (hasRightChild(i) && getRightChildValue(i) < getLeftChildValue(i)){
                smallerChildIndex = getRightChildIndex(i);
            }

            if (items[i] < items[smallerChildIndex]){
                break;
            }else{
                swap(i, smallerChildIndex);
            }
            i = smallerChildIndex;
        }
    }
}

public class HeapExample {
    public static void main(String[]args){
        Heap h = new Heap(10);
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

        System.out.println("peek: " + h.peek());

        System.out.println("min: " + h.remove());
        System.out.println("min: " + h.remove());
        System.out.println("min: " + h.remove());
        System.out.println("min: " + h.remove());
        System.out.println("min: " + h.remove());
        System.out.println("min: " + h.remove());
        System.out.println("min: " + h.remove());
        System.out.println("min: " + h.remove());
        System.out.println("min: " + h.remove());
        System.out.println("min: " + h.remove());
    }
}

/* OUTPUT

peek: 0
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
