/**
 *  Homework - Trie
 *
 *  Problem 1: TrieNode class
 *
 *  Prompt:    Create a TrieNode class
 *             The TrieNode class should contain the following properties:
 *
 *                 value:   {Char}
 *                  children:   {Map}
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

#include <vector>
#include <string>
#include <stack>
#include <algorithm>
#include <iostream>
#include <unordered_map>
#include <typeinfo>
using namespace std;

// DO NOT EDIT
// TrieNode class
class TrieNode {
  public:
    char value;
    unordered_map<char, TrieNode*> children;
    bool end;

    TrieNode(char val) {
        value = val;
        end = false;
    }
};

class Trie {

    public:
      TrieNode *root = new TrieNode('\u0000');

      bool insert(string word) {
        // YOUR WORK HERE
        return false;
      }

      bool isWord(string word) {
        // YOUR WORK HERE
        return false;
      }

      bool isPrefix(string prefix) {
        // YOUR WORK HERE
        return false;
      }

      vector<string> startsWith(string prefix) {
        // YOUR WORK HERE
        return vector<string>{};
      }

      void remove(string word) {
        // YOUR WORK HERE
      }

};


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

void runTest (bool test(), string testName, int testCount[]),  printTestsPassed(int testCount[]);

void trieNodeClassTests(), trieClassTests(), trieInsertMethodTests(), trieIsWordMethodTests(),
    trieStartsWithMethodTests(),trieRemoveMethodTests();

bool trieNodeClassTest1(), trieNodeClassTest2(), trieNodeClassTest3(),
    trieNodeClassTest4(), trieNodeClassTest5();
bool trieClassTest1(), trieClassTest2(), trieClassTest3();
bool trieInsertMethodTest1(), trieInsertMethodTest2(), trieInsertMethodTest3();
bool trieIsWordMethodTest1(), trieIsWordMethodTest2(), trieIsWordMethodTest3(),
    trieIsWordMethodTest4(), trieIsWordMethodTest5(),trieIsWordMethodTest6(), trieIsWordMethodTest7();
bool trieStartsWithMethodTest1(), trieStartsWithMethodTest2(), trieStartsWithMethodTest3(),
    trieStartsWithMethodTest4(), trieStartsWithMethodTest5();
bool trieRemoveMethodTest1(), trieRemoveMethodTest2(), trieRemoveMethodTest3(),
    trieRemoveMethodTest4(), trieRemoveMethodTest5();


int main() {
  trieNodeClassTests();
  trieClassTests();
  trieInsertMethodTests();
  trieIsWordMethodTests();
  trieStartsWithMethodTests();
  trieRemoveMethodTests();
  return 0;
}

void trieNodeClassTests() {
  int testCount[] = {0, 0};
  cout << "TrieNode Class" << endl;
  runTest(trieNodeClassTest1, "able to create an instance", testCount);
  runTest(trieNodeClassTest2, "has value property", testCount);
  runTest(trieNodeClassTest3, "has end property", testCount);
  runTest(trieNodeClassTest4, "end property instatiated to false", testCount);
  runTest(trieNodeClassTest5, "able to assign a end upon instantiation", testCount);
  printTestsPassed(testCount);
}

void trieClassTests() {
  int testCount[] = {0, 0};
  cout << "Trie Class" << endl;
  runTest(trieClassTest1, "able to create an instance", testCount);
  runTest(trieClassTest2, "has root property", testCount);
  runTest(trieClassTest3, "root property is a TrieNode", testCount);
  printTestsPassed(testCount);
}

void trieInsertMethodTests() {
  int testCount[] = {0, 0};
  cout << "Trie Insert Method" << endl;
  runTest(trieInsertMethodTest1, "has insert method", testCount);
  runTest(trieInsertMethodTest2, "able to insert a word into empty trie", testCount);
  runTest(trieInsertMethodTest3, "able to insert words that overlap into trie", testCount);
  printTestsPassed(testCount);
}

void trieIsWordMethodTests() {
  int testCount[] = {0, 0};
  cout << "Trie IsWord Method" << endl;
  runTest(trieIsWordMethodTest1, "has isWord method", testCount);
  runTest(trieIsWordMethodTest2, "should return false for an empty string as input", testCount);
  runTest(trieIsWordMethodTest3, "should return true for a word that exists", testCount);
  runTest(trieIsWordMethodTest4, "should return false for a word that does not exist", testCount);
  runTest(trieIsWordMethodTest5, "should return true for a word that exists within a larger word", testCount);
  runTest(trieIsWordMethodTest6, "should return true for a word that is a larger word", testCount);
  runTest(trieIsWordMethodTest7, "should return false if a smaller word was not added, but exists in a larger word", testCount);
  printTestsPassed(testCount);
}

void trieStartsWithMethodTests() {
  int testCount[] = {0, 0};
  cout << "Trie StartsWith Method" << endl;
  runTest(trieStartsWithMethodTest1, "has startsWith method", testCount);
  runTest(trieStartsWithMethodTest2, "returns empty if no words start with input", testCount);
  runTest(trieStartsWithMethodTest3, "returns correct prefixes including input that is a word", testCount);
  runTest(trieStartsWithMethodTest4, "returns the correct prefixes", testCount);
  runTest(trieStartsWithMethodTest5, "returns all words if input is empty string", testCount);
  printTestsPassed(testCount);
}

void trieRemoveMethodTests() {
  int testCount[] = {0, 0};
  cout << "Trie Remove Method" << endl;
  runTest(trieRemoveMethodTest1, "has remove method", testCount);
  runTest(trieRemoveMethodTest2, "removes a word that exists", testCount);
  runTest(trieRemoveMethodTest3, "does not remove a word that does not exist", testCount);
  runTest(trieRemoveMethodTest4, "does not remove letters at that belong to a longer word", testCount);
  runTest(trieRemoveMethodTest5, "removes letters from longer word and keeps shorter letters", testCount);
  printTestsPassed(testCount);
}



// SFINAE test
template <typename T>
class HasValue{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::value) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasEnd{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::end) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasRoot{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::root) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasInsert{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::insert) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasIsWord{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::isWord) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasStartsWith{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::startsWith) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasRemove{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::remove) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};



bool trieNodeClassTest1() {
  TrieNode *node = new TrieNode('a');
  bool typeMatched = typeid(*node).name() == typeid(TrieNode).name();
  delete(node);
  return typeMatched;
}

bool trieNodeClassTest2() {
  return HasValue<TrieNode>::value;
}

bool trieNodeClassTest3() {
  return HasEnd<TrieNode>::value;
}

bool trieNodeClassTest4() {
  TrieNode *node = new TrieNode('a');
  bool testVal = !node->end;
  delete(node);
  return testVal;
}

bool trieNodeClassTest5() {
  TrieNode *node = new TrieNode('a');
  node->end = true;
  bool testVal = node->end;
  delete(node);
  return testVal;
}



bool trieClassTest1() {
  Trie *trie = new Trie();
  bool typeMatched = typeid(*trie).name() == typeid(Trie).name();
  delete(trie);
  return typeMatched;
}

bool trieClassTest2() {
  return HasRoot<Trie>::value;
}

bool trieClassTest3() {
  Trie *trie = new Trie();
  bool typeMatched = typeid(*trie->root).name() == typeid(TrieNode).name();
  delete(trie);
  return typeMatched;
}



bool trieInsertMethodTest1() {
  return HasInsert<Trie>::value;
}

bool trieInsertMethodTest2() {
  Trie *trie = new Trie();
  trie->insert("cat");
  bool testVal = trie->root->children.find('c') != trie->root->children.end()
      && trie->root->children['c']->children.find('a') != trie->root->children['c']->children.end()
      && trie->root->children['c']->children['a']->children.find('t') != trie->root->children['c']->children['a']->children.end()
      && (trie->root->children['c']->children['a']->children['t']->end);
  delete(trie);
  return testVal;
}

bool trieInsertMethodTest3() {
  Trie *trie = new Trie();
  trie->insert("cat");
  trie->insert("car");
  bool testVal = trie->root->children.find('c') != trie->root->children.end()
    && trie->root->children['c']->children.find('a') != trie->root->children['c']->children.end()
    && trie->root->children['c']->children['a']->children.find('t') != trie->root->children['c']->children['a']->children.end()
    && (trie->root->children['c']->children['a']->children['t']->end)
    && trie->root->children['c']->children['a']->children.find('r') != trie->root->children['c']->children['a']->children.end()
    && (trie->root->children['c']->children['a']->children['r']->end);
  delete(trie);
  return testVal;
}



bool trieIsWordMethodTest1() {
  return HasIsWord<Trie>::value;
}

bool trieIsWordMethodTest2() {
  Trie *trie = new Trie();
  bool testVal = !trie->isWord("");
  delete(trie);
  return testVal;
}

bool trieIsWordMethodTest3() {
  Trie *trie = new Trie();
  trie->insert("cat");
  bool testVal = trie->isWord("cat");
  delete(trie);
  return testVal;
}

bool trieIsWordMethodTest4() {
  Trie *trie = new Trie();
  trie->insert("cat");
  bool testVal =  !trie->isWord("car");
  delete(trie);
  return testVal;
}

bool trieIsWordMethodTest5() {
  Trie *trie = new Trie();
  trie->insert("cat");
  trie->insert("cats");
  bool testVal =  trie->isWord("cat");
  delete(trie);
  return testVal;
}

bool trieIsWordMethodTest6() {
  Trie *trie = new Trie();
  trie->insert("cat");
  trie->insert("cats");
  bool testVal = trie->isWord("cats");
  delete(trie);
  return testVal;
}

bool trieIsWordMethodTest7() {
  Trie *trie = new Trie();
  trie->insert("cats");
  bool testVal = !trie->isWord("cat");
  delete(trie);
  return testVal;
}



bool trieStartsWithMethodTest1() {
  return HasStartsWith<Trie>::value;
}

bool trieStartsWithMethodTest2() {
  Trie *trie = new Trie();
  trie->insert("cats");
  trie->insert("corner");
  trie->insert("cesium");
  vector<string> results = trie->startsWith("a");
  bool testVal = results.size() == 0;
  delete(trie);
  return testVal;
}

bool trieStartsWithMethodTest3() {
  Trie *trie = new Trie();
  trie->insert("cat");
  trie->insert("cats");
  trie->insert("catnip");
  trie->insert("car");
  trie->insert("cars");
  vector<string> results = trie->startsWith("car");
  bool testVal = typeid(results).name() == typeid(vector<string>).name() &&
        count(results.begin(),results.end(),"car") && count(results.begin(),results.end(),"cars");
  delete(trie);
  return testVal;
}

bool trieStartsWithMethodTest4() {
  Trie *trie = new Trie();
  trie->insert("cat");
  trie->insert("cats");
  trie->insert("catnip");
  trie->insert("car");
  trie->insert("cars");
  vector<string> results = trie->startsWith("ca");
  bool testVal = typeid(results).name() == typeid(vector<string>).name() &&
      count(results.begin(),results.end(),"cat")  && count(results.begin(),results.end(),"cats")  &&
      count(results.begin(),results.end(),"catnip")  && count(results.begin(),results.end(),"car")  &&
      count(results.begin(),results.end(),"cars");
  delete(trie);
  return testVal;
}

bool trieStartsWithMethodTest5() {
  Trie *trie = new Trie();
  trie->insert("cat");
  trie->insert("cats");
  trie->insert("catnip");
  trie->insert("foo");
  trie->insert("hello");
  trie->insert("hell");
  trie->insert("he");
  vector<string> results = trie->startsWith("");
  bool testVal = typeid(results).name() == typeid(vector<string>).name() &&
      count(results.begin(),results.end(),"cat")  && count(results.begin(),results.end(),"cats")  &&
      count(results.begin(),results.end(),"catnip")  && count(results.begin(),results.end(),"foo")  &&
      count(results.begin(),results.end(),"hello")  && count(results.begin(),results.end(),"hell")  &&
      count(results.begin(),results.end(),"he") ;
  delete(trie);
  return testVal;
}



bool trieRemoveMethodTest1() {
    return HasRemove<Trie>::value;
}

bool trieRemoveMethodTest2() {
    Trie *trie = new Trie();
    trie->insert("cat");
    trie->remove("cat");
    bool testVal = !trie->isWord("cat") && (trie->root->children.find('c') == trie->root->children.end());
    delete(trie);
    return testVal;
}

bool trieRemoveMethodTest3() {
    Trie *trie = new Trie();
    trie->insert("cat");
    trie->remove("c");
    bool testVal = trie->isWord("cat");
    delete(trie);
    return testVal;
}

bool trieRemoveMethodTest4() {
    Trie *trie = new Trie();
    trie->insert("hello");
    trie->insert("hell");
    trie->insert("he");
    trie->remove("hell");
    bool testVal = trie->isWord("he") && trie->isWord("hello") && !trie->isWord("hell");
    delete(trie);
    return testVal;
}

bool trieRemoveMethodTest5() {
    Trie *trie = new Trie();
    trie->insert("cat");
    trie->insert("cats");
    trie->insert("catnip");
    trie->remove("catnip");
    bool testVal = trie->isWord("cat") && trie->isWord("cats") && !trie->isWord("catnip") &&
           (trie->root->children['c']->children['a']->children['t']->children.find('n') == trie->root->children['c']->children['a']->children['t']->children.end());
    delete(trie);
    return testVal;
}


// this is to wrap the test and check for exceptions
void runTest (bool test(), string testName, int testCount[]){
  testCount[1]++;
  bool testPassed = test();
  if(testPassed) testCount[0]++;
  string result = "  " + (to_string(testCount[1]) + ")   ") + (testPassed ? "true" : "false") + " : " + testName;
  cout << result << endl;
}

// this is to print the number of test cases passed for a test suite function
void printTestsPassed(int testCount[]) {
  cout << "PASSED: " + to_string(testCount[0]) + " / " + to_string(testCount[1]) + "\n\n" <<endl;
}
