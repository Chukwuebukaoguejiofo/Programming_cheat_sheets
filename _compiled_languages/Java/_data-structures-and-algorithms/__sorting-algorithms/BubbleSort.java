package com.example;

import java.util.Arrays;

class BubbleSort {
    public void sort(int[] arr) {
        if (arr.length < 2) return;
        boolean noSwaps = true;
        int lastIndex = arr.length - 1;

        for (int i = 0; i < lastIndex; i++){
            // (lastIndex - i) --> determines where j should stop,
            // one less each time
            for (int j = 0; j < (lastIndex - i); j++){
                int val1 = arr[j];
                int val2 = arr[j+1];
                if (val1 > val2){
                    swap(arr, j, j + 1);
                    noSwaps = false; // if at least one swap, then not sorted
                }
            }

            // if we go through the whole array and no swaps, then it is already sorted
            if (noSwaps) return;
        }
    }

    private void swap(int[] arr, int i1, int i2){
        int temp = arr[i1];
        arr[i1] = arr[i2];
        arr[i2] = temp;
    }
}

public class BubbleSortExample {
    public static void main(String[] args) {
        int[] arr = {
                9,2,6,5,0,7,4,3,1,8
        };

        BubbleSort bubbleSort = new BubbleSort();
        bubbleSort.sort(arr);
        System.out.println("arr = " + Arrays.toString(arr));
    }
}
