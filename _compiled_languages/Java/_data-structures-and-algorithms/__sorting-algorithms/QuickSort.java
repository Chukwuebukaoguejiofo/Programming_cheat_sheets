package com.example;

import java.util.Arrays;

class QuickSort {
    public static void sort(int[] array) {
        sort(array, 0, array.length - 1);
    }

    public static void sort(int[] array, int start, int end) {
        if (start >= end) return;
        int sortedPosition = partition(array, start, end);
        sort(array, start, sortedPosition - 1);
        sort(array, sortedPosition + 1, end);
    }

    public static int partition(int[] array, int left, int right) {
        if (left == right) return left;

        /**
         * we could select a random index,
         * but we need to move it to the far right (or far left?)
         */
        int pivot = array[right];
        int i = left;
        int j = right - 1;

        while (i <= j) {
            while (array[i] < pivot) i++;
            while (i <= j && array[j] > pivot) j--;

            if (i <= j) {
                swap(array, i, j);
                i++;
                j--;
            }
        }

        swap(array, i, right);
        return i;
    }

    private static void swap(int[] array, int i, int j) {
        int temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }
}

public class QuickSortExample {
    public static void main(String[] args) {
        int[] array = new int[]{
                5, 6, 4, 7, 3, 8, 2, 9, 1, 0
        };

        QuickSort.sort(array);

        System.out.println(Arrays.toString(array));
        //=> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    }
}
