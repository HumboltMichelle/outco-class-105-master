/*

  Homework - LRU Cache

  Instructions: LRU Cache is a popular and challenging algorithm question
                commonly asked during whiteboarding and tech screen sessions.

                While difficult, this exercise is a good problem to test your
                ability to build and manipulate data structures.

                Design and implement a data structure for a Least Recently
                Used (LRU) Cache.

                This implementation involves a doubly linked list and a hash map.

          NOTE: A LRU caching scheme is designed to remove the least recently
                used item when a new item is added to the cache which is
                currently at or has just reached capacity.

                An item is considered to be recently used if it has just been
                accessed or added.

          I.  Node Class
              Create a Node class

              The Node class should contain the following properties:
              key: {string}
              value: {string}
              previous: {*Node} (initially null)
              next: {*Node} (initially null)

         II.  LRUCache Class
              Create an LRUCache class

              The LRUCache class should contain the following properties:
              capacity: {Integer}
              count: {Integer} (initially 0)
              cache: {Hash Table} The keys represent unique ids of each node,
                 and values represent pointers node objects that possess those keys.
              head: {*Node}
              tail: {*Node}

     Your LRU cache should have the following methods:

      Init(capacity): Constructor where you initialize the LRUCache data
              structure with a capacity, along with all other attributes as necessary

      get(key): Retreives a value from the cache at the key if the key
                exists in the cache, otherwise returns empty string ("").

      set(key,value): Inserts the value at the key or creates a new key:value entry
                if key is not present. When the cache reaches its capacity, it
                should invalidate the least recently used item before
                inserting a new item.

          HINT: Consider what data structure(s) might be neccessary to
                implement the LRU Cache

     Example:
     lruCache = new LRUCache(03);
     lruCache.set('doc', 'david');
     lruCache.set('cpo', 'joshua');
     lruCache.set('ceo', 'andy');

     lruCache.get('doc'); => 'david'
     lruCache.set('swe', 'ron');
     lruCache.get('cpo'); => ''

*/


package main
import (
  "fmt"
  "strconv"
  "reflect"
  "strings"
)


type Node struct {
  key string
  value string
  previous *Node
  next *Node
}


type LRUCache struct {
  capacity int
  count int
  cache map[string]*Node
  head *Node
  tail *Node
}

func (lruc *LRUCache) Init(capacity int) {
  lruc.capacity = capacity
  lruc.count = 0
  lruc.cache = make(map[string]*Node)
  lruc.head = new(Node)
  lruc.tail = new(Node)
  lruc.head.next = lruc.tail
  lruc.tail.previous = lruc.head
}


func (lruc *LRUCache) get(key string) string {
  var node *Node = lruc.cache[key]
  if node == nil {
    return "" // should raise exception here.
  }

  // move the accessed node to the head;
  lruc.moveToHead(node);

  return node.value
}


func (lruc *LRUCache) set(key string, value string) {
  var node *Node = lruc.cache[key]

  if node == nil {

    var newNode *Node = new(Node)
    newNode.key = key
    newNode.value = value

    lruc.cache[key] = newNode
    lruc.addNode(newNode)

    lruc.count++

    if lruc.count > lruc.capacity {
      // pop the tail
      var tail *Node = lruc.removeFromTail()
      delete(lruc.cache, tail.key)
      lruc.count--
    }
  } else{
    // update the value.
    node.value = value
    lruc.moveToHead(node)
  }
}



/*
Following are helper methods that will aid in
implementing the get and set methods for this
LRU Cache data structure
*/

/*
Insert a new node immediately following the
head node
*/
func (lruc *LRUCache) addNode(node *Node) {
  node.previous = lruc.head
  node.next = lruc.head.next

  lruc.head.next.previous = node
  lruc.head.next = node
}

/*
Remove an existing node from the linked list
*/
func (lruc *LRUCache) removeNode(node *Node) {
  var previous *Node = node.previous
  var next *Node = node.next

  previous.next = next
  next.previous = previous
}

/*
Move particular node from any position within
the linked list to the head of the linked
list
*/
func (lruc *LRUCache) moveToHead(node *Node) {
  lruc.removeNode(node)
  lruc.addNode(node)
}

