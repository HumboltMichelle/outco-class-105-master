/*
 *  Homework - Hash Table
 *
 *  Problem: Hash Table
 *
 *  Prompt: Create a hash table class using separate chaining.
 *
 *  The HashTable will have the following properties:
 *
 *         storage:  {Array} - an array of arrays.
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
 *                   Output:     {Undefined}
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
 *                   Output:     {Undefined}
 *
 *         resize:   If the load factor reaches a critical 0.75 or higher,
 *                   double the number of buckets. If the load factor is 0.25
 *                   or less, half the number of buckets. Make sure the number
 *                   of buckets do not fall below 8 and re-index all key-value
 *                   pairs if bucket size is changed.
 *
 *                   Input:      key {String}
 *                   Output:     {Undefined}
 *
 *  Input: N/A
 *  Output: A HashTable instance
 */

'use strict';


class HashTable {
 constructor() {
   // YOUR WORK HERE
 }


 // Time Complexity:
 // Auxiliary Space Complexity:
 hash(key, buckets) {
   let hash = 5381;
   for (let i = 0; i < key.length; i++) {
     let char = key.charCodeAt(i);
     hash = ((hash << 5) + hash) + char;
   }
   return hash % buckets;
 }


 // Amortized Time Complexity (amortized):
 // Auxiliary Space Complexity (amortized):
 insert(key, value) {
   // YORK WORK HERE
 }


 // Time Complexity:
 // Auxiliary Space Complexity:
 get(key) {
   // YOUR WORK HERE
 }


 // Amortized Time Complexity (amortized):
 // Auxiliary Space Complexity (amortized):
 remove(key) {
   // YOUR WORK HERE
 }


