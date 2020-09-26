package com.example;

import java.util.Arrays;

/**
 * insertion to heap is bottom up
 * removal from heap is top, swap with bottom
 */
class HeapSort {
    private static int[] arr;

    public static void sort(int[] arr) {
        if (arr.length == 1) return;
        HeapSort.arr = arr;
        buildMaxHeap();
        sort();
    }

    public static void sort() {
        for (int i = arr.length - 1; i >= 1; i--) { // from last index to index 1
            swap(0, i);
            heapifyUntil(i);
        }
    }

    private static void heapifyUntil(int i) {
        siftDownUntil(i); // i is exclusive
    }

    private static void buildMaxHeap() {
        for (int i = 1; i < arr.length; i++) { // start at second item
            siftUp(i);
        }
    }

    private static void siftUp(int i) { // i will crawl up
        while (hasParent(i) && arr[getParentIndex(i)] < arr[i]) {
            swap(i, getParentIndex(i));
            i = getParentIndex(i);
        }
    }

    private static void siftDownUntil(int j) { // i will crawl down
        int i = 0;
        while (hasLeftChild(i, j)) {
            if (hasRightChild(i, j) && (getRightValue(i) > getLeftValue(i))) {
                int rci = getRightChildIndex(i);
                swap(i, rci);
                i = rci;
                continue;
            }

            int lci = getLeftChildIndex(i);
            if (arr[lci] > arr[i]) {
                swap(i, lci);
            }
            i = lci;
        }
    }

    private static int getLeftChildIndex(int i) {
        return (2 * i + 1);
    }

    private static int getRightChildIndex(int i) {
        return (2 * i + 2);
    }

    private static int getLeftValue(int i) {
        return arr[getLeftChildIndex(i)];
    }

    private static int getRightValue(int i) {
        return arr[getRightChildIndex(i)];
    }

//    private static boolean hasRightChild(int i) {
//        return getRightChildIndex(i) < arr.length;
//    }

    private static boolean hasRightChild(int i, int j) {
        return getRightChildIndex(i) < j;
    }

//    private static boolean hasLeftChild(int i) {
//        return getLeftChildIndex(i) < arr.length;
//    }

    private static boolean hasLeftChild(int i, int j) {
        return getLeftChildIndex(i) < j;
    }

    private static int getParentIndex(int i) {
        return (i - 1) / 2;
    }

    private static boolean hasParent(int i) {
        return (i - 1) / 2 >= 0;
    }

    private static void swap(int i, int j) {
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }
}

public class HeapSortExample {
    public static void main(String[] args) {
        int[] arr = {
                5, 6, 4, 7, 3, 8, 2, 9, 1, 0
        };

        HeapSort.sort(arr);
        System.out.println(Arrays.toString(arr));
        //=> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    }
}