/*
Remove the current tail
*/
func (lruc *LRUCache) removeFromTail() *Node {
  var res *Node = lruc.tail.previous
  lruc.removeNode(res)
  return res
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////


func main() {
  nodeClassTests()
  LRUCacheTests()
  LRUCacheMethodsTests()
}

func nodeClassTests() {
  testCount := []int{0,0}
  fmt.Println("Node Class")
  runTest(nodeClassTest1, "able to create an instance", testCount)
  runTest(nodeClassTest2, "has key property", testCount)
  runTest(nodeClassTest3, "has value property", testCount)
  runTest(nodeClassTest4, "has next property", testCount)
  runTest(nodeClassTest5, "has previous property", testCount)
  printTestsPassed(testCount)
}


func LRUCacheTests() {
  testCount := []int{0,0}
  fmt.Println("LRUCache Class")
  runTest(LRUCacheTest1, "able to create an instance", testCount)
  runTest(LRUCacheTest2, "has capacity property", testCount)
  runTest(LRUCacheTest3, "capacity property is an integer", testCount)
  runTest(LRUCacheTest4, "has count property", testCount)
  runTest(LRUCacheTest5, "count property is an integer", testCount)
  runTest(LRUCacheTest6, "has cache property", testCount)
  runTest(LRUCacheTest7, "cache property is a map", testCount)
  runTest(LRUCacheTest8, "has head property", testCount)
  runTest(LRUCacheTest9, "head property is a Node pointer", testCount)
  runTest(LRUCacheTest10, "has tail property", testCount)
  runTest(LRUCacheTest11, "tail property is a Node pointer", testCount)
  printTestsPassed(testCount)
}

func LRUCacheMethodsTests() {
  testCount := []int{0,0}
  fmt.Println("LRUCache Methods Tests")
  runTest(LRUCacheMethodsTest1, "should be able to set and get key-value pairs", testCount)
  runTest(LRUCacheMethodsTest2, "should be able to overwrite values with same keys when using set method", testCount)
  runTest(LRUCacheMethodsTest3, "old key value pairs should be removed when capacity has been exceeded", testCount)
  runTest(LRUCacheMethodsTest4, "most recently modified/viewed items should be moved to front of LRU cache while stale items are moved to end", testCount)
  runTest(LRUCacheMethodsTest5, "should be able to replace multiple stale items", testCount)
  printTestsPassed(testCount)
}



func nodeClassTest1() bool {
  node := Node{}
	return reflect.TypeOf(node) == reflect.TypeOf(Node{})
}


func nodeClassTest2() bool {
  node := Node{}
  return reflectStructField(node, "key")
}

func nodeClassTest3() bool {
  node := Node{}
  return reflectStructField(node, "value")
}

func nodeClassTest4() bool {
  node := Node{}
  return reflectStructField(node, "next")
}

func nodeClassTest5() bool {
  node := Node{}
  return reflectStructField(node, "previous")
}


func LRUCacheTest1() bool {
  lruc := LRUCache{}
	return reflect.TypeOf(lruc) == reflect.TypeOf(LRUCache{})
}

func LRUCacheTest2() bool {
    lruc := LRUCache{}
    return reflectStructField(lruc, "capacity")
}

func LRUCacheTest3() bool {
    lruc := LRUCache{}
    return reflect.ValueOf(lruc.capacity).Kind() == reflect.Int
}

func LRUCacheTest4() bool {
    lruc := LRUCache{}
    return reflectStructField(lruc, "count")
}

func LRUCacheTest5() bool {
    lruc := LRUCache{}
    return reflect.ValueOf(lruc.count).Kind() == reflect.Int
}

func LRUCacheTest6() bool {
    lruc := LRUCache{}
    return reflectStructField(lruc, "cache")
}

func LRUCacheTest7() bool {
  lruc := LRUCache{}
  t := fmt.Sprintf("%T", lruc.cache)
  return strings.HasPrefix(t, "map[")
}

func LRUCacheTest8() bool {
    lruc := LRUCache{}
    return reflectStructField(lruc, "head")
}

func LRUCacheTest9() bool {
  lruc := LRUCache{}
  t := fmt.Sprintf("%T", lruc.head)
  return strings.HasPrefix(t, "*main.Node")
}


func LRUCacheTest10() bool {
    lruc := LRUCache{}
    return reflectStructField(lruc, "tail")
}

func LRUCacheTest11() bool {
  lruc := LRUCache{}
  t := fmt.Sprintf("%T", lruc.tail)
  return strings.HasPrefix(t, "*main.Node")
}



func LRUCacheMethodsTest1() bool {
  lruCache := new(LRUCache)
  lruCache.Init(3)
  lruCache.set("doc", "david")
  lruCache.set("cpo", "joshua")
  lruCache.set("ceo", "andy")
  var example1 string = lruCache.get("doc")
  var example2 string = lruCache.get("cpo")
  var example3 string = lruCache.get("ceo")
  return example1 == "david" && example2 == "joshua" && example3 == "andy"
}

func LRUCacheMethodsTest2() bool{
  lruCache := new(LRUCache)
  lruCache.Init(3)
  lruCache.set("student", "henry")
  lruCache.set("student", "eliza")
  var example string = lruCache.get("student")
  return example == "eliza"
}

func LRUCacheMethodsTest3() bool {
  lruCache := new(LRUCache)
  lruCache.Init(3)
  lruCache.set("dentist", "akali")
  lruCache.set("doctor", "swain")
  lruCache.set("lawyer", "kennan")
  lruCache.set("judge", "leona")
  return lruCache.get("dentist") == "" && lruCache.get("doctor") == "swain"
}

func LRUCacheMethodsTest4() bool {
  lruCache := new(LRUCache)
  lruCache.Init(3)
  lruCache.set("doc", "david")
  lruCache.set("cpo", "joshua")
  lruCache.set("ceo", "andy")
  lruCache.get("doc")
  lruCache.set("swe", "ron")
  return lruCache.get("cpo") == "" && lruCache.get("swe") == "ron"
}

func LRUCacheMethodsTest5() bool {
  lruCache := new(LRUCache)
  lruCache.Init(3)
  lruCache.set("one", "hello")
  lruCache.set("two", "bye")
  lruCache.set("three", "blah")
  lruCache.set("four", "foo")
  lruCache.set("five", "fum")
  lruCache.set("six", "great")
  var ex1 string = lruCache.get("one")
  var ex2 string = lruCache.get("two")
  var ex3 string = lruCache.get("three")
  var ex4 string = lruCache.get("four")
  var ex5 string = lruCache.get("five")
  var ex6 string = lruCache.get("six")
  return ex1 == "" && ex2 == "" && ex3 == "" && ex4 == "foo" && ex5 == "fum" && ex6 == "great"
}


/*** Utility Functions ***/
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