 // Time Complexity:
 // Auxiliary Space Complexity:
 resize() {
   // YOUR WORK HERE
 }
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
// output: {undefined}
function assert(count, name, test) {
 if(!count || !Array.isArray(count) || count.length !== 2) {
   count = [0, '*'];
 } else {
   count[1]++;
 }

 let pass = 'false';
 let errMsg = null;
 try {
   if (test()) {
     pass = ' true';
     count[0]++;
   }
 } catch(e) {
   errMsg = e;
 }
 console.log('  ' + (count[1] + ')   ').slice(0,5) + pass + ' : ' + name);
 if (errMsg !== null) {
   console.log('       ' + errMsg + '\n');
 }
}


console.log('HashTable Class');
let testCount = [0, 0];

assert(testCount, 'able to create an instance', () => {
 let hashTable = new HashTable();
 return typeof hashTable === 'object';
});

assert(testCount, 'has storage property', () => {
 let hashTable = new HashTable();
 return hashTable.hasOwnProperty('storage');
});

assert(testCount, 'has buckets property', () => {
 let hashTable = new HashTable();
 return hashTable.hasOwnProperty('buckets');
});

assert(testCount, 'has size property', () => {
 let hashTable = new HashTable();
 return hashTable.hasOwnProperty('size');
});

assert(testCount, 'default storage set to an array', () => {
 let hashTable = new HashTable();
 return Array.isArray(hashTable.storage);
});

assert(testCount, 'default buckets set to 8', () => {
 let hashTable = new HashTable();
 return hashTable.buckets === 8;
});

assert(testCount, 'default size set to 0', () => {
 let hashTable = new HashTable();
 return hashTable.size === 0;
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');


console.log('HashTable Hash method');
testCount = [0, 0];

assert(testCount, 'has hash method', () => {
 let hashTable = new HashTable();
 return Object.prototype.toString.apply(hashTable.hash) === '[object Function]';
});

assert(testCount, 'should hash a string in to a number less than bucket size', () => {
 let hashTable = new HashTable();
 for(let i = 1; i < 100; i++) {
   let index = hashTable.hash('hello', i);
   if(!Number.isInteger(index) || index >= i) {
     return false;
   }
 }
 return true;
});

assert(testCount, 'should hash same key-bucket combination to the same index', () => {
 let hashTable = new HashTable();
 let index = hashTable.hash('hello', 100000);
 return Number.isInteger(index) && index === hashTable.hash('hello', 100000);
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');


console.log('HashTable Insert method');
testCount = [0, 0];

assert(testCount, 'has insert method', () => {
 let hashTable = new HashTable();
 return Object.prototype.toString.apply(hashTable.insert) === '[object Function]';
});

assert(testCount, 'can insert a key-value pair into hash table', () => {
 let hashTable = new HashTable();
 hashTable.insert('hello', 'world');
 let index = hashTable.hash('hello', hashTable.buckets);
 return hashTable.size === 1 &&
   Array.isArray(hashTable.storage[index]) &&
   hashTable.storage[index].length === 1 &&
   hashTable.storage[index][0][0] === 'hello' &&
   hashTable.storage[index][0][1] === 'world';
});

assert(testCount, 'can insert a second key-value pair into hashtable', () => {
 let hashTable = new HashTable();
 hashTable.insert('hello', 'world');
 hashTable.insert('foo', 'bar');
 let index1 = hashTable.hash('hello', hashTable.buckets);
 let index2 = hashTable.hash('foo', hashTable.buckets);
 return hashTable.size === 2 &&
   Array.isArray(hashTable.storage[index1]) &&
   Array.isArray(hashTable.storage[index2]);
});

assert(testCount, 'can overwrite value if key already exists', () => {
 let hashTable = new HashTable();
 hashTable.insert('hello', 'world');
 hashTable.insert('hello', 'universe');
 let index = hashTable.hash('hello', hashTable.buckets);
 return hashTable.size === 1 &&
   Array.isArray(hashTable.storage[index]) &&
   hashTable.storage[index].length === 1 &&
   hashTable.storage[index][0][0] === 'hello' &&
   hashTable.storage[index][0][1] === 'universe';
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');


console.log('HashTable Get method');
testCount = [0, 0];

assert(testCount, 'has get method', () => {
 let hashTable = new HashTable();
 return Object.prototype.toString.apply(hashTable.get) === '[object Function]';
});

assert(testCount, 'should return correct value for existing input key', () => {
 let hashTable = new HashTable();
 hashTable.insert('hello', 'world');
 return hashTable.get('hello') === 'world';
});

assert(testCount, 'should return null if key does not exist', () => {
 let hashTable = new HashTable();
 hashTable.insert('hello', 'world');
 return hashTable.get('cat') === null;
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');


console.log('HashTable Remove method');
testCount = [0, 0];

assert(testCount, 'has remove method', () => {
 let hashTable = new HashTable();
 return Object.prototype.toString.apply(hashTable.remove) === '[object Function]';
});

assert(testCount, 'can remove a key-value pair', () => {
 let hashTable = new HashTable();
 hashTable.insert('hello', 'world');
 hashTable.remove('hello');
 return hashTable.size === 0 && hashTable.get('hello') === null;
});

assert(testCount, 'does not remove a key-value pair that does not exist', () => {
 let hashTable = new HashTable();
 hashTable.insert('hello', 'world');
 hashTable.remove('cat');
 let index = hashTable.hash('hello', hashTable.buckets);
 return hashTable.size === 1 &&
   hashTable.storage[index][0][0] === 'hello' &&
   hashTable.storage[index][0][1] === 'world';
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');


console.log('HashTable Resize method');
testCount = [0, 0];

assert(testCount, 'has resize method', () => {
 let hashTable = new HashTable();
 return Object.prototype.toString.apply(hashTable.resize) === '[object Function]';
});

assert(testCount, 'doubles hashtable number of buckets if load factor is ' +
      'equal to or larger than 0.75', () => {
 let hashTable = new HashTable();
 const keys = ['zero', 'one', 'two', 'three', 'four', 'five', 'six'];
 const values = ['0', '1', '2', '3', '4', '5', '6'];
 for (let i = 0; i < 5; i++) {
   hashTable.insert(keys[i], values[i]);
   if (hashTable.buckets !== 8) { return false; }
 }
 hashTable.insert(keys[5], values[5]);
 if (hashTable.buckets !== 16) { return false; }
 hashTable.insert(keys[6], values[6]);
 return hashTable.buckets === 16;
});

assert(testCount, 'halves buckets if load factor drops equal to or below ' +
                 '25% and bucket length is greater than 8', () => {
 let hashTable = new HashTable();
 const keys = ['zero', 'one', 'two', 'three', 'four', 'five', 'six'];
 const values = ['0', '1', '2', '3', '4', '5', '6'];
 for (let i = 0; i < keys.length; i++) {
   hashTable.insert(keys[i], values[i]);
 }
 let buckets = hashTable.buckets;
 hashTable.remove('four');
 hashTable.remove('five');
 hashTable.remove('six');
 return buckets === hashTable.buckets * 2;
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');
