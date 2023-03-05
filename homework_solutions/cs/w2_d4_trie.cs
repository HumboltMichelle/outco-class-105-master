/**
 *  Homework - Trie
 *
 *  Problem 1: TrieNode class
 *
 *  Prompt:    Create a TrieNode class
 *             The TrieNode class should contain the following properties:
 *
 *                 value:   {Char}
 *                  next:   {Map}
 *                   end:   {bool}
 *
 *
 *  Problem 2:  Trie class
 *
 *  Prompt:     Create a Trie class
 *              The Trie class should contain the following properties:
 *
 *                  root:   {TrieNode}
 *
 *              The Trie class should also contain the following methods:
 *
 *                insert:   A method that adds a word.
 *
 *                          Input:     word {string}
 *                          Output:    void
 *
 *                isWord:   A method that checks whether a word is in the trie.
 *
 *                          Input:     word {string}
 *                          Output:    bool
 *
 *              isPrefix:   A method that checks whether an input is a prefix of
 *                          a word in the string.
 *
 *                          Input:     prefix {string}
 *                          Output:    bool
 *
 *            startsWith:   A method that returns all words that starts with an
 *                          input word.
 *
 *                          Input:     prefix {string}
 *                          Output:    string[]
 *
 *          EXTRA CREDIT:
 *                remove:   Removes a word from the trie.
 *
 *                          Input:     word {string}
 *                          Output:    void
 */


using System;
using System.Collections.Generic;

// DO NOT EDIT
// TrieNode class
class TrieNode {
    public char value;
    public Dictionary<char, TrieNode> next = new Dictionary<char, TrieNode>();
    public bool end = false;

    public TrieNode(char value) {
        this.value = value;
    }
}

class Trie {

    public TrieNode root = new TrieNode('\u0000');

    public bool insert(string word) {
        TrieNode current = this.root;
        foreach(char letter in word) {
        if(!current.next.ContainsKey(letter)) {
            current.next[letter] =  new TrieNode(letter);
        }
        current = current.next[letter];
        }
        current.end = true;
        return true;
    }

    public bool isWord(string word) {
        if(word == "") {
        return false;
        }
        TrieNode current = this._search(word);
        return current != null && current.end;
    }

    public bool isPrefix(string prefix) {
        if(prefix == "") {
        return true;
        }
        TrieNode current = this._search(prefix);
        return current != null;
    }

    public List<string> startsWith(string prefix) {
        TrieNode current = this._search(prefix);
        if(current == null) { return null; }
        List<string> results = new List<string>();
        results = _traverseNode(current);

        string temp;

        for (int i = 0; i < results.Count; i++) {
        temp = prefix + results[i];
        results[i] = temp;
        }

        return results;
    }

    public void remove(string word) {
        if("".Equals(word)){ return; }
        TrieNode current = this.root;
        Stack<TrieNode> stack = new Stack<TrieNode>();
        foreach(char letter in word) {
        stack.Push(current);
        current = current.next[letter];
        if(current == null) { return; }
        }
        current.end = false;

        if(current.next.Keys.Count > 0) { return; }

        char previousLetter;
        while(!current.end && stack.Count > 0) {
        previousLetter = current.value;
        current = stack.Pop();
        current.next.Remove(previousLetter);
        }

    }

    private TrieNode _search(string word) {
        TrieNode current = this.root;
        foreach(char letter in word) {
            if(!current.next.ContainsKey(letter)) {
                return null;
            }
            current = current.next[letter];
        }
        return current;
    }

  private List<string> _traverseNode(TrieNode node) {
    List<string> results = new List<string>();
    dfs(node, "", results);
    return results;
  }

  private void dfs(TrieNode current, string path, List<string> results) {
    if(current == null) {
      return;
    }
    if(current.end) { results.Add(path);}
    foreach(char key in current.next.Keys) {
      dfs(current.next[key], path + key,results);
    }
  }
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use the Test class to run the test cases
class Test{

    public static void Main() {
        trieNodeClassTests();
        trieClassTests();
        trieInsertMethodTests();
        trieIsWordMethodTests();
        trieStartsWithMethodTests();
        trieRemoveMethodTests();
    }

