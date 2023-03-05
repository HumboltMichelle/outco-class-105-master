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

  // Time Complexity:
  // Auxiliary Space Complexity:
  func compare(_ parent: Int, _ child: Int) -> Bool {
   // YOUR WORK HERE
   return false
 }

 // Time Complexity:
 // Auxiliary Space Complexity:
 func insert(_ value: Int) {
   // YOUR WORK HERE
 }


 // Time Complexity:
 // Auxiliary Space Complexity:
 func peek() -> Int? {
   // YOUR WORK HERE
   return -1
 }

 // Time Complexity: O(log(N))
 // Auxiliary Space Complexity: O(1)
 // Time Complexity:
 // Auxiliary Space Complexity:
 func removePeak() -> Int? {
   // YOUR WORK HERE
   return -1
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
