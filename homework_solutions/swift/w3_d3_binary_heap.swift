/**
 *  Homework - Binary Heap
 *
 *  Prompt: Create a Binary Heap class
 *
 *  The Heap will take in the following input:
 *
 *            type:   String - 'min' for minheap, 'max' for maxheap
 *
 *  The Heap will have the following properties:
 *
 *         storage:   [Int] - storage of integers within heap
 *            type:   String - idicates whether heap is a minheap or maxheap
 *
 *  The Heap will have the following methods:
 *
 *        compare:   compares two input numbers and returns if the heap
 *                   condition is met.
 *
 *                   Input:      parent: Int - index at parent
 *                   Input:      child: Int - index at child
 *                   Output:     Bool
 *
 *         insert:   inserts a number into the heap.
 *
 *                    Input:     Int
 *                   Output:     Void
 *
 *           peek:   returns the top item in the heap but does not remove it
 *
 *                   Input:      N/A
 *                   Output:     Int?
 *
 *         removePeak:   removes the top element from the heap and returns it
 *
 *                    Input:     N/A
 *                   Output:     Int?
 */

class Heap {
  var storage = [Int]()
  var type: String

  init(_ type: String) {
    self.type = type == "min" ? "min" : "max"
  }

  init() {
    self.type = "min"
  }

  // Time Complexity: O(1)
  // Auxiliary Space Complexity: O(1)
  func compare(_ parent: Int, _ child: Int) -> Bool {
   if type == "min" { return storage[parent] <= storage[child] }
   return storage[parent] > storage[child]
 }

 // Time Complexity: O(log(N))
 // Auxiliary Space Complexity: O(1)
 func insert(_ value: Int) {
   storage.append(value)
   bubbleUp()
 }


 // Time Complexity: O(1)
 // Auxiliary Space Complexity: O(1)
 func peek() -> Int? {
   return storage.count > 0 ? storage[0] : nil
 }

 // Time Complexity: O(log(N))
 // Auxiliary Space Complexity: O(1)
 func removePeak() -> Int? {
   if (storage.count == 0) { return nil }
   swap(0, storage.count - 1)
   let result = storage.removeLast()
   bubbleDown()
   return result
 }

 // Helper methods
 func swap(_ a: Int, _ b: Int) {
   (storage[a], storage[b]) = (storage[b], storage[a])
 }

 func getParent(_ child: Int) -> Int {
   return (child - 1) / 2
 }

 func getChild(_ parent: Int) -> Int {
   let left: Int = parent * 2 + 1;
   if (left >= storage.count - 1 || compare(left, left + 1)) {
     return left;
   }
   return left + 1;
 }

 func bubbleUp() {
   var child: Int = storage.count - 1
   var parent: Int = getParent(child)

   while child > 0 && !compare(parent, child) {
     swap(parent, child)
     child = parent
     parent = getParent(child)
   }
 }

 func bubbleDown() {
   var parent: Int = 0
   var child: Int = getChild(parent)

   while child < storage.count && !compare(parent, child) {
     swap(parent, child)
     parent = child
     child = getChild(parent)
   }
 }
}




////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////


func assert(_ count: inout [Int], _ name: String, _ test: () -> Bool) {
  if count.count != 2 {
    count = [0, 0]
  } else {
    count[1] = count[1] + 1
  }

  var pass: String = "false"

  if test() {
    pass = " true"
    count[0] = count[0] + 1
  }
  print(count[1], ")   ", pass, ":", name)
}


print("Heap Class")
var testCount = [0, 0]

assert(&testCount, "has storage property",  {
  let heap = Heap()
  return heap.storage == [Int]()
})

assert(&testCount, "has type property min by default",  {
  let heap = Heap()
  return heap.type == "min"
})

assert(&testCount, "can set type property to max",  {
  let heap = Heap("max")
  return heap.type == "max"
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("Heap compare method")
testCount = [0, 0]

assert(&testCount, "returns true for minheap if element at first argument index is less than element at second argument index", {
 let heap = Heap()
 heap.storage.append(1)
 heap.storage.append(10)
 return heap.compare(0, 1) == true
})

assert(&testCount, "returns false for minheap if element at first argument index is greater than element at second argument index", {
 let heap = Heap()
 heap.storage.append(10)
 heap.storage.append(1)
 return heap.compare(0, 1) == false
})

assert(&testCount, "return true for maxheap if element at first argument index is greater than element at second argument index", {
 let heap = Heap("max")
 heap.storage.append(10)
 heap.storage.append(1)
 return heap.compare(0, 1) == true
})

assert(&testCount, "return false for maxheap if element at first argument index is less than element at second argument index", {
 let heap = Heap("max")
 heap.storage.append(1)
 heap.storage.append(10)
 return heap.compare(0, 1) == false
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("Heap insert method")
testCount = [0, 0]

assert(&testCount, "should be able to insert a single element", {
 let heap = Heap()
 heap.insert(5)
 return heap.storage.count > 0 && heap.storage[0] == 5
})

assert(&testCount, "minimum value should be on top of a minheap", {
 let heap = Heap()
 heap.insert(5)
 heap.insert(10)
 heap.insert(7)
 heap.insert(1)
 heap.insert(8)
 heap.insert(6)
 return heap.storage.count > 0 && heap.storage[0] == 1
})

assert(&testCount, "maximum value should be on top of a maxheap", {
 let heap = Heap("max")
 heap.insert(5)
 heap.insert(10)
 heap.insert(7)
 heap.insert(1)
 heap.insert(8)
 heap.insert(6)
 return heap.storage.count > 0 && heap.storage[0] == 10
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("Heap peek method")
testCount = [0, 0]

assert(&testCount, "should return the top element of the heap", {
 let heap = Heap()
 heap.storage.append(1)
 return heap.peek()! == 1
})

assert(&testCount, "should return nil if the heap is empty", {
 let heap = Heap()
 return heap.peek() == nil
})

assert(&testCount, "should return the smallest element for a minheap", {
 let heap = Heap()
 heap.insert(2)
 heap.insert(5)
 heap.insert(10)
 heap.insert(1)
 return heap.peek() == 1
})

assert(&testCount, "should return the largest element for a maxheap", {
 let heap = Heap("max")
 heap.insert(2)
 heap.insert(5)
 heap.insert(10)
 heap.insert(1)
 return heap.peek() == 10
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("Heap removePeak method")
testCount = [0, 0]

assert(&testCount, "should be able to remove a single element", {
 let heap = Heap()
 heap.insert(5)
 let min = heap.removePeak()
 return heap.storage.count == 0 && min == 5
})

assert(&testCount, "should return nil if the heap is empty", {
 let heap = Heap()
 return heap.removePeak() == nil
})

assert(&testCount, "should be able to remove and return min", {
 let heap = Heap("min")
 heap.storage = [1, 2, 7, 4, 9, 10, 8, 6]
 let min = heap.removePeak()
 return min == 1 && heap.peek() == 2
})

assert(&testCount, "should be able to remove and return max", {
 let heap = Heap("max")
 heap.storage = [10, 9, 6, 8, 3, 5, 2, 7]
 let max = heap.removePeak()
 return max == 10 && heap.peek() == 9
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
