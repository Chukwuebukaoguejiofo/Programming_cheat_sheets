package com.example;


/**
 * Needs tests
 */
class Node {
    String key;
    String value;
    Node next;

    public Node(String key, String value) {
        this.key = key;
        this.value = value;
    }
}

class HashMap {
    Node[] list = new Node[100]; // default size

    public void put(String key, String value) {
        Node newNode = new Node(key, value);
        int hashCode = getHash(key);
        int index = hashCode % list.length;

        if (list[index] == null) {
            // System.out.println("No collision");
            list[index] = newNode;
        } else {
            System.out.println("Found collision for key: " + key + " -> using chaining");
            Node currentNode = list[index];
            Node prevNode = currentNode;

            // Go to end of list
            while (currentNode != null) {
                if (currentNode.key.equals(key)) {
                    System.out.println("Found existing key: " + key + " -> updating");
                    currentNode.value = value;
                    return; // we are done!
                }
                prevNode = currentNode;
                currentNode = prevNode.next;
            }

            prevNode.next = newNode;
        }
    }

    public String get(String key) {
        int hashCode = getHash(key);
        int index = hashCode % list.length;
        Node currentNode = list[index];

        while (currentNode != null) {
            if (currentNode.key.equals(key)) {
                return currentNode.value;
            }
            currentNode = currentNode.next;
        }

        return null; // not found
    }

    private int getHash(String key) {
        int i = 0;
        int hashValue = 0;

        /**
         * loops for the length of the key, example:
         * "abcde" will loop 5 times -> keeping hashValue less than Integer.MAX_VALUE
         */
        while (hashValue < Integer.MAX_VALUE && i < key.length()) {
            hashValue *= 256; // same as: `hashValue << 8`
            hashValue += key.charAt(i);
            i++;
        }
        return hashValue;
    }
}

public class HashMapExample {
    public static void main(String[] args) {
        HashMap hash = new HashMap();

        hash.put("name", "brian");
        hash.put("address", "123 foobar st");
        hash.put("age", "31");

        hash.put("foo", "v1");
        hash.put("foo", "v2");
        hash.put("foo", "v3");
        hash.put("foo", "v4");
        hash.put("foo", "v5");

        hash.put("xxxx", "collision-1");
        hash.put("xxxxx", "collision-2"); // causes collision

        System.out.println(hash.get("name")); // brian
        System.out.println(hash.get("address")); // 123 foobar st
        System.out.println(hash.get("age")); // 31
        System.out.println(hash.get("foo")); // v5
    }
}


/* OUTPUT

Found collision for key: foo -> using chaining
Found existing key: foo -> updating
Found collision for key: foo -> using chaining
Found existing key: foo -> updating
Found collision for key: foo -> using chaining
Found existing key: foo -> updating
Found collision for key: foo -> using chaining
Found existing key: foo -> updating
Found collision for key: xxxxx -> using chaining
brian
123 foobar st
31
v5

*/