    private static void trieNodeClassTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("TrieNode Class");
        runTest(trieNodeClassTest1, "able to create an instance", testCount);
        runTest(trieNodeClassTest2, "has value property", testCount);
        runTest(trieNodeClassTest3, "has end property", testCount);
        runTest(trieNodeClassTest4, "end property instatiated to false", testCount);
        runTest(trieNodeClassTest5, "able to assign a end upon instantiation", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void trieClassTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Trie Class");
        runTest(trieClassTest1, "able to create an instance", testCount);
        runTest(trieClassTest2, "has root property", testCount);
        runTest(trieClassTest3, "root property is a TrieNode", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void trieInsertMethodTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Trie Insert Method");
        runTest(trieInsertMethodTest1, "has insert method", testCount);
        runTest(trieInsertMethodTest2, "able to insert a word into empty trie", testCount);
        runTest(trieInsertMethodTest3, "able to insert words that overlap into trie", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void trieIsWordMethodTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Trie IsWord Method");
        runTest(trieIsWordMethodTest1, "has isWord method", testCount);
        runTest(trieIsWordMethodTest2, "should return false for an empty string as input", testCount);
        runTest(trieIsWordMethodTest3, "should return true for a word that exists", testCount);
        runTest(trieIsWordMethodTest4, "should return false for a word that does not exist", testCount);
        runTest(trieIsWordMethodTest5, "should return true for a word that exists within a larger word", testCount);
        runTest(trieIsWordMethodTest6, "should return true for a word that is a larger word", testCount);
        runTest(trieIsWordMethodTest7, "should return false if a smaller word was not added, but exists in a larger word", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void trieStartsWithMethodTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Trie StartsWith Method");
        runTest(trieStartsWithMethodTest1, "has startsWith method", testCount);
        runTest(trieStartsWithMethodTest2, "returns null if no words start with input", testCount);
        runTest(trieStartsWithMethodTest3, "returns correct prefixes including input that is a word", testCount);
        runTest(trieStartsWithMethodTest4, "returns the correct prefixes", testCount);
        runTest(trieStartsWithMethodTest5, "returns all words if input is empty string", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void trieRemoveMethodTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Trie Remove Method");
        runTest(trieRemoveMethodTest1, "has remove method", testCount);
        runTest(trieRemoveMethodTest2, "removes a word that exists", testCount);
        runTest(trieRemoveMethodTest3, "does not remove a word that does not exist", testCount);
        runTest(trieRemoveMethodTest4, "does not remove letters at that belong to a longer word", testCount);
        runTest(trieRemoveMethodTest5, "removes letters from longer word and keeps shorter letters", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }


    private static bool trieNodeClassTest1() {
        TrieNode node = new TrieNode('a');
        return node.GetType() == typeof(TrieNode);
    }

    private static bool trieNodeClassTest2() {
        TrieNode node = new TrieNode('a');
        return node.GetType().GetField("value") != null;
    }

    private static bool trieNodeClassTest3() {
        TrieNode node = new TrieNode('a');
        return node.GetType().GetField("end") != null;
    }

    private static bool trieNodeClassTest4() {
        TrieNode node = new TrieNode('a');
        return node.end == false;
    }

    private static bool trieNodeClassTest5() {
        TrieNode node = new TrieNode('a');
        node.end = true;
        return node.end == true;
    }


    private static bool trieClassTest1() {
        Trie trie = new Trie();
        return trie.GetType() == typeof(Trie);
    }

    private static bool trieClassTest2() {
        return new Trie().GetType().GetField("root") != null;
    }

    private static bool trieClassTest3() {
        Trie trie = new Trie();
        return trie.root.GetType() == typeof(TrieNode);
    }



    private static bool trieInsertMethodTest1() {
        Trie trie = new Trie();
        return new Trie().GetType().GetMethod("insert") != null;
    }

    private static bool trieInsertMethodTest2() {
        Trie trie = new Trie();
        trie.insert("cat");
        return trie.root.next.ContainsKey('c') && trie.root.next['c'].next.ContainsKey('a') && trie.root.next['c'].next['a'].next.ContainsKey('t') && (trie.root.next['c'].next['a'].next['t'].end == true);
    }

    private static bool trieInsertMethodTest3() {
        Trie trie = new Trie();
        trie.insert("cat");
        trie.insert("car");
        return trie.root.next.ContainsKey('c') && trie.root.next['c'].next.ContainsKey('a') && trie.root.next['c'].next['a'].next.ContainsKey('t') && (trie.root.next['c'].next['a'].next['t'].end == true) &&
        trie.root.next['c'].next['a'].next.ContainsKey('r') &&
        (trie.root.next['c'].next['a'].next['r'].end == true);
    }



    private static bool trieIsWordMethodTest1() {
        Trie trie = new Trie();
        return new Trie().GetType().GetMethod("isWord") != null;
    }

    private static bool trieIsWordMethodTest2() {
        Trie trie = new Trie();
        return trie.isWord("") == false;
    }

    private static bool trieIsWordMethodTest3() {
        Trie trie = new Trie();
        trie.insert("cat");
        return trie.isWord("cat") == true;
    }

    private static bool trieIsWordMethodTest4() {
        Trie trie = new Trie();
        trie.insert("cat");
        return trie.isWord("car") == false;
    }

    private static bool trieIsWordMethodTest5() {
        Trie trie = new Trie();
        trie.insert("cat");
        trie.insert("cats");
        return trie.isWord("cat") == true;
    }

    private static bool trieIsWordMethodTest6() {
        Trie trie = new Trie();
        trie.insert("cat");
        trie.insert("cats");
        return trie.isWord("cats") == true;
    }

    private static bool trieIsWordMethodTest7() {
        Trie trie = new Trie();
        trie.insert("cats");
        return trie.isWord("cat") == false;
    }


    private static bool trieStartsWithMethodTest1() {
        Trie trie = new Trie();
        return new Trie().GetType().GetMethod("startsWith") != null;
    }

    private static bool trieStartsWithMethodTest2() {
        Trie trie = new Trie();
        trie.insert("cats");
        trie.insert("corner");
        trie.insert("cesium");
        List<string> results = trie.startsWith("a");
        return results == null;
    }

    private static bool trieStartsWithMethodTest3() {
        Trie trie = new Trie();
        trie.insert("cat");
        trie.insert("cats");
        trie.insert("catnip");
        trie.insert("car");
        trie.insert("cars");
        List<string> results = trie.startsWith("car");
        return results.GetType() == typeof(List<string>) && results[0].Equals("car") && results[1].Equals("cars");
    }

    private static bool trieStartsWithMethodTest4() {
        Trie trie = new Trie();
        trie.insert("cat");
        trie.insert("cats");
        trie.insert("catnip");
        trie.insert("car");
        trie.insert("cars");
        List<string> results = trie.startsWith("ca");
        return results.GetType() == typeof(List<string>) && results.IndexOf("cat") != -1 && results.IndexOf("cats") != -1 && results.IndexOf("catnip") != -1 && results.IndexOf("car") != -1 && results.IndexOf("cars") != -1;
    }

    private static bool trieStartsWithMethodTest5() {
        Trie trie = new Trie();
        trie.insert("cat");
        trie.insert("cats");
        trie.insert("catnip");
        trie.insert("foo");
        trie.insert("hello");
        trie.insert("hell");
        trie.insert("he");
        List<string> results = trie.startsWith("");
        return results.GetType() == typeof(List<string>) && results.IndexOf("cat") != -1 && results.IndexOf("cats") != -1 && results.IndexOf("catnip") != -1 && results.IndexOf("foo") != -1 && results.IndexOf("hello") != -1 && results.IndexOf("hell") != -1 && results.IndexOf("he") != -1;
    }



    private static bool trieRemoveMethodTest1() {
        Trie trie = new Trie();
        return new Trie().GetType().GetMethod("remove") != null;
    }

    private static bool trieRemoveMethodTest2() {
        Trie trie = new Trie();
        trie.insert("cat");
        trie.remove("cat");
        return trie.isWord("cat") == false && (!trie.root.next.ContainsKey('c'));
    }

    private static bool trieRemoveMethodTest3() {
        Trie trie = new Trie();
        trie.insert("cat");
        trie.remove("c");
        return trie.isWord("cat") == true;
    }

    private static bool trieRemoveMethodTest4() {
        Trie trie = new Trie();
        trie.insert("hello");
        trie.insert("hell");
        trie.insert("he");
        trie.remove("hell");
        return trie.isWord("he") == true &&
               trie.isWord("hello") == true &&
               trie.isWord("hell") == false;
    }

    private static bool trieRemoveMethodTest5() {
        Trie trie = new Trie();
        trie.insert("cat");
        trie.insert("cats");
        trie.insert("catnip");
        trie.remove("catnip");
        return trie.isWord("cat") == true &&
               trie.isWord("cats") == true &&
               trie.isWord("catnip") == false && (!trie.root.next['c'].next['a'].next['t'].next.ContainsKey('n'));
    }

    private static void runTest(Func<bool> test, string testName, int[] testCount){
        testCount[1]++;
        bool testPassed = false;
        // Attempt to run test and suppress exceptions on failure
        try {
            testPassed = test();
            if(testPassed) testCount[0]++;
        } catch {}
        string result = "  " + (testCount[1] + ")   ") + testPassed + " : " + testName;
        Console.WriteLine(result);
    }
}
