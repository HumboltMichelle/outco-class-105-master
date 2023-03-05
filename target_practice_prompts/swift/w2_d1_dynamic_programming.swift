/*
 *  Target Practice - Dynamic Programming pt. 2
 */

/*
 * Minimum Window Substring (Sliding Window)
 *
 * Given a string, and a set of characters
 * return the substring representing the SMALLEST
 * window containing those characters.
 *
 * The characters needn't appear in the order in which they are given.
 *
 * If not all the characters are present in the string, return the empty string.
 *
 *
 * Input: str   (String)
 *        chars (String)
 *
 * Output: {String}
 *
 *
 * Example:
 *  Input: "ADOBECODEBANC", "ABC"
 *  Output: "BANC"
 *
 *  Input: "HELLO WORLD", "FOO"
 *  Output: ""
 *
 *
 * Explanation:
 *   Though there are many substrings containing all the characters
 *   "BANC" is the shortest.
 *
 * Assume that there won't be repeated characters in the second string input.
 *
 * Ignore capitalization.
 * (though taking it into account doesn't change the solution much)
 *
 * But as extra credit, how would you handle repeats?
 * Meaning if you were given two "A" characters, a valid window MUST
 * contain two "A"s
 *
 *
 */


 // Time Complexity:
 // Auxiliary Space Complexity:

 func minimumWindowSubstring(_ str: String, _ chars: String) -> String {
   // YOUR WORK HERE
   return ""
 }



/*
 *  Problem: Dungeon Escape
 *
 *          Given a matrix of integers that represents rooms in a dungeon,
 *          determine the minimum amount of health a adventurer must start with
 *          in order to escape the dungeon
 *
 *          The adventurer starts at the upper left corner of the matrix, and
 *          the exit is located at the bottom right corner.
 *
 *          The adventurer must leave the dungeon before sundown, so in the
 *          interest of time, this brave adventurer decides to only travel
 *          downwards and to the right
 *
 *          Negative integers represent rooms with monsters, so the adventurer
 *          would lose health when going though these rooms. 0s represent empty
 *          rooms, and positive integers represent rooms that contain health
 *          pots that will increase the adventurer's health
 *
 *
 *  Input:  dungeon {Integer[][]}
 *  Output: {Integer}
 *
 *
 * Example:
 *  Input:  [[ -2, -5, 10],
 *           [ -3,-10, 30],
 *           [  3,  1, -5]]
 *
 *  Output: 7 (The steps to do this would be down, down, right, right)
 *
 *
 *    Note: The initial health should be represented by a positve integers
 *          If the health ever drops to zero or a negative integer, the
 *          adventurer dies.
 *          Every room will contain an integer. It will either be empty (0),
 *          contain a monster (negative), or contain a health pot (positive).
 *          You could create every single possible path, but there is of course
 *          a dynamic programming approach to not go with this route.
 *
 */


 // Time Complexity:
 // Auxiliary Space Complexity:

 func escape(_ dungeon: inout [[Int]]) -> Int {
   // YOUR WORK HERE
   return -1
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



print("Minimum Window Substring Tests")
var testCount: [Int] = [0,0]

assert(&testCount, "should work on the example case", {
  return minimumWindowSubstring("ADOBECODEBANC", "ABC") == "BANC"
})

assert(&testCount, "should return the first occurrence of a match", {
  return minimumWindowSubstring("ADOBECODEBANC", "DB") == "DOB"
})

assert(&testCount, "should work when the characters are not present", {
  return minimumWindowSubstring("HELLO WORLD", "FOO") == ""
})


print("PASSED: ", testCount[0], "/", testCount[1], "\n\n")

print("Escape Dungeon Tests")
testCount = [0,0]

 assert(&testCount, "should work for first example case", {
   var example = [[ -2, -5, 10],
                  [ -3,-10, 30],
                  [  3,  1, -5]]
   let test = escape(&example)
   return test == 7
 })

 assert(&testCount, "should work for dungeon filled solely with health potions", {
   var example = [[  5,  1, 10],
                  [ 10,312, 30],
                  [  3,  1,  7]]
   let test = escape(&example)
   return test == 1
 })

 assert(&testCount, "should work for an empty dungeon", {
   var example = [[  0,  0,  0],
                  [  0,  0,  0],
                  [  0,  0,  0]]
   let test = escape(&example)
   return test == 1
 })

 assert(&testCount, "should work for a dungeon filled only with monsters", {
   var example = [[ -3, -6,-13],
                  [-12, -1, -7],
                  [ -5,-11, -2]]
   let test = escape(&example)
   return test == 20
 })

 assert(&testCount, "should work for a two-room dungeon starting with a monster", {
   var example = [[-2, 5]]
   let test = escape(&example)
   return test == 3
 })

 assert(&testCount, "should work for a two-room dungeon starting with a strong monster", {
   var example = [[-13, 5]]
   let test = escape(&example)
   return test == 14
 })

 assert(&testCount, "should work for a two-room dungeon starting with a health pot", {
   var example = [[5, -2]]
   let test = escape(&example)
   return test == 1
 })

 assert(&testCount, "should work for a two-room dungeon ending in a strong monster", {
   var example = [[5, -8]]
   let test = escape(&example)
   return test == 4
 })

 assert(&testCount, "should work a dungeon with only a monster", {
   var example = [[-14]]
   let test = escape(&example)
   return test == 15
 })

 assert(&testCount, "should work a dungeon with only a health pot", {
   var example = [[6]]
   let test = escape(&example)
   return test == 1
 })

 assert(&testCount, "should work a dungeon with a single empty room", {
   var example = [[0]]
   let test = escape(&example)
   return test == 1
 })

 print("PASSED: ", testCount[0], "/", testCount[1], "\n\n")
