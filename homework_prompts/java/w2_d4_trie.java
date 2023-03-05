/*
 *  Homework - Trie
 *
 *  Problem 1: TrieNode class
 *
 *  Prompt:    Create a TrieNode class
 *             The TrieNode class should contain the following properties:
 *
 *                 value:   {Char}
 *                  next:   {Map}
 *                   end:   {Boolean}
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
 *                          Input:     word {String}
 *                          Output:    void
 *
 *                isWord:   A method that checks whether a word is in the trie.
 *
 *                          Input:     word {String}
 *                          Output:    Boolean
 *
 *              isPrefix:   A method that checks whether an input is a prefix of
 *                          a word in the string.
 *
 *                          Input:     prefix {String}
 *                          Output:    Boolean
 *
 *            startsWith:   A method that returns all words that starts with an
 *                          input word.
 *
 *                          Input:     prefix {String}
 *                          Output:    String[]
 *
 *          EXTRA CREDIT:
 *                remove:   Removes a word from the trie.
 *
 *                          Input:     word {String}
 *                          Output:    void
 */

import java.util.*;


// DO NOT EDIT
// TrieNode class
class TrieNode {
  public Character value;
  public Map<Character, TrieNode> next = new HashMap<>();
  public boolean end = false;

  public TrieNode(Character value) {
      this.value = value;
  }
}

class Trie {


  public TrieNode root = new TrieNode('\u0000');

  public boolean insert(String word) {
    // YOUR WORK HERE
    return false;
  }

  public boolean isWord(String word) {
    // YOUR WORK HERE
    return false;
  }

  public boolean isPrefix(String prefix) {
    // YOUR WORK HERE
    return false;
  }

  public ArrayList<String> startsWith(String prefix) {
    // YOUR WORK HERE
    return new ArrayList<>();
  }

  public void remove(String word) {
    // YOUR WORK HERE
  }

}




////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use the Main class to run the test cases
class TrieTests {
  // an interface to perform tests
  public interface Test {
    boolean execute();
  }

