/*
 *  Homework - Complexity
 *
 *  For the following functions, write the expected Time and Auxiliary Space
 *  Complexity using what you know about nested loops, hash table look-ups and
 *  the runtime of built in functions.
 *
 *  NOTE: You don't need to code to anything for these problems, just write
 *  what you the complexity to be using big-O notation
 **/

 #include <cmath>
 #include <string>
 #include <vector>
 #include <algorithm>
 #include <unordered_map>
 #include <iostream>
 using namespace std;


 /*  Order of Magnitude

 Reduce the following into it's Big-O order of magnitude.

 1. 5 + N                    Answer:  N
 2. N + N^2                  Answer:  N^2
 3. 15N + 13N                Answer:  N
 4. 10000                    Answer:  1
 5. log(N) + 1               Answer:  log(N)
 6. log(N) * 3 + 14N + 3     Answer:  N
 7. Nlog(N) + 3N^2           Answer:  N^2
 8. N^3 + log(N^4)           Answer:  N^3
 9. N! + 180000N^2           Answer:  N!
 10. 15002^N                 Answer:  15002^N
 */



 /*  Index Of

 Given an array of integers and a target value, return the index of the first
 element that matches the target value. If there are no matches, return -1.

 Parameters
 Input: arr {Array of ints}
 Input: target {int}
 Output: {int}

 Examples
 [1, 2, 3, 4, 5, 6], 5 --> 4
 [9, 83, 74], 8 --> -1
 [6, 4, 7, 9, 7, 8, 2, 4, 3], 7 --> 2

 Time Complexity: O(N)
 Auxiliary Space Complexity: 0(1)

 */
 int indexOf(vector<int> arr, int target) {
   for (int i = 0; i < arr.size(); i++) {
     if(arr[i] == target) {
       return i;
     }
   }
   return -1;
 }


 /*  Evens

 Given an array of integers, return an array of only the even values.

 Parameters
 Input: arr {Array of ints}
 Output: {List of ints}

 Examples
 [1, 2, 3, 4, 5, 6] --> [2, 4, 6]
 [9, 83, 74] --> [74]
 [6, 4, 7, 9, 7, 8, 2, 4, 3] --> [6, 4, 8, 2, 4]

 Time Complexity: O(N)
 Auxiliary Space Complexity: 0(N)

 */
 vector<int> evens(vector<int> arr) {
   vector<int> results;
   for(int i = 0; i < arr.size(); i++) {
     if(arr[i] % 2 == 0) {
       results.push_back(arr[i]);
     }
   }
   return results;
 }


 /*  Sum

 Given an array of integers, return the sum of all the integers.

 Parameters
 Input: arr {Array of ints}
 Output: {int}

 Examples
 [1, 2, 3, 4, 5] --> 15
 [0, 1, -1] --> 0
 [] --> 0

 Time Complexity: O(N)
 Auxiliary Space Complexity: 0(1)

 */
 int sum(vector<int> arr) {
   int total = 0;
   for(int i = 0; i < arr.size(); i++) {
     total = total + arr[i];
   }
   return total;
 }


 /*  Merge Arrays

 Given two sorted arrays of integers, return a merged sorted array of both inputs.

 Parameters
 Input: arr1 {Array of ints}
 Input: arr2 {Array of ints}
 Output: {Array of ints}

 Examples
 [1, 3, 9], [2, 4, 8] --> [1, 2, 3, 4, 8, 9]
 [12, 25, 40], [20, 37, 45] --> [12, 20, 25, 37, 40, 45]
 [10, 13, 24], [12, 35] --> [10, 12, 13, 24, 35]

 Time Complexity: O(N+M)
 Auxiliary Space Complexity: 0(N+M)

 */
 vector<int> merge(vector<int> arr1, vector<int> arr2) {
   int totalElements = arr1.size() + arr2.size();
   vector<int> result(totalElements, 0);
   int i = 0;
   int j = 0;
   int k = 0;
   while(i + j < totalElements) {
     if(j >= arr2.size() || (i < arr1.size() && arr1[i] <= arr2[j])) {
       result[k] = arr1[i];
       i++;
       k++;
     } else {
       result[k] = arr2[j];
       j++;
       k++;
     }
   }
   return result;
 }


 /*  Binary Search

 Given a sorted array and a target value, use binary search to return the index of the target in the input array.
 Return -1 if no such target is found.

 Parameters
 Input: arr {Array of ints}
 Input: val {int}
 Output: {int}

 Examples
 [1, 3, 4, 5, 8, 9], 5 --> 3
 [5, 7, 10, 12, 14], 7 --> 1
 [2, 4, 8, 9, 15], 3 --> -1

 Time Complexity: O(log(N))
 Auxiliary Space Complexity: 0(1)

 */
 int binarySearch(vector<int> arr, int val) {
   int low = 0;
   int high = arr.size() - 1;
   int mid;
   while(low <= high) {
     mid = (low + high) / 2;
     if(arr[mid] > val) {
       high = mid - 1;
     }
     else if (arr[mid] < val) {
       low = mid + 1;
     }
     else {
       return mid;
     }
   }
   return -1;
 }


 /*  Factorial

 Given an input integer n, return the n factorial value.

 Parameters
 Input: n {int}
 Output: {int}

 Examples
 5  --> 120 (5 * 4 * 3 * 2 * 1)
 1 --> 1 (1)
 9 --> 362880 (9 * 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1)

 Time Complexity: O(N)
 Auxiliary Space Complexity: 0(N)

 */
 int factorial(int n) {
   if(n <= 1) {
     return 1;
   }
   return n * factorial(n - 1);
 }


