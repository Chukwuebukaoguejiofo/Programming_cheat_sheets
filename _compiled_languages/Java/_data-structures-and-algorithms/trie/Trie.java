package com.example;

import java.util.HashMap;
import java.util.Map;

class TrieNode {
    Map<Character, TrieNode> map = new HashMap<>();
    boolean isEndOfWord = false;

    void add(String s) {
        char[] letters = s.toCharArray();
        TrieNode currentNode = this;
        TrieNode nextNode = null;

        for (int i = 0; i < letters.length; i++) {
            char currentLetter = letters[i];
            nextNode = currentNode.map.get(currentLetter);
            if (nextNode == null) {
                nextNode = new TrieNode();
                currentNode.map.put(currentLetter, nextNode);
            }
            currentNode = nextNode;
        }

        nextNode.isEndOfWord = true;
    }

    boolean hasWord(String s) {
        char[] letters = s.toCharArray();
        TrieNode currentNode = this;
        TrieNode nextNode = null;

        for (int i = 0; i < letters.length; i++) {
            char currentLetter = letters[i];
            nextNode = currentNode.map.get(currentLetter);
            if (nextNode == null) {
                return false;
            } else {
                // has current letter
                currentNode = nextNode;
            }
        }

        if (nextNode.isEndOfWord) {
            return true;
        }

        return false;
    }
}

public class Trie {
    public static void main(String[] args) {
        TrieNode root = new TrieNode();

        String[] words = {
                "brian",
                "ana",
                "erich",
                "bia"
        };

        for (int i = 0; i < words.length; i++) {
            root.add(words[i]);
        }

        System.out.println("result: " + root.hasWord("bria")); // false
        System.out.println("result: " + root.hasWord("brian")); // true
        System.out.println("result: " + root.hasWord("brians")); // false
    }
}