  public static void main(String[] args) {

    // instantiate the testing of each module by resetting count and printing title of module
    int[] testCount = {0, 0};
    System.out.println("TrieNode Class");

    assertTest(testCount, "has value property", () -> {
      TrieNode node = new TrieNode('a');
      try {
        node.getClass().getDeclaredField("value");
        return true;
      } catch (Exception e) {
        return false;
      }
    });

    assertTest(testCount, "has end property", () -> {
      TrieNode node = new TrieNode('a');
      try {
        node.getClass().getDeclaredField("end");
        return true;
      } catch (Exception e) {
        return false;
      }
    });

    assertTest(testCount, "end property instatiated to false", () -> {
      TrieNode node = new TrieNode('a');
      return !node.end;
    });

    assertTest(testCount, "end assigned false upon instantiation", () -> {
      TrieNode node = new TrieNode('a');
      return !node.end;
    });

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");



    // instantiate the testing of each module by resetting count and printing title of module
    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Trie Class");


    assertTest(testCount, "has root property", () -> {
      Trie trie = new Trie();
      try {
        trie.getClass().getDeclaredField("root");
        return true;
      } catch (Exception e) {
        return false;
      }
    });


    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");



    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Trie Insert Method");


    assertTest(testCount, "has insert method", () -> {
      Trie trie = new Trie();
      try {
        trie.getClass().getMethod("insert", String.class);
        return true;
      } catch (Exception e) {
        e.printStackTrace();
        return false;
      }
    });

    assertTest(testCount, "able to insert a word into empty trie", () -> {
      Trie trie = new Trie();
      trie.insert("cat");
      return trie.root.next.containsKey('c') && trie.root.next.get('c').next.containsKey('a') &&
              trie.root.next.get('c').next.get('a').next.containsKey('t') &&
              (trie.root.next.get('c').next.get('a').next.get('t').end);
    });

    assertTest(testCount, "able to insert words that overlap into trie", () -> {
      Trie trie = new Trie();
      trie.insert("cat");
      trie.insert("car");
      return trie.root.next.containsKey('c') && trie.root.next.get('c').next.containsKey('a') &&
              trie.root.next.get('c').next.get('a').next.containsKey('t') &&
              (trie.root.next.get('c').next.get('a').next.get('t').end) &&
            trie.root.next.get('c').next.get('a').next.containsKey('r') &&
            (trie.root.next.get('c').next.get('a').next.get('r').end);
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");



    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Trie IsWord Method");


    assertTest(testCount, "has isWord method", () -> {
      Trie trie = new Trie();
      try {
        trie.getClass().getMethod("isWord", String.class);
        return true;
      } catch (Exception e) {
        e.printStackTrace();
        return false;
      }
    });

    assertTest(testCount, "should return false for an empty string as input", () -> {
      Trie trie = new Trie();
      return !trie.isWord("");
    });

    assertTest(testCount, "should return true for a word that exists", () -> {
      Trie trie = new Trie();
      trie.insert("cat");
      return trie.isWord("cat");
    });

    assertTest(testCount, "should return false for a word that does not exist", () -> {
      Trie trie = new Trie();
      trie.insert("cat");
      return !trie.isWord("car");
    });

    assertTest(testCount, "should return true for a word that exists within a larger word", () -> {
      Trie trie = new Trie();
      trie.insert("cat");
      trie.insert("cats");
      return trie.isWord("cat");
    });

    assertTest(testCount, "should return true for a word that is a larger word", () -> {
      Trie trie = new Trie();
      trie.insert("cat");
      trie.insert("cats");
      return trie.isWord("cats");
    });

    assertTest(testCount, "should return false if a smaller word was not added, but exists in a larger word", () -> {
      Trie trie = new Trie();
      trie.insert("cats");
      return !trie.isWord("cat");
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");



    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Trie StartsWith Method");

    assertTest(testCount, "has startsWith method", () -> {
      Trie trie = new Trie();
      try {
        trie.getClass().getMethod("startsWith", String.class);
        return true;
      } catch (Exception e) {
        e.printStackTrace();
        return false;
      }
    });

    assertTest(testCount, "returns null if no words start with input", () -> {
      Trie trie = new Trie();
      trie.insert("cats");
      trie.insert("corner");
      trie.insert("cesium");
      ArrayList<String> results = trie.startsWith("a");
      return results == null;
    });

    assertTest(testCount, "returns correct prefixes including input that is a word", () -> {
      Trie trie = new Trie();
      trie.insert("cat");
      trie.insert("cats");
      trie.insert("catnip");
      trie.insert("car");
      trie.insert("cars");
      ArrayList<String> results = trie.startsWith("car");
      return results != null && results.get(0).equals("car") && results.get(1).equals("cars");
    });

    assertTest(testCount, "returns the correct prefixes", () -> {
      Trie trie = new Trie();
      trie.insert("cat");
      trie.insert("cats");
      trie.insert("catnip");
      trie.insert("car");
      trie.insert("cars");
      ArrayList<String> results = trie.startsWith("ca");

      return results != null && results.indexOf("cat") != -1 && results.indexOf("cats") != -1 &&
              results.indexOf("catnip") != -1 && results.indexOf("car") != -1 && results.indexOf("cars") != -1;
    });

    assertTest(testCount, "returns all words if input is empty string", () -> {
      Trie trie = new Trie();
      trie.insert("cat");
      trie.insert("cats");
      trie.insert("catnip");
      trie.insert("foo");
      trie.insert("hello");
      trie.insert("hell");
      trie.insert("he");

      ArrayList<String> results = trie.startsWith("");

      return results != null && results.indexOf("cat") != -1 && results.indexOf("cats") != -1 &&
              results.indexOf("catnip") != -1 && results.indexOf("foo") != -1 && results.indexOf("hello") != -1 &&
              results.indexOf("hell") != -1 && results.indexOf("he") != -1;
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");



    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Trie Remove Method");

    assertTest(testCount, "has remove method", () -> {
      Trie trie = new Trie();
      try {
        trie.getClass().getMethod("remove", String.class);
        return true;
      } catch (Exception e) {
        e.printStackTrace();
        return false;
      }
    });

    assertTest(testCount, "removes a word that exists", () -> {
      Trie trie = new Trie();
      trie.insert("cat");
      trie.remove("cat");
      return !trie.isWord("cat") && (trie.root.next.get('c') == null);
    });

    assertTest(testCount, "does not remove a word that does not exist", () -> {
      Trie trie = new Trie();
      trie.insert("cat");
      trie.remove("c");
      return trie.isWord("cat");
    });

    assertTest(testCount, "does not remove letters at that belong to a longer word", () -> {
      Trie trie = new Trie();
      trie.insert("hello");
      trie.insert("hell");
      trie.insert("he");
      trie.remove("hell");
      return trie.isWord("he") &&
              trie.isWord("hello") &&
              !trie.isWord("hell");
    });

    assertTest(testCount, "removes letters from longer word and keeps shorter letters", () -> {
      Trie trie = new Trie();
      trie.insert("cat");
      trie.insert("cats");
      trie.insert("catnip");
      trie.remove("catnip");
      return trie.isWord("cat") &&
              trie.isWord("cats") &&
              !trie.isWord("catnip") && (trie.root.next.get('c').next.get('a').next.get('t').next.get('n') == null );
    });


    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");

  }


  // do not edit below, this is to wrap the test and check for exceptions
  private static void assertTest(int[] count, String name, Test test) {
    String pass = "false";
    count[1]++;

    try {
      if (test.execute()) {
        pass = " true";
        count[0]++;
      }
    } catch(Exception ignored) {}
    String result = "  " + (count[1] + ")   ").substring(0, 5) + pass + " : " + name;
    System.out.println(result);
  }
}
