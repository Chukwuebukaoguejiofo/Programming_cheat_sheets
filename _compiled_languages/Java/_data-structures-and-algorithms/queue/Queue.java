class Node{
    int data;
    Node next;
    Node(int data){
        this.data = data;
    }
}

class Queue{
    Node head, tail;

    boolean isEmpty(){
        return head == null;
    }

    int peek(){
        return head.data; // exception?
    }
    void add(int data){
        Node node = new Node(data);
        if (tail != null){ tail.next = node; }
        tail = node;
        if (head == null){ head = node; }
    }
    int remove(){
        int data = head.data;
        head = head.next;
        if (head == null){ tail = null; }
        return data;
    }
}

public class Main{
    public static void main(String[] args) {
        Queue q = new Queue();

        q.add(3);
        q.add(7);
        q.add(4);

        System.out.println("next: " + q.remove());
        System.out.println("next: " + q.remove());
        System.out.println("next: " + q.remove());
    }
}

/*
OUTPUT:

next: 3
next: 7
next: 4
 */
