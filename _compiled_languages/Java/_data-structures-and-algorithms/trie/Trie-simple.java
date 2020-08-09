package com.example;

import java.util.HashMap;
import java.util.Map;

class Node {
    public Map<Character, Node> map = new HashMap<>();
    public boolean isWord;
    public Node(){ }
}

class Trie {
    public Node root = new Node();

    public void add(String w){
        char[] letters = w.toCharArray();
        Node currentNode = root;

        for(char c : letters){
            currentNode.map.putIfAbsent(c, new Node());
            currentNode = currentNode.map.get(c);
        }
        currentNode.isWord = true;
    }

    public boolean hasWord(String w){
        char[] letters = w.toCharArray();
        Node currentNode = root;
        for(char c : letters){
            currentNode = currentNode.map.get(c);
            if (currentNode == null) return false;
        }

        if (currentNode.isWord) return true;
        return false;
    }
}

public class Foo {
    public static void main(String[] args) {
        Trie trie = new Trie();
        trie.add("a");
        trie.add("ab");
        trie.add("abc");

        trie.hasWord("a"); // true
        trie.hasWord("ab"); // true
        trie.hasWord("abc"); // true
        trie.hasWord("abcd"); // false
    }
}
