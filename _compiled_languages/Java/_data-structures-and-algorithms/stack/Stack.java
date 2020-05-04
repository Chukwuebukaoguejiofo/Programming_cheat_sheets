class Node{
    int data;
    Node next;
    Node(int data){
        this.data = data;
    }
}

class Stack{
    Node top;

    boolean isEmpty(){
        return top == null;
    }

    int peek(){
        return top.data; // exception?
    }
    void push(int data){
        Node node = new Node(data);
        node.next = top;
        top = node;
    }
    int pop(){
        int data = top.data;
        top = top.next;
        return data;
    }
}

public class Main{
    public static void main(String[] args) {
        Stack s = new Stack();

        s.push(3);
        s.push(2);
        s.push(1);

        System.out.println("next: " + s.pop());
        System.out.println("next: " + s.pop());
        System.out.println("next: " + s.pop());
    }
}

/*
OUTPUT:

next: 1
next: 2
next: 3

 */
