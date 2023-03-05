/**
 *  Homework - Hash Table
 *
 *  Prompt: Create a hash table class using separate chaining.
 *
 *  The HashTable will have the following properties:
 *
 *         storage:  {Integer[]} - an array of array lists containing key-value pairs
 *                                   key-value pairs are String[]{key, value}
 *         buckets:  {Integer} - the maximum number of buckets that your
 *                   storage can contain. Initially set to 8.
 *           size:   {Integer} count of key-value pairs in the storage
 *
 *  The HashTable will also have the following methods:
 *
 *           hash:   Method that takes a key and bucket number and provides a
 *                   hashed value. The dbjb2 hashing function has been
 *                   provided.
 *
 *                   Input:      key {String}
 *                   Input:      buckets {Integer}
 *                   Output:     index {Integer}
 *
 *         insert:   Method that adds a key-value pair into the storage. If the
 *                   key already exists, the value should be updated. Use
 *                   separate chaining to handle collisions.
 *
 *                   Input:      key {String}
 *                   Input:      value {String}
 *                   Output:     {Void}
 *
 *            get:   Method that given a key, return its corresponding value.
 *                   If the key does not exist, return null.
 *
 *                   Input:      key {String}
 *                   Output:     value {String}
 *
 *         remove:   Method that takes a key as its input, and looks for the
 *                   and removes the key-value pair from the bucket.
 *
 *                   Input:      key {String}
 *                   Output:     {Void}
 *
 *         resize:   If the load factor reaches a critical 0.75 or higher,
 *                   double the number of buckets. If the load factor is 0.25
 *                   or less, half the number of buckets. Make sure the number
 *                   of buckets do not fall below 8 and re-index all key-value
 *                   pairs if bucket size is changed.
 *
 *                   Input:      key {String}
 *                   Output:     {Void}
 *
 *  Input: N/A
 *  Output: A HashTable instance
 */

package main
import (
  "fmt"
  "reflect"
  "strconv"
)


type HashTable struct {
  buckets int
  size int
  storage [][][]string
}

func (ht *HashTable) _initStorage() {
  ht.storage = make([][][]string, ht.buckets)
  for i := 0; i<ht.buckets; i++ {
    ht.storage[i] = [][]string{}
  }
}
func (ht *HashTable) Init() *HashTable {
  ht.buckets = 8
  ht.size = 0

  ht._initStorage()

  return ht
}


// Time Complexity: O(K) - where K is the length of the key
// Auxiliary Space Complexity: O(1)
func (ht *HashTable) hash(key string, buckets int) int {
  var hash int = 5381
  for i := 0; i < len(key); i++ {
    hash = ((hash << 5) + hash) + int(key[i])
  }
  return hash % buckets
}


// Time Complexity (amortized): O(K+N) - where K is the length of the key
// Auxiliary Space Complexity (amortized): O(1)
func (ht *HashTable) insert(key string, value string) {
  var index int = ht.hash(key, ht.buckets)
  if index > len(ht.storage) { return }

  var bucket *[][]string = &ht.storage[index]
  for i := 0; i < len(*bucket); i++ {
    if (*bucket)[i][0] == key {
      (*bucket)[i][1] = value
      return
    }
  }
  *bucket = append(*bucket, []string{key, value})
  ht.size++
  ht.resize()
}


// Time Complexity: O(K+N) - where K is the length of the key
// Auxiliary Space Complexity: O(1)
func (ht *HashTable) get(key string) string {
  var index int = ht.hash(key, ht.buckets)
  if index > len(ht.storage) { return "" }

  var bucket *[][]string = &ht.storage[index]
  // vector<vector<string>> &bucket = ht.storage[index];
  for i := 0; i < len(*bucket); i++ {
    if (*bucket)[i][0] == key {
      return (*bucket)[i][1]
    }
  }
  return ""
}


// Time Complexity (amortized): O(K+N) - where K is the length of the key
// Auxiliary Space Complexity (amortized): O(1)
func (ht *HashTable) remove(key string) {
  var index int = ht.hash(key, ht.buckets)
  if index > len(ht.storage) { return }

  var bucket *[][]string = &ht.storage[index]
  // vector<vector<string>> &bucket = ht.storage[index];
  for i := 0; i < len(*bucket); i++ {
    if (*bucket)[i][0] == key {
      *bucket = (*bucket)[:len(*bucket)-1]
      // bucket.erase(bucket.begin() + i);
      ht.size--
      ht.resize()
      return
    }
  }
}


