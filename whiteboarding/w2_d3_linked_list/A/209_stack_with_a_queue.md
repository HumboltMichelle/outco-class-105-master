# Tell me about a time you had to overcome a roadblock?

Should take one minute; minute and a half at most

##### Prompt

Say: "Tell me about a time you had to overcome a roadblock? What did you do?

##### Do you hear these things?

- *Identify*: Does the interviewee discuss their competencies based on what you have asked them? Competencies include:
   - Technical Skills (libraries, languages, etc.)
   - Interpersonal Skills  


- *Prove*: Does the interviewee provide a _specific_ example (past experience or hypothetical scenario)  to showcase competencies and/or fit? Is it presented in the form of a story (punchline, beginning, middle, positive end)?


- *Close*: Does the interviewee showcase why the company should hire them and how their skills/experience/values will add value to and align with the team/company? Does the interviewee showcase what they have learned in "Prove" and how they will apply it to the new role?

# 209 - Stack with a Queue

Implement a `Stack` class using only a single `Queue` instance. The `Stack` should have the following methods:

`push`: add an item to the top of the stack

`pop`: remove an item from the top of the stack

```
Input:     N/A
Output:    Stack Class   
```

# Example

```javascript
push(1)
push(2)
push(3)
pop() //=> 3
```

# Constraints

```
push: Time Complexity: O(1), Auxiliary Space Complexity: O(1)

pop: Time Complexity: O(N), Auxiliary Space Complexity: O(1)

```

* 1) Assume the `Stack` will only take integer values
* 2) May use only one instance of the `Queue` class
* 3) `Queue` class has the following methods:

`enqueue`: add an item to the end of the `Queue`

`dequeue`: remove an item from the front of the `Queue`

# Notes

Helpful to diagram out the  `Stack` you're building a separate diagram for the `Queue` under the hood.

Think about what should happen in both diagrams after perform a `push` or `pop`

What do you expect your `Stack` to return?

# Code

```javascript
// Assume that we have a Queue class imported
const Queue = require('Queue');

class Stack {
  constructor() {
    this.storage = new Queue();
    this.size = 0;
  }

  push(item) {
    this.storage.enqueue(item);
    this.size++;  
  }

  pop() {
    let i = 0;
    while (i < this.size - 1) {
      let transfer = this.storage.dequeue();
      this.storage.enqueue(transfer);
      i++;
    }    
    this.size--;
    return this.storage.dequeue();
  }
}
```


# Resources

[Stack Using a Single Queue on Geeks for Geeks](https://www.geeksforgeeks.org/implement-a-stack-using-single-queue/)
