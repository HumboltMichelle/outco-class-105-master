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

 package main
 import (
   "fmt"
   "reflect"
   "strconv"
 )

 // DO NOT EDIT
 // TrieNode class
type TrieNode struct {
  value rune
  children map[rune]*TrieNode
  endOfWord bool
}

func (node *TrieNode)  Init(value rune) *TrieNode {
  node.value = value
  node.children = make(map[rune]*TrieNode)
  node.endOfWord = false
  return node
}

type Trie struct {
  root *TrieNode
}

func (trie *Trie) Init() *Trie {
  trie.root = new(TrieNode).Init(0)
  return trie
}

func (trie *Trie) insert(word string) bool {
  // YOUR WORK HERE
  return false
}

func (trie *Trie) isWord(word string) bool {
  // YOUR WORK HERE
  return false
}

func (trie *Trie) startsWith(prefix string) []string {
  // YOUR WORK HERE
  return []string{}
}

func (trie *Trie) remove(word string) {
  // YOUR WORK HERE
}





////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

func main() {
  trieNodeClassTests()
  trieClassTests()
  trieInsertMethodTests()
  trieIsWordMethodTests()
  trieStartsWithMethodTests()
  trieRemoveMethodTests()
}

func trieNodeClassTests() {
  testCount := []int{0,0}
  fmt.Println("TrieNode Class")
  runTest(trieNodeClassTest1, "able to create an instance", testCount)
  runTest(trieNodeClassTest2, "has value property", testCount)
  runTest(trieNodeClassTest3, "has endOfWord property", testCount)
  runTest(trieNodeClassTest4, "endOfWord property instatiated to false", testCount)
  runTest(trieNodeClassTest5, "able to assign a end upon instantiation", testCount)
  printTestsPassed(testCount)
}

func trieClassTests() {
  testCount := []int{0,0}
  fmt.Println("Trie Class")
  runTest(trieClassTest1, "able to create an instance", testCount)
  runTest(trieClassTest2, "has root property", testCount)
  runTest(trieClassTest3, "root property is a TrieNode", testCount)
  printTestsPassed(testCount)
}

func trieInsertMethodTests() {
  testCount := []int{0,0}
  fmt.Println("Trie Insert Method")
  runTest(trieInsertMethodTest1, "able to insert a word into empty trie", testCount)
  runTest(trieInsertMethodTest2, "able to insert words that overlap into trie", testCount)
  printTestsPassed(testCount)
}

func trieIsWordMethodTests() {
  testCount := []int{0,0}
  fmt.Println("Trie IsWord Method")
  runTest(trieIsWordMethodTest1, "should return false for an empty string as input", testCount)
  runTest(trieIsWordMethodTest2, "should return true for a word that exists", testCount)
  runTest(trieIsWordMethodTest3, "should return false for a word that does not exist", testCount)
  runTest(trieIsWordMethodTest4, "should return true for a word that exists within a larger word", testCount)
  runTest(trieIsWordMethodTest5, "should return true for a word that is a larger word", testCount)
  runTest(trieIsWordMethodTest6, "should return false if a smaller word was not added, but exists in a larger word", testCount)
  printTestsPassed(testCount)
}

func trieStartsWithMethodTests() {
  testCount := []int{0,0}
  fmt.Println("Trie StartsWith Method")
  runTest(trieStartsWithMethodTest1, "returns nil if no words start with input", testCount)
  runTest(trieStartsWithMethodTest2, "returns correct prefixes including input that is a word", testCount)
  runTest(trieStartsWithMethodTest3, "returns the correct prefixes", testCount)
  runTest(trieStartsWithMethodTest4, "returns all words if input is empty string", testCount)
  printTestsPassed(testCount)
}

