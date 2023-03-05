 /**
  *  Target Practice - Dynamic Programming
  *
  *
  *
  *  Instructions: Dynamic programming takes a lot of practice to recognize as
  *                well as develop algorithms. Thus we will be working on a few
  *                different problems using dynamic programming.
  *
  *                As a reminder, here are the two dynamic programing approaches:
  *
  *      			(1) Overlapping subproblems - Memoization
  *      				  Recursion sometimes call subproblems repeatedly. These repeated
  *                calls lead to inefficient computations and an exponential time
  *                complexity.
  *
  *      			(2) Optimal substructure - Tabulation
  *      					The solution of a larger problem can be solved using
  *      					solutions of its subproblems.
  */

  /*
  *  1. Coin Sum
  *
  *          Given an array of coins and a target total, return how many
  *          unique ways there are to use the coins to make up that total.
  *
  *  Input:  coins {Integer Array}, total {Integer}
  *  Output: {Integer}
  *
  *
  * Example:
  *  Input:  [1,2,3], 4
  *  Output: 4
  *
  *          1+1+1+1
  *          1+3
  *          1+1+2
  *          2+2
  *
  *
  *  Input:  [2,5,3,6], 10
  *  Output: 5
  *
  *          2+3+5
  *          5+5
  *          2+3+2+3
  *          2+2+6
  *          2+2+2+2+2
  *
  *    Note: You have an unlimited number of each coin type. All coins in the
  *          coin array will be unique
  *          Order does not matter. Ex: One penny and one nickel to create six
  *          cents is equivalent to one nickel and one penny
  *
  */


 // Time Complexity: O(NK)
 // Auxiliary Space Complexity: O(N)
 // where N refers to the target total, and K refers to the length of the coins
 // array
 func coinSum(_ coins: [Int], _ total: Int) -> Int {
   var table: [Int] = Array(repeating: 0, count: total + 1)
   table[0] = 1

   coins.forEach { coin in
      var i = coin
      while(i < table.count) {
        table[i] = table[i] + table[i - coin]
        i += 1
      }
   }

   return table[table.count - 1]
 }

 ////////////////////////////////////////////////////////////
 ///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
 ////////////////////////////////////////////////////////////

 // custom assert function to handle tests
 // input: count {Array} - keeps track out how many tests pass and how many total
 //        in the form of a two item array i.e., [0, 0]
 // input: name {String} - describes the test
 // input: test {Function} - performs a set of operations and returns a boolean
 //        indicating if test passed
 // output: {Void}
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


 print("Coin Sum Tests")
 var testCount : [Int] = [0, 0]


 assert(&testCount, "should work for first example case", {
   let test = coinSum([1,2,3], 4)
   return test == 4
 })

 assert(&testCount, "should work for second example case", {
   let test = coinSum([2,5,3,6], 10)
   return test == 5
 })

 assert(&testCount, "should work for a single coin", {
   let test = coinSum([2], 10)
   return test == 1
 })

 assert(&testCount, "should work when there is no solution", {
   let test = coinSum([7, 15], 20)
   return test == 0
 })

 assert(&testCount, "should work for variety of coins and large total", {
   let test = coinSum([78,10,4,22,44,31,60,62,95,37,28,11,17,67,33,3,65,9,26,52,25,69,41,57,93,70,96,5,97,48,50,27,6,77,1,55,45,14,72,87,8,71,15,59], 100)
   return test == 3850949
 })

 print("PASSED: ", testCount[0], "/", testCount[1], "\n\n")