// Time Complexity: O(N)
// Auxiliary Space Complexity: O(N)
func (ht *HashTable) resize() {
  var loadFactor float64 = float64(ht.size) / float64(ht.buckets)
  if loadFactor > 0.25 && loadFactor < 0.75 { return }
  if loadFactor <= 0.25 && ht.buckets == 8 { return }
  var temp [][][]string = ht.storage
  if(loadFactor >= 0.75) {
    ht.buckets = ht.buckets * 2
  } else {
    ht.buckets = ht.buckets / 2
  }

  ht._initStorage()

  for i := 0; i < len(temp); i++ {
    var bucket [][]string = temp[i]
    for j := 0 ; j < len(bucket); j++ {
      ht.size--
      ht.insert(bucket[j][0], bucket[j][1])
    }
  }
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

func main() {
  hashTableClassTests()
  hashTableHashMethodTests()
  hashTableInsertMethodTests()
  hashTableGetMethodTests()
  hashTableRemoveMethodTests()
  hashTableResizeMethodTests()
}

func hashTableClassTests() {
  testCount := []int{0,0}
  fmt.Println("HashTable Class")
  runTest(hashTableClassTest1, "able to create an instance", testCount)
  runTest(hashTableClassTest2, "has storage field", testCount)
  runTest(hashTableClassTest3, "has buckets field", testCount)
  runTest(hashTableClassTest4, "has size field", testCount)
  runTest(hashTableClassTest5, "default buckets set to 8", testCount)
  runTest(hashTableClassTest6, "default size set to 0", testCount)
  printTestsPassed(testCount)
}

func hashTableHashMethodTests() {
  testCount := []int{0,0}
  fmt.Println("HashTable Hash method")
  runTest(hashTableHashMethodTest1, "should hash a string in to a number less than bucket size", testCount)
  printTestsPassed(testCount)
}

func hashTableInsertMethodTests() {
  testCount := []int{0,0}
  fmt.Println("HashTable Insert method")
  runTest(hashTableInsertMethodTest1, "can insert a key-value pair into hash table", testCount)
  runTest(hashTableInsertMethodTest2, "can insert a second key-value pair into hashtable", testCount)
  runTest(hashTableInsertMethodTest3, "can overwrite value if key already exists", testCount)
  printTestsPassed(testCount)
}

func hashTableGetMethodTests() {
  testCount := []int{0,0}
  fmt.Println("HashTable Get method")
  runTest(hashTableGetMethodTest1, "should return correct value for existing input key", testCount)
  runTest(hashTableGetMethodTest2, "should return empty str if key does not exist", testCount)
  printTestsPassed(testCount)
}

func hashTableRemoveMethodTests() {
  testCount := []int{0,0}
  fmt.Println("HashTable Remove method")
  runTest(hashTableRemoveMethodTest1, "can remove a key-value pair", testCount)
  runTest(hashTableRemoveMethodTest2, "does not remove a key-pair that does not exist", testCount)
  printTestsPassed(testCount)
}

func hashTableResizeMethodTests() {
  testCount := []int{0,0}
  fmt.Println("HashTable Resize method")
  runTest(hashTableResizeMethodTest1, "doubles hashtable number of buckets if size exceeds 75% of the number of buckets", testCount)
  runTest(hashTableResizeMethodTest2, "halves hashtable number of buckets if size drops below 25% of the number of buckets", testCount)
  printTestsPassed(testCount)
}



func hashTableClassTest1() bool {
  hashTable := HashTable{}
	return reflect.TypeOf(hashTable) == reflect.TypeOf(HashTable{})
}

func hashTableClassTest2() bool {
  hashTable := HashTable{}
  return reflectStructField(hashTable, "storage")
}

func hashTableClassTest3() bool {
  hashTable := HashTable{}
  return reflectStructField(hashTable, "buckets")
}

func hashTableClassTest4() bool {
  hashTable := HashTable{}
  return reflectStructField(hashTable, "size")
}

func hashTableClassTest5() bool {
  hashTable := new(HashTable).Init()
  return hashTable.buckets == 8
}

func hashTableClassTest6() bool {
  hashTable := new(HashTable).Init()
  return hashTable.size == 0
}


func hashTableHashMethodTest1() bool {
  hashTable := new(HashTable).Init()
  // bool testVal = true;
  for i := 1; i < 100; i++ {
    index := hashTable.hash("hello", i)
    if index >= i {
      return false
    }
  }
  return true
}



func hashTableInsertMethodTest1() bool {
  hashTable := new(HashTable).Init()
  hashTable.insert("hello", "world")
  var index int = hashTable.hash("hello", hashTable.buckets)
  return hashTable.size == 1 && len(hashTable.storage[index]) == 1
}

func hashTableInsertMethodTest2() bool {
  hashTable := new(HashTable).Init()
  hashTable.insert("hello", "world")
  hashTable.insert("foo", "bar")
  var index1 int = hashTable.hash("hello", hashTable.buckets)
  var index2 int = hashTable.hash("foo", hashTable.buckets)
  if index1  >= len(hashTable.storage) || index2 >= len(hashTable.storage) { return false }
  var testBool bool = hashTable.size == 2
  testBool = testBool && (len(hashTable.storage[index1]) == 1 || len(hashTable.storage[index1]) == 2)
  testBool = testBool && (len(hashTable.storage[index2]) == 1 || len(hashTable.storage[index2]) == 2)
  return testBool
}

func hashTableInsertMethodTest3() bool {
  hashTable := new(HashTable).Init()
  hashTable.insert("hello", "world")
  hashTable.insert("hello", "universe")
  var index int = hashTable.hash("hello", hashTable.buckets)
  if index  >= len(hashTable.storage) { return false }
  return hashTable.size == 1 && len(hashTable.storage[index]) == 1
}



func hashTableGetMethodTest1() bool {
  hashTable := new(HashTable).Init()
  hashTable.insert("hello", "world")
  return hashTable.get("hello") == "world"
}

func hashTableGetMethodTest2() bool {
  hashTable := new(HashTable).Init()
  hashTable.insert("hello", "world")
  return len(hashTable.get("cat")) == 0
}


func hashTableRemoveMethodTest1() bool {
  hashTable := new(HashTable).Init()
  hashTable.insert("hello", "world")
  hashTable.remove("hello")
  var index int = hashTable.hash("hello", hashTable.buckets)
  return hashTable.size == 0 &&
    index < len(hashTable.storage) && len(hashTable.storage[index]) == 0
}

func hashTableRemoveMethodTest2() bool {
  hashTable := new(HashTable).Init()
  hashTable.insert("hello", "world")
  hashTable.remove("cat")
  var index int = hashTable.hash("hello", hashTable.buckets)

  return hashTable.size == 1 &&
    index < len(hashTable.storage) && len(hashTable.storage[index]) == 1
}



func hashTableResizeMethodTest1() bool {
  hashTable := new(HashTable).Init()
  keys := []string{"zero", "one", "two", "three", "four", "five", "six"}
  values := []string{"0", "1", "2", "3", "4", "5", "6"}
  for i := 0; i < 5; i++ {
    hashTable.insert(keys[i], values[i])

    if hashTable.buckets != 8 {
      return false
    }
  }

  hashTable.insert(keys[5], values[5])
  if hashTable.buckets != 16 {
    return false
  }
  hashTable.insert(keys[6], values[6])

  return hashTable.buckets == 16
}

func hashTableResizeMethodTest2() bool {
  hashTable := new(HashTable).Init()
  keys := []string{"zero", "one", "two", "three", "four", "five", "six"}
  values := []string{"0", "1", "2", "3", "4", "5", "6"}
  for i := 0; i < 6; i++ {
    hashTable.insert(keys[i], values[i])
  }
  var buckets int = hashTable.buckets
  hashTable.remove("four")
  hashTable.remove("five")
  hashTable.remove("six")
  return buckets == hashTable.buckets * 2
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