func trieRemoveMethodTests() {
  testCount := []int{0,0}
  fmt.Println("Trie Remove Method")
  runTest(trieRemoveMethodTest1, "removes a word that exists", testCount)
  runTest(trieRemoveMethodTest2, "does not remove a word that does not exist", testCount)
  runTest(trieRemoveMethodTest3, "does not remove letters at that belong to a longer word", testCount)
  runTest(trieRemoveMethodTest4, "removes letters from longer word and keeps shorter letters", testCount)
  printTestsPassed(testCount)
}


func trieNodeClassTest1() bool {
  node := TrieNode{}
	return reflect.TypeOf(node) == reflect.TypeOf(TrieNode{})
}

func trieNodeClassTest2() bool {
  node := TrieNode{}
  return reflectStructField(node, "value")
}

func trieNodeClassTest3() bool {
  node := TrieNode{}
  return reflectStructField(node, "endOfWord")
}

func trieNodeClassTest4() bool {
  node := new(TrieNode).Init('a')
  return node.endOfWord == false
}

func trieNodeClassTest5() bool {
  node := new(TrieNode).Init('a')
  node.endOfWord = true
  return node.endOfWord == true
}


func trieClassTest1() bool {
  trie := Trie{}
  return reflect.TypeOf(trie) == reflect.TypeOf(Trie{})
}

func trieClassTest2() bool {
  trie := new(Trie).Init()
  return reflectStructField(trie, "root")
}

func trieClassTest3() bool {
  trie := new(Trie).Init()
  return reflect.TypeOf(*trie.root) == reflect.TypeOf(TrieNode{})
}



func trieInsertMethodTest1() bool {
  trie := new(Trie).Init()
  trie.insert("cat")
  return trie.root.children['c'] != nil &&
    trie.root.children['c'].children['a'] != nil &&
    trie.root.children['c'].children['a'].children['t'] != nil &&
    trie.root.children['c'].children['a'].children['t'].endOfWord
}

func trieInsertMethodTest2() bool {
  trie := new(Trie).Init()
  trie.insert("cat")
  trie.insert("car")
  return trie.root.children['c'] != nil &&
    trie.root.children['c'].children['a'] != nil &&
    trie.root.children['c'].children['a'].children['t'] != nil &&
    trie.root.children['c'].children['a'].children['t'].endOfWord &&
    trie.root.children['c'].children['a'].children['r'] != nil &&
    trie.root.children['c'].children['a'].children['r'].endOfWord
}


func trieIsWordMethodTest1() bool {
  trie := new(Trie).Init()
  return trie.isWord("") == false
}

func trieIsWordMethodTest2() bool {
  trie := new(Trie).Init()
  trie.insert("cat")
  return trie.isWord("cat") == true
}

func trieIsWordMethodTest3() bool {
  trie := new(Trie).Init()
  trie.insert("cat")
  return trie.isWord("car") == false
}

func trieIsWordMethodTest4() bool {
  trie := new(Trie).Init()
  trie.insert("cat")
  trie.insert("cats")
  return trie.isWord("cat") == true
}

func trieIsWordMethodTest5() bool {
  trie := new(Trie).Init()
  trie.insert("cat")
  trie.insert("cats")
  return trie.isWord("cats") == true
}

func trieIsWordMethodTest6() bool {
  trie := new(Trie).Init()
  trie.insert("cats")
  return trie.isWord("cat") == false
}



func trieStartsWithMethodTest1() bool {
  trie := new(Trie).Init()
  trie.insert("cats")
  trie.insert("corner")
  trie.insert("cesium")
  var results []string = trie.startsWith("a")
  return results == nil
}

func trieStartsWithMethodTest2() bool {
  trie := new(Trie).Init()
  trie.insert("cat")
  trie.insert("cats")
  trie.insert("catnip")
  trie.insert("car")
  trie.insert("cars")
  var results []string = trie.startsWith("car")
  return len(results) > 0 && results[0] == "car" && results[1] == "cars"
}

