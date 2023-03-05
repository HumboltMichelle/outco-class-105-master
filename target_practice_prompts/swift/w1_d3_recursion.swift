/*
*  Target Practice -  Recursion
*
*  Problem 1:  Powerset
*
*  Prompt:   Given a set S, return the power set P(S), which is
*           a set of all subsets of S.
*
*  Input:    A String
*  Output:   An Array of Strings representing the power set of the input
*
*  Example:  S = "abc", P(S) = ["", "a", "b","c","ab","ac","bc","abc"]
*
*  Note:     The input string will not contain duplicate characters
*           The letters in the subset string must be in the same order
*           as the original input.
*  Hints:
*
*  From Cracking the Coding Interview, by Gayle Laakmann McDowell. 8.4: Powerset
*
*  #273. How can you build all subsets of {a , b, c} from the subsets of {a , b}?
*
*  #290. Anything that is a subset of {a , b} is also a subset of {a , b , c}. Which sets are
*  subsets of {a , b , c} but not {a , b}?
*
*  #338. Subsets that contain c will be subsets {a , b , c} but not {a , b}. Can you build these
*  subsets from the subsets of (a , b}?
*
*  #354. You can build the remaining subsets by adding c to all the subsets of {a , b).
*
*  #373. You can also do this by mapping each subset to a binary number. The i th bit could
*  represent a "boolean" flag for whether an element is in the set.
*
*/

func powerSet(_ str: String) -> [String] {
    // YOUR WORK HERE
    return [String]()
}

/*
*  Problem 2: Lattice Paths
*
*  Prompt:  Count the number of unique paths to travel from the top left
*           corder to the bottom right corner of a lattice of M x N squares.
*
*           When moving through the lattice, one can only travel to the adjacent
*           corner on the right or down.
*
*  Input:   M {Integer} - rows of squares
*  Input:   N {Integer} - column of squares
*  Output:  {Integer}
*
*  Example: input: (2, 3)
*
*           (2 x 3 lattice of squares)
*            __ __ __
*           |__|__|__|
*           |__|__|__|
*
*           output: 10 (number of unique paths from top left corner to bottom right)
*
*  Resource: https://projecteuler.net/problem=15
*
*/


// Time Complexity:
// Auxiliary Space Complexity:
func latticePaths(_ m: Int=0, _ n: Int=0) -> Int {
  // YOUR WORK HERE
  return -1
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////


//TESTING FUNCTIONS - DO NOT EDIT
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

func arraysMatching<T: Hashable>(_ arr1: inout [T], _ arr2: inout [T]) -> Bool {
  if arr1.count != arr2.count {
    return false
  }

  var cache = [T: Int]()
  for val1 in arr1 {
    if cache[val1] == nil {
      cache[val1] = 1
    }  else {
      cache[val1] = cache[val1]! + 1
    }
  }

  for val2 in arr2 {
    if cache[val2] == nil || cache[val2] == 0 {
      return false
    }
    cache[val2] = cache[val2]! - 1
  }
  return true
}


print("Powerset Tests")
var testCount: [Int] = [0,0]

assert(&testCount, "should work on example input",  {
  var example = powerSet("abc")
  var test = ["", "a", "b", "c", "ab", "bc", "ac", "abc"]
  return arraysMatching(&example, &test)
})

assert(&testCount, "should work on empty input", {
  var example = powerSet("")
  var test = [""]
  return arraysMatching(&example, &test)
});

assert(&testCount, "should work on two-letter input", {
  var example = powerSet("ab")
  var test = ["", "a", "b", "ab"]
  return arraysMatching(&example, &test)
});

assert(&testCount, "should work on longer input", {
  var example = powerSet("abcdefg")
  var test = ["","g","f","fg","e","eg","ef","efg","d",
    "dg","df","dfg","de","deg","def","defg","c","cg","cf","cfg","ce","ceg",
    "cef","cefg","cd","cdg","cdf","cdfg","cde","cdeg","cdef","cdefg","b","bg",
    "bf","bfg","be","beg","bef","befg","bd","bdg","bdf","bdfg","bde","bdeg",
    "bdef","bdefg","bc","bcg","bcf","bcfg","bce","bceg","bcef","bcefg","bcd",
    "bcdg","bcdf","bcdfg","bcde","bcdeg","bcdef","bcdefg","a","ag","af","afg",
    "ae","aeg","aef","aefg","ad","adg","adf","adfg","ade","adeg","adef",
    "adefg","ac","acg","acf","acfg","ace","aceg","acef","acefg","acd","acdg",
    "acdf","acdfg","acde","acdeg","acdef","acdefg","ab","abg","abf","abfg",
    "abe","abeg","abef","abefg","abd","abdg","abdf","abdfg","abde","abdeg",
    "abdef","abdefg","abc","abcg","abcf","abcfg","abce","abceg","abcef",
    "abcefg","abcd","abcdg","abcdf","abcdfg","abcde","abcdeg","abcdef","abcdefg"]
  return arraysMatching(&example, &test)
});

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n");


print("Lattice Paths Tests")
testCount = [0,0]

assert(&testCount, "should work on example case",  {
  let example = latticePaths(2, 3)
  return example == 10
})

assert(&testCount, "should return 1 for a 0 x 0 lattice",  {
  let example = latticePaths(0, 0)
  return example == 1
})

assert(&testCount, "should return 2496144 for 13 x 11 lattice",  {
  let example = latticePaths(11, 13)
  return example == 2496144
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n");
