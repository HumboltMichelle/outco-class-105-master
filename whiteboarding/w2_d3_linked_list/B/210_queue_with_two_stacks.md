# If we were to ask you to take over a project on Day 1, what would you accomplish in your first week?

Should take one minute; minute and a half at most

##### Prompt

Say: "If we were to ask you to take over a project on Day 1, what would you accomplish in your first week?"

##### Do you hear these things?

- *Identify*: Does the interviewee discuss their competencies based on what you have asked them? Competencies include:
   - Technical Skills (libraries, languages, etc.)
   - Interpersonal Skills  


- *Prove*: Does the interviewee provide a _specific_ example (past experience or hypothetical scenario)  to showcase competencies and/or fit? Is it presented in the form of a story (punchline, beginning, middle, positive end)?


- *Close*: Does the interviewee showcase why the company should hire them and how their skills/experience/values will add value to and align with the team/company? Does the interviewee showcase what they have learned in "Prove" and how they will apply it to the new role?

# 210 - Queue with Two Stacks

Implement a `Queue` class using two `stacks`. The `Queue` should have the following methods:

`enqueue`: add an item to the end of the collection

`dequeue`: remove an item from the beginning of the collection

```
Input: 		N/A
Output: 	Queue Class
```

# Example

```javascript
enqueue(1)
enqueue(2)
enqueue(3)
dequeue() // => 1
```
# Constraints
```
enqueue:   Time Complexity: O(1),	Auxiliary Space Complexity: O(1)
dequeue:   Time Complexity: O(N),	Auxiliary Space Complexity: O(1)
```

* 1) May not use other data structures other than the two `Stack` instances that are given
* 2) Assume the `Queue` will only take integer values
* 4) `Stack` class has the following methods:

	`push`: add an item to the end of the collection

	`pop`: remove an from the end of the collection

	`size`: return the number of items in the stack

# Solution

* 1) Create two `stacks` named `inbox` and `outbox`
* 2) For the `enqueue` method, `push` the value into the `inbox`
* 3) For the `dequeue` method, check the to see if the `outbox` contains items
* 4) If the `outbox` contains items, `pop` from the `outbox` and return its value
* 5) Otherwise for each item in the `inbox`, `pop` it out and `push` it into the `outbox`, then perform Step 4.

# Code

```javascript
// Assume that we have a Stack class imported
const Stack = require('Stack');

class Queue {
  constructor() {
    this.inbox = new Stack();
    this.outbox = new Stack();
  }

  enqueue(item) {
    this.inbox.push(item);  
  }

  dequeue() {
    if (this.outbox.size() > 0) {
      return this.outbox.pop();
    }

    while (this.inbox.size() > 0) {
      let transfer = this.inbox.pop();
      this.outbox.push(transfer);
    }
    return this.outbox.pop();
  }
}

```

# Notes

Extremely helpful to diagram out the two stacks from the beginning.

Helpful to diagram out the  `Queue` you're building a separate diagram for the two `Stacks` under the hood.

Think about what should happen in both diagrams after perform a `enqueue` or `dequeue`

What do you expect your `Queue` to return?

# Resources

[Queue Using Two Stack on Geeks for Geeks](http://www.geeksforgeeks.org/queue-using-stacks/)