func trieStartsWithMethodTest3() bool {
  trie := new(Trie).Init()
  trie.insert("cat")
  trie.insert("cats")
  trie.insert("catnip")
  trie.insert("car")
  trie.insert("cars")
  var results []string = trie.startsWith("ca")
  return strArrIndexOf(results,"cat") != -1 &&
    strArrIndexOf(results,"cats") != -1 &&
    strArrIndexOf(results,"catnip") != -1 &&
    strArrIndexOf(results,"car") != -1 && strArrIndexOf(results,"cars") != -1
}

func trieStartsWithMethodTest4() bool {
  trie := new(Trie).Init()
  trie.insert("cat")
  trie.insert("cats")
  trie.insert("catnip")
  trie.insert("foo")
  trie.insert("hello")
  trie.insert("hell")
  trie.insert("he")
  var results []string = trie.startsWith("")
  return strArrIndexOf(results,"cat") != -1 && strArrIndexOf(results,"cats") != -1 &&
    strArrIndexOf(results,"catnip") != -1 && strArrIndexOf(results,"foo") != -1 &&
    strArrIndexOf(results,"hello") != -1 && strArrIndexOf(results,"hell") != -1 &&
    strArrIndexOf(results,"he") != -1
}



func trieRemoveMethodTest1() bool {
  trie := new(Trie).Init()
  trie.insert("cat")
  trie.remove("cat")
  return trie.isWord("cat") == false &&
    trie.root.children['c'] == nil
}

func trieRemoveMethodTest2() bool {
  trie := new(Trie).Init()
  trie.insert("cat")
  trie.remove("c")
  return trie.isWord("cat") == true
}

func trieRemoveMethodTest3() bool {
  trie := new(Trie).Init()
  trie.insert("hello")
  trie.insert("hell")
  trie.insert("he")
  trie.remove("hell")
  return trie.isWord("he") == true &&
         trie.isWord("hello") == true &&
         trie.isWord("hell") == false
}

func trieRemoveMethodTest4() bool {
  trie := new(Trie).Init()
  trie.insert("cat")
  trie.insert("cats")
  trie.insert("catnip")
  trie.remove("catnip")
  return trie.isWord("cat") == true &&
     trie.isWord("cats") == true &&
     trie.isWord("catnip") == false &&
     trie.root.children['c'] != nil &&
     trie.root.children['c'].children['a'] != nil &&
     trie.root.children['c'].children['a'].children['t'] != nil &&
     trie.root.children['c'].children['a'].children['t'].children['n'] == nil
}

/*** Utility Functions ***/

// Reflect if an interface is either a struct or a pointer to a struct
// and has the defined member field, if error is nil, the given
// FieldName exists and is accessible with reflect.
// Source: https://mrwaggel.be/post/golang-reflect-if-initialized-struct-has-member-method-or-fields/
func reflectStructField(heap interface{}, fieldName string) bool {
	valueIface := reflect.ValueOf(heap)

	// Check if the passed interface is a pointer
	if valueIface.Type().Kind() != reflect.Ptr {
		// Create a new type of Iface's Type, so we have a pointer to work with
		valueIface = reflect.New(reflect.TypeOf(heap))
	}

	// 'dereference' with Elem() and get the field by name
	field := valueIface.Elem().FieldByName(fieldName)
  return field.IsValid()
}

func strArrIndexOf(arr []string, searchStr string) int {
  for i,str := range arr {
    if str == searchStr {
      return i
    }
  }
  return -1
}

func runTest(test func() bool, testName string, testCount []int) {
   testCount[1]++
   var testPassed bool = test()
   if(testPassed) {testCount[0]++}
   var result string = "  " + (strconv.Itoa(testCount[1]) + ")  ") + strconv.FormatBool(testPassed) + " : " + testName
   fmt.Println(result)
}

func printTestsPassed(testCount []int) {
  fmt.Println("PASSED: " + strconv.Itoa(testCount[0]) + " / " + strconv.Itoa(testCount[1]) + "\n\n")
}
