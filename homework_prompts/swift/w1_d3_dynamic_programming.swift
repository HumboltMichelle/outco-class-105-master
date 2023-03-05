/**
 *  Homework - Dynamic Programming
 *
 *
 *  Instructions: Dynamic programming takes a lot of practice to recognize as
 *                well as develop algorithms. Thus we will be working on a few
 *                different problems using dynamic programming.
 *
 */

/**
 *  1a. What are the two main requirements that determine whether a problem can
 *      be solved using dynamic programming? Explain what they mean.
 *
 * // YOUR WORK HERE
 */


/**
 *  1b. What is the top down approach to dynamic programming called?
 * // YOUR WORK HERE
 */


/**
 *  1c. What is the bottom up approach to dynamic programming called?
 * // YOUR WORK HERE
 */



 /*
  *  Lattice Paths (Dynamic Programming Approach)
  *
  *  Prompt:    Count the number of unique paths to travel from the top left
  *             to the bottom right of a lattice of squares.
  *
  *             NOTE: You are traveling along the **EDGES** of the lattice
  *
  *  Input:     An integer N (which is the width of the lattice)
  *             An integer M (which is the height of the lattice)
  *
  *  Output:    An interger (which represents the number of unique paths)
  *
  *  Example:   input: 2
  *
  *             (2 x 3 lattice of squares)
  *              __ __ __
  *             |__|__|__|
  *             |__|__|__|
  *
  *             output: 10 (number of unique paths from top left corner to bottom
  *                     right)
  *
  *             Diagram:
  *
  *             1__1__1__1
  *             |  |  |  |
  *             1__2__3__4
  *             |  |  |  |
  *             1__3__6__10
  *
  *  Notes:     What is the time and auxilliary space complexity of your solution?
  *
  *             When moving through the lattice, you can only move either down or
  *             to the right.
  *
  *             You did this problem before with recursion. Try implementing it
  *             now with dynamic programming!
  *
  *  Resources:
  *    1: https://projecteuler.net/problem=15
  *    2: https://en.wikipedia.org/wiki/Lattice_path
  *
  */

 // Time Complexity:
 // Auxiliary Space Complexity:
 func latticePaths(_ n: Int, _ m: Int) -> Int {
   // YOUR WORK HERE
   return -1
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

print("Lattice Paths Tests")
var testCount: [Int] = [0,0]


assert(&testCount, "should work for a 2 x 3 lattice",  {
  let example = latticePaths(2, 3)
  return example == 10
})

assert(&testCount, "should return the same for a 3 x 2 lattice",  {
  let example = latticePaths(3, 2)
  return example == 10
})

assert(&testCount, "should return 1 for a 0 x 0 lattice",  {
  let example = latticePaths(0, 0)
  return example == 1
})

assert(&testCount, "should work for a 10 x 10 lattice (square input)",  {
  let example = latticePaths(10, 10)
  return example == 184756
})

assert(&testCount, "should work for a 20 x 15 lattice (large input)",  {
  let example = latticePaths(20, 15)
  return example == 3247943160
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n");
