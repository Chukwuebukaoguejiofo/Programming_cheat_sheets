package com.example;

import java.util.Arrays;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

class QuickSort{
    int[] array;

    public void sort(int[] array){
        this.array=array;
        sort(0, array.length-1);
    }

    public void sort(int start, int end){
        if(start >= end) return;
        int sortedPosition = partition(start, end);
        sort(start, sortedPosition-1);
        sort(sortedPosition+1, end);
    }

    public int partition(int left, int right){
        if(left == right) return left;
        int pivot = array[right]; // we could select a random index, but we need to move it to the far right (or far left?)
        int i = left;
        int j = right -1;

        while(i<=j){
            while(array[i]<pivot) i++;
            while(i<=j && array[j]>pivot) j--;

            if (i<=j){
                swap(i,j);
                i++;
                j--;
            }
        }

        swap(i, right);
        return i;
    }

    private void swap(int i, int j){
        int temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }
}

public class Foo {
    public static void main(String[] args) {

        // Input
        int[] array = new int[]{
                1, 0, 5, 2, 3, 10, 1, 1, 9, 6, 8, 4, 7
        };
        System.out.println("Input:    " + Arrays.toString(array));

        // Setup expectation
        int[] array2 = array.clone();
        Arrays.sort(array2);
        String expected = Arrays.toString(array2);

        // Act
        QuickSort quickSort = new QuickSort();
        quickSort.sort(array);

        // Check
        String actual = Arrays.toString(array);
        System.out.println("Expected: " + expected);
        System.out.println("Actual:   " + actual);

        if (actual.equals(expected)){
            System.out.println("SUCCESS");
        }else{
            System.out.println("FAIL");
        }
    }

    static int[] shuffle(int[] ar) {
        Random rnd = ThreadLocalRandom.current();
        for (int i = ar.length - 1; i > 0; i--) {
            int index = rnd.nextInt(i + 1);
            int a = ar[index];
            ar[index] = ar[i];
            ar[i] = a;
        }
        return ar;
    }
}


/* OUTPUT

Input:    [1, 0, 5, 2, 3, 10, 1, 1, 9, 6, 8, 4, 7]
Expected: [0, 1, 1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
Actual:   [0, 1, 1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
SUCCESS

*/
