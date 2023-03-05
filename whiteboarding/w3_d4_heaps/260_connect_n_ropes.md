
# 260 - Connect N Ropes with Minimum Cost

Given `n` ropes of different lengths represented by an array of integers, connect them all into a single rope in a way that minimizes the **cost** of connecting them.

The cost of connecting two ropes is equal to `sum` of their `lengths`. We want to minimize the cost of connecting **all the ropes**.


```
Input: ropes, [Integer]
Output: Integer
```

# Example

```
In: [4, 3, 2, 6]
Out: 29


Explanation:

First we connect 3 + 2 = 5, giving the following ropes: [4,5,6]
Then we connect 5 + 4 = 9, giving the following ropes: [9,6]
Then we connect 9 + 6 = 15, giving the final combination of all ropes: [15]

So in total the cost for the most efficient approach is: 5 + 9 + 15 = 29

A less efficient way would be:

First we connect 4 + 6 = 10, giving the following ropes: [10,3,2]
Then we connect 10 + 3 = 13, giving the following ropes: [13,2]
Then we connect 13 + 2 = 15, giving the final combination of all ropes: [15]

So in total the cost for the less efficient approach is: 10 + 13 + 15 = 38

Although in both cases we need to make the same number of connections, the costs are different

```


# Constraints
```
Intermediate:
Time Complexity: O(N log N)
Auxiliary Space Complexity: O(N)

Advanced:
Time Complexity: O(N log N)
Auxiliary Space Complexity: O(1)

N = # of Ropes

```

Input will always contain positive integers.

# Hints for Interviewer

Think about where a minHeap might fit into all this.

What other examples can we try?

Why do some ways of adding ropes together lead to larger output?

What's causing that?

What two elements would we always want to add together.


# Solution


### Intermediate

High Level Idea:
* Add all the elements into a minHeap.
* Remove the two smallest and and sum them together to get the current min cost
* Insert the sum value into the minHeap
* Continue until you only have a single element in the heap.


### Advanced

Similar to intermediate, except we do it with the original array, saving space.

* 1) Min heapify the input array with all the ropes in it.

* 2) **Remove** the peak of the minHeap by swapping it with the **last element** and removing it, then bubbling down the **new peak**.

* 3) Sum most recently removed peak to the new peak to get current min cost and a new connected rope value

* 4) Add current cost value to running total cost

* 5) Replace peak of heap with new rope value

* 6) Bubble down the **new peak** element of the minHeap to it's correct position

* 7) Repeat steps `2`-`6` until only a single element in the heap, then return the total cost.


# Resources
[Connect N Ropes on Geeks for Geeks](https://www.geeksforgeeks.org/connect-n-ropes-minimum-cost/)

# Code

```java
import java.util.*;

class Main {
  public static void main (String[] args) {
    int[] ropes1 = {4,3,2,6};
    System.out.println(connectNRopesMinIntermediate(ropes1)); //29
    System.out.println(connectNRopesMinAdvanced(ropes1)); //29

    int[] ropes2 = {4, 3, 2, 6, 5, 7, 12};
    System.out.println(connectNRopesMinIntermediate(ropes2)); //103
    System.out.println(connectNRopesMinAdvanced(ropes2)); //103
  }

  public static int connectNRopesMinIntermediate(int[] arr) {
    // Add all elements into a priority queue/min heap
    PriorityQueue<Integer> minHeap = new PriorityQueue<>();
    for(Integer i: arr) minHeap.add(i);

    // Sum min ropes repeatedly until 1 rope left
    int firstMin, secondMin;
    int currentCost = 0, totalCost = 0;
    while(minHeap.size()>1) {
      // Remove 2 most min elements from heap/pq
      firstMin = minHeap.remove();
      secondMin = minHeap.remove();
      // Sum 2 mins to get current cost and add that to running total
      currentCost = firstMin + secondMin;
      totalCost += currentCost;
      // Add current cost/new rope to min heap
      minHeap.add(currentCost);
    }
    return totalCost;
  }

  public static int connectNRopesMinAdvanced(int[] arr) {
    // Min Heapify array
    for(int i=arr.length-1; i>=0 ; i--){
      bubbleDown(arr, i, arr.length);
    }

    // Sum min ropes repeatedly until 1 rope left
    int heapSize = arr.length;
    int oldPeak;
    int totalCost = 0, currentCost = 0;
    while(heapSize > 1) {
      // Print current min heap in array
      // printVirtualHeap(arr, heapSize);
      // Remove peak and decrease heapSize
      oldPeak = removePeak(arr, --heapSize);
      // Add old peak to new heap peak to get current min cost and new rope
      currentCost = arr[0] + oldPeak;
      // Add current cost to total cost
      totalCost += currentCost;
      // Replace heap peak with new rope/cost, and bubble down
      arr[0] = currentCost;
      bubbleDown(arr, 0, heapSize);
    }

    return totalCost;
  }

  public static void bubbleDown(int[] arr, int parent, int heapSize) {
    int child = getChild(arr, parent, heapSize);
    while(child < heapSize && arr[parent] > arr[child]) {
      swap(arr, parent, child);
      parent = child;
      child = getChild(arr, parent, heapSize);
    }
  }

  public static int getChild(int[] arr, int parent, int heapSize) {
    int child1 = 2*parent+1;
    int child2 = 2*parent+2;
    if(child2 >= heapSize || child1 >= heapSize) return child1;
    else return arr[child1] < arr[child2] ? child1 : child2;
  }

  public static void swap(int[] arr, int parent, int child) {
    int temp = arr[parent];
    arr[parent] = arr[child];
    arr[child] = temp;
  }

  public static int removePeak(int[] arr, int heapBoundary) {
    int peak = arr[0];
    swap(arr, 0, heapBoundary);
    bubbleDown(arr, 0, heapBoundary);
    return peak;
  }

  public static void printVirtualHeap(int[] arr, int heapSize){
    for(int i=0; i<heapSize; i++) System.out.print(arr[i]+" ");
    System.out.println();
  }

}
```
