/**
 *  Target Practice - Heapsort
 *
 *  NOTE: In-place means to manipulate the input array rather than create a
 *        new array.
 *
 *  Input:  arr: [Int]
 *  Output: [Int]
 *
 *  Example: heapsort([4, 15, 16, 50, 8, 23, 42, 108])
 *           //[4, 8, 15, 16, 23, 42, 50, 108]
 */

// Worse Time Complexity: O(Nlog(N))
// Worse Auxiliary Space Complexity: O(1)
// Average Time Complexity: O(Nlog(N))
// Average Auxiliary Space Complexity: O(1)

func heapsort(_ arr: inout [Int]) -> [Int] {
 var heapLength = 1;

 func getParent(_ child: Int) -> Int {
   return (child - 1) / 2
 }

 func getChild(_ parent: Int) -> Int {
   let leftChild = parent * 2 + 1;
   if leftChild >= heapLength - 1 || arr[leftChild] >= arr[leftChild + 1] {
    return leftChild
   }
   return leftChild + 1
 }

 func bubbleUp() {
   var child = heapLength - 1
   var parent = getParent(child)
   while child > 0 && arr[parent] < arr[child] {
     (arr[parent], arr[child]) = (arr[child], arr[parent])
     child = parent
     parent = getParent(child)
   }
 }

 func bubbleDown() {
   var parent = 0
   var child = getChild(parent)
   while child < heapLength && arr[parent] < arr[child] {
     (arr[parent], arr[child]) = (arr[child], arr[parent])
     parent = child
     child = getChild(parent)
   }
 }

 func insert() {
   heapLength += 1
   bubbleUp()
 }

 func remove() {
 (arr[0], arr[heapLength - 1]) = (arr[heapLength - 1], arr[0])
   heapLength -= 1
   bubbleDown()
 }

 while heapLength < arr.count {
  insert()
 }
 while heapLength > 1 {
  remove()
 }
 return arr
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

func arraysEqual(_ arr1: [Int], _ arr2: [Int]) -> Bool {
  if arr1.count != arr2.count {
    return false
  }
  for i in 0..<arr1.count {
    if arr1[i] != arr2[i] {
      return false
    }
  }
  return true
}


print("Heapsort Sort Tests")
var testCount : [Int] = [0,0]

assert(&testCount, "should sort [3,9,1,4,7]",  {
  var arr = [3,9,1,4,7]
  let test = heapsort(&arr)
  return arraysEqual(test, [1,3,4,7,9])
})

assert(&testCount, "should return empty array for empty input",  {
  var arr = [Int]()
  let test = heapsort(&arr)
  return arraysEqual(test, [])
})

assert(&testCount, "should sort single-element input",  {
  var arr = [10]
  let test = heapsort(&arr)
  return arraysEqual(test, [10])
})

assert(&testCount, "should sort moderate-sized input",  {
  var arr = [Int]()
  for _ in 1..<1000 {
    arr.append(Int.random(in: 0..<1000))
  }
  var arr2 = arr
  let test = heapsort(&arr2)
  return arraysEqual(test, arr.sorted())
})

assert(&testCount, "should sort large input",  {
  var arr = [Int]()
  for _ in 1..<1000000 {
    arr.append(Int.random(in: 0..<1000000))
  }
  var arr2 = arr
  let test = heapsort(&arr2)
  return arraysEqual(test, arr.sorted())
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n");
