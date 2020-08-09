package com.example;

import java.util.*;

class Node {
    String data;

    Node(String data) {
        this.data = data;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Node node = (Node) o;
        return data.equals(node.data);
    }

    @Override
    public int hashCode() {
        return Objects.hash(data);
    }

    @Override
    public String toString() {
        return "Node{" +
                "data='" + data + '\'' +
                '}';
    }
}

/**
 * Undirected Graph
 */
class Graph {
    private Map<Node, List<Node>> map = new HashMap<>();

    public void connect(String a, String b) {
        map.putIfAbsent(new Node(a), new ArrayList<>()); // in case it is empty
        List<Node> list = map.get(new Node(a));
        if (!list.contains(new Node(b))) {
            list.add(new Node(b));
        }

        map.putIfAbsent(new Node(b), new ArrayList<>()); // in case it is empty
        List<Node> list2 = map.get(new Node(b));
        if (!list2.contains(new Node(a))) {
            list2.add(new Node(a));
        }
    }

    boolean isConnected(String a, String b) {
        return map.get(new Node(a)).contains(new Node(b));
    }

    void BFS(String a) {
        Queue<Node> queue = new LinkedList<>();
        Set<Node> visitedNodeSet = new LinkedHashSet<>();
        queue.offer(new Node(a));

        while (!queue.isEmpty()) {
            Node currentNode = queue.poll();
            visitedNodeSet.add(currentNode);
            System.out.println("visited: " + currentNode);
            for (Node nn : map.get(currentNode)) { // <================= BRIAN PAY ATTENTION
                if (!visitedNodeSet.contains(nn)) {
                    queue.offer(nn);
                }
            }
        }

        System.out.println("visitedNodeSet: " + visitedNodeSet);
    }

    void DFS(String a) {
        Stack<Node> stack = new Stack<>();
        Set<Node> visitedNodeSet = new LinkedHashSet<>();
        stack.push(new Node(a));

        while (!stack.isEmpty()) {
            Node currentNode = stack.pop();
            visitedNodeSet.add(currentNode);
            System.out.println("visited: " + currentNode);

            for (Node c : map.get(currentNode)) {
                if (!visitedNodeSet.contains(c)) {
                    stack.push(c);
                }
            }
        }

        System.out.println("visitedNodeSet: " + visitedNodeSet);
    }
}

public class Foo {
    public static void main(String[] args) {
        Graph g = new Graph();
        g.connect("a", "a1");
        g.connect("a", "a2");
        g.connect("a", "a3");

        g.connect("a", "b");
        g.connect("b", "c");
        g.connect("c", "d");

        System.out.println(g.isConnected("a", "b")); // true
        System.out.println(g.isConnected("a", "c")); // false

        g.DFS("a");
        // visitedNodeSet: [Node{data='a'}, Node{data='b'}, Node{data='c'}, Node{data='d'}, Node{data='a3'}, Node{data='a2'}, Node{data='a1'}]


        g.BFS("a");
        // visitedNodeSet: [Node{data='a'}, Node{data='a1'}, Node{data='a2'}, Node{data='a3'}, Node{data='b'}, Node{data='c'}, Node{data='d'}]
    }
}
