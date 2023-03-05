/**
 *  Homework - Trie
 *
 *  Problem 1: TrieNode class
 *
 *  Prompt:    Create a TrieNode class
 *             The TrieNode class should contain the following properties:
 *
 *                 value:   {Character} - default null
 *                  next:   {HashTable}
 *                   end:   {Boolean}
 *
 *
 *               Example:   let sample = new TrieNode("b")
 *                          sample.value     // "b"
 *                          sample.end       // false
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
 *                          Input:     word {String}
 *                          Output:    {undefined}
 *
 *                isWord:   A method that checks whether a word is in the trie.
 *
 *                          Input:     word {String}
 *                          Output:    {Boolean}
 *
 *              isPrefix:   A method that checks whether an input is a prefix of
 *                          a word in the string.
 *
 *                          Input:     word {String}
 *                          Output:    {Boolean}
 *
 *            startsWith:   A method that returns all words that starts with an
 *                          input word.
 *
 *                          Input:     word {String}
 *                          Output:    {Array of Strings}
 *
 *          EXTRA CREDIT:
 *                remove:   Removes a word from the trie.
 *
 *                          Input:     word {String}
 *                          Output:    {undefined}
 */


 class TrieNode {
   var value : Character
   var next : [Character:TrieNode]
   var end: Bool

   init(_ value: Character) {
     self.value = value
     self.next = [:]
     self.end = false
   }
 }

 class Trie {
   var root : TrieNode
   init() {
     self.root = TrieNode(" ")
   }

   func insert(_ word: String) {
     var current : TrieNode = root
     var letter: Character
     for character in word {
       letter = character
       if(current.next[letter] == nil) {
         current.next[letter] = TrieNode(letter)
       }
       current = current.next[letter]!
     }
     current.end = true
   }

   func isWord(_ word: String) -> Bool {
     let current: TrieNode? = _search(word)
     return current != nil && current!.end
   }

   func isPrefix(_ word: String) -> Bool {
     let current : TrieNode? = _search(word)
     return current != nil
   }

   func startsWith(_ word: String) -> [String] {
     let current = _search(word)
     if(current == nil) { return []}
     var results = _traverseNode(current!)
     for(index, value) in results.enumerated() {
       results[index] = word + value
     }
     return results
   }

   func remove(_ word: String) {
     if(word == "") {return}
     var current: TrieNode? = root
     var stack : [TrieNode] = []

     for character in word {
       stack.append(current!)
       current = current!.next[character]
       if(current == nil) {return}
     }
     current!.end = false
     if(current!.next.count > 0) {return}
     var previousLetter : Character
     while(!current!.end && current!.next.count > 0 && stack.count > 0) {
       print(current!.value)
       previousLetter = current!.value
       current = stack.removeLast()
       current!.next[previousLetter] = nil
     }
   }

   func _search(_ word: String) -> TrieNode? {
     var current: TrieNode = root
     var letter: Character
     for character in word {
       letter = character
       if(current.next[letter] == nil) {
         return nil
       }
       current = current.next[letter]!
     }
     return current
   }

   func _traverseNode(_ node: TrieNode) -> [String] {
     var results : [String] = []
     func dfs (_ current: TrieNode?, _ path: String) {
       if(current == nil) { return }
       if(current!.end) {results.append(path)}
       for (k,_) in current!.next {
         let newPath : String = path + String(k)
         dfs(current!.next[k], newPath)
       }
     }
     dfs(node, "")
     return results
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


 print("TrieNode Class")
 var testCount = [0, 0]


 assert(&testCount, "has value property that is a Character",  {
   let trieNode = TrieNode(" ")
   return trieNode.value == " "
 })

 assert(&testCount, "has end property, defaults to false",  {
   let trieNode = TrieNode(" ")
   return trieNode.end == false
 })

 assert(&testCount, "has next property that is a HashTable",  {
   let trieNode = TrieNode(" ")
   return trieNode.next.count == 0
 })

 assert(&testCount, "able to assign value upon instantiation",  {
   let trieNode = TrieNode(" ")
   trieNode.value = "a"
   return trieNode.value == "a"
 })

 assert(&testCount, "able to assign end upon instantiation",  {
   let trieNode = TrieNode(" ")
   trieNode.end = true
   return trieNode.end == true
 })

 print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


 print("Trie Class")
 testCount = [0, 0]


 assert(&testCount, "has root property set to empty TrieNode",  {
   let trie = Trie()
   return trie.root.value == " "
 })

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("Trie Insert Method")
testCount = [0, 0]


assert(&testCount, "able to insert a word into empty Trie",  {
  let trie = Trie()
  trie.insert("cat")
  return trie.root.next["c"] != nil && trie.root.next["c"]!.next["a"] != nil && trie.root.next["c"]!.next["a"]!.next["t"] != nil &&
  trie.root.next["c"]!.next["a"]!.next["t"]!.end == true
})

assert(&testCount, "able to insert words that don't overlap",  {
  let trie = Trie()
  trie.insert("cat")
  trie.insert("dog")

  return trie.root.next["c"] != nil && trie.root.next["c"]!.next["a"] != nil && trie.root.next["c"]!.next["a"]!.next["t"] != nil &&
  trie.root.next["c"]!.next["a"]!.next["t"]!.end == true && trie.root.next["d"] != nil && trie.root.next["d"]!.next["o"] != nil && trie.root.next["d"]!.next["o"]!.next["g"] != nil &&
  trie.root.next["d"]!.next["o"]!.next["g"]!.end == true
})

assert(&testCount, "able to insert words that overlap",  {
  let trie = Trie()
  trie.insert("cat")
  trie.insert("cats")
  return trie.root.next["c"] != nil && trie.root.next["c"]!.next["a"] != nil && trie.root.next["c"]!.next["a"]!.next["t"] != nil &&
  trie.root.next["c"]!.next["a"]!.next["t"]!.end == true && trie.root.next["c"]!.next["a"]!.next["t"]!.next["s"] != nil
  && trie.root.next["c"]!.next["a"]!.next["t"]!.next["s"]!.end == true
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("Trie IsWord Method")
testCount = [0, 0]

assert(&testCount, "should return false for an empty string as input",  {
  let trie = Trie()
  return trie.isWord("") == false
})

assert(&testCount, "should return true for a word that exists",  {
  let trie = Trie()
  trie.insert("cat")
  return trie.isWord("cat") == true
})

assert(&testCount, "should return false for a word that exists",  {
  let trie = Trie()
  trie.insert("cat")
  return trie.isWord("dog") == false
})

assert(&testCount, "should return false for a prefix that exists in a larger word",  {
  let trie = Trie()
  trie.insert("cat")
  return trie.isWord("ca") == false
})

assert(&testCount, "should return true for a word that exists in a larger word",  {
  let trie = Trie()
  trie.insert("cat")
  trie.insert("cats")
  return trie.isWord("cat") == true
})

assert(&testCount, "should return true for a larger word that contains smaller words",  {
  let trie = Trie()
  trie.insert("cat")
  trie.insert("cats")
  return trie.isWord("cats") == true
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("Trie StartsWith Method")
testCount = [0, 0]

assert(&testCount, "returns an empty array if no words start with input",  {
  let trie = Trie()
  return trie.startsWith("") == []
})

assert(&testCount, "returns only words that begin with input as prefix",  {
  let trie = Trie()
  trie.insert("cat")
  trie.insert("car")
  trie.insert("can")
  trie.insert("cut")
  trie.insert("dog")
  trie.insert("deer")
  trie.insert("bird")
  let result : [String] = trie.startsWith("c")
  return result.count == 4 && result.contains("cat") && result.contains("car") && result.contains("can") && result.contains("cut")
})

assert(&testCount, "returns result with input, if input is a word",  {
  let trie = Trie()
  trie.insert("cat")
  trie.insert("cats")
  trie.insert("car")
  trie.insert("can")
  trie.insert("cut")
  trie.insert("dog")
  trie.insert("deer")
  trie.insert("bird")
  let result : [String] = trie.startsWith("cat")
  return result.count == 2 && result.contains("cat") && result.contains("cats")
})

assert(&testCount, "returns all words if input is empty string",  {
  let trie = Trie()
  trie.insert("cat")
  trie.insert("car")
  trie.insert("can")
  trie.insert("cut")
  trie.insert("dog")
  trie.insert("deer")
  trie.insert("bird")
  return trie.startsWith("").count == 7
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("Trie Remove Method")
testCount = [0, 0]

assert(&testCount, "removes word that exists",  {
  let trie = Trie()
  trie.insert("cat")
  trie.remove("cat")
  return trie.isWord("cat") == false
})

assert(&testCount, "does not remove word that does not exist",  {
  let trie = Trie()
  trie.insert("cat")
  trie.remove("car")
  return trie.isWord("cat") == true
})

assert(&testCount, "does not remove letters that belong to a longer word",  {
  let trie = Trie()
  trie.insert("cat")
  trie.insert("cats")
  trie.remove("cat")
  return trie.isWord("cats") == true && trie.isWord("cat") == false
})

assert(&testCount, "removes letters from longer word and keeps letters from shorter word",  {
  let trie = Trie()
  trie.insert("cat")
  trie.insert("cats")
  trie.remove("cats")
  return trie.isWord("cat") == true && trie.isWord("cats") == false
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