/*  First Times Last
 *
 *  Time Complexity: O(1)
 *  Auxiliary Space Complexity: O(1)
 */
 int firstTimesLast(vector<int> arr) {
   int result = 0;
   if (arr.size() < 2) {
     return result;
   } else {
     result = arr[0] * arr[arr.size()-1];
     return result;
   }
 }


 /*  Most Frequent Occurrence
  *
  *  Time Complexity: O(N)
  *  Auxiliary Space Complexity: O(1)
  */
 char mostFrequentOccurrence(string str) {
   unordered_map<char, int> letters;
   char mostFrequent = str[0];
   char currentChar;
   int maxCount = 0;

   for (int i = 0; i < str.size(); i++) {
     currentChar = str[i];
     letters[currentChar]++;
   }

   for(auto keyPair: letters) {
     char key = keyPair.first;
     int count = keyPair.second;
     if (count > maxCount) {
       mostFrequent = key;
       maxCount = count;
     }
   }

   return mostFrequent;
 }


 /* Print Unordered Pairs
  *
  *  Time Complexity: O(N^2)
  *  Auxiliary Space Complexity: O(1)
  */
 void printUnorderedPairs(vector<int> arr) {
  for (int i = 0; i < arr.size(); i++) {
     for (int j = i + 1; j < arr.size(); j++) {
       cout << to_string(arr[i]) + "," + to_string(arr[j]);
     }
   }
 }


 /**
  *  Make Combined Matrix
  *  Time Complexity: O(MN)
  *  Auxiliary Space Complexity: O(MN)
  */
 vector<vector<int>> makeCombinedMatrix(vector<int> arr1, vector<int> arr2) {
   vector<vector<int>> result(arr1.size(), vector<int>(arr2.size(),0));

   for (int i = 0; i < arr1.size(); i++) {
     for (int j = 0; j < arr2.size(); j++) {
       result[i][j] = arr1[i] + arr2[j];
     }
   }

   return result;
 }

 /**
  *  Nth Fibonacci
  *
  *  Time Complexity: O(N)
  *  Auxiliary Space Complexity: O(N)
  */
 int nthFibonacci(int n) {
   if(n < 2){ return n; }

   vector<int> result(n+1, 0);
   result[0] = 0;
   result[1] = 1;

   for(int i = 2; i < n+1; i++) {
     result[i] = result[i-1] + result[i-2];
   }
   return result[n];
 }


/* Nth Fibonacci - the return
*
*  Time Complexity: O(N)
*  Auxiliary Space Complexity: O(N)
*/

unordered_map<int, int> cache;
int result;

int searchFib(int index) {
  int solution;

  if (index < 2) {
   return index;
  }

  if (cache.find(index) != cache.end()) {
   return cache[index];
  }

  solution = searchFib(index-1) + searchFib(index-2);
  cache[index] = solution;
  return solution;
}

int nthFibonnaci(int n) {
  result = 0;
  result = searchFib(n);
  return result;
}

int main(){
  return 0;
}
