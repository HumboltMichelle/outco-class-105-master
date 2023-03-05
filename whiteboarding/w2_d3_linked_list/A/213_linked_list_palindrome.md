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

# 213 - Linked List Palindrome

Given the head node of a singly linked list, return true if the values of the
linked list forms a palindrome.

# Example

```javascript
       (1) -> (2) -> (3) -> (3) -> (2) -> (1)
        ^
        |
Input: (1)
Output: True


       (1) -> (2) -> (4) -> (2) -> (1)
        ^
        |
Input: (1)
Output: True



       (5) -> (8) -> (4) -> (1) -> (7)
        ^
        |
Input: (5)
Output: False

```

# Constraints

```
Provide if asked:

Time Complexity: O(N)
Auxiliary Space Complexity: O(N)

However, if time permits, or if you'd just like to challenge the interviewee:

Time Complexity: O(N)
Auxiliary Space Complexity: O(1)
```

# Additional Details (provide if asked or bring up on your own):

* The size of the linked list will be potentially up to 100,000 nodes in length
  * What does this mean/why is this important?
    * Can't use recursion. We'll run out of calls in the call stack. Most
      language have on the order of 1,000 to 10,000 calls in the call stack
  * If the interviewee doesn't bring this up, but begins to go down the route
    of using a recursive approach, ask the question: "How could this potentially
    fail?"
* The values of the nodes in the linked list are between 0 (inclusive) and 9
  (inclusive).
  * This could help to solve the potential issue of having some linked list that
    looks like (1) -> (11). Depending on the implementation, this could be an
    issue.
* Reminder: it is a singly linked list
* If they ask about the structure of the linked list, you can let them know that
  the class used to construct each node has properties:
  * val {Int}
  * next {Node}

# Notes

### O(N) Auxiliary Space Approach

Fairly straightforward. Iterate through linked list and store all the elements
in an array. Then set two pointers at the distal ends of the array. As the
pointers move closer to each other, as long as the integer at the two pointers
match, it is a palindrome. If ever they do not match, return false. If the
pointers meet/pass by each other, we have a valid palindrome; return true.

If the interviewee goes for this approach, let them stick with it all the way
through to code. If however, it seems to easy, or there's additional time,
challenge them to work on the constant space approach.

### O(1) Auxiliary Space Approach

Find the length of the linked list. Reverse the second half of the linked list
starting from the midpoint.

Set left and right pointers and the distal ends of the linked list (similar to
two pointer O(N) approach above) and then perform the palindrome verification.

This is definitely a more complex approach and requires care to not get off by
one errors or instances where one calls a property on null. It will be important
that the interviewee work through this approach with both an even length linked
list along with an odd length linked list. Edge cases to watch out for include
a single element linked list and a two element linked list.



# Code

```javascript
// O(N) Space Approach
function isPalindrome(head) {
    let result = [];

    let current = head;

    while (current !== null) {
        result.push(current.val);
        current = current.next;
    }

    let i = 0;
    let j = result.length - 1;

    while (i < j) {
        if (result[i] !== result[j]) {
            return false;
        }

        i++;
        j--;
    }

    return true;
}



// O(1) Approach
function isPalindrome(head) {
    let count = 0;
    let current = head;

    while (current !== null) {
        // get length of linked list
        count++;
        current = current.next;
    }

    if (count === 1) {
        return true;
    }
    if (count === 2) {
        return head.val === head.next.val;
    }

    let beginReverse = Math.floor(count / 2);
    let position = 0;

    let prev;
    current = head;
    let ref;

    while (current !== null) {
        // reverse second half of linked list
        if (position >= beginReverse) {
            if (prev === undefined) {
                prev = current;
                current = current.next;
            }

            ref = current.next;
            current.next = prev;
            prev = current;
            current = ref;
        } else {
            position++;
            current = current.next;    
        }
    }

    let left = head;
    let right = prev;

    while (left !== right && right.next !== left) {
        // perform palindrome verification from both
        // ends of the linked list
        if (left.val !== right.val) {
            return false;
        }
        left = left.next;
        right = right.next;
    }

    return true;
};
```


# Resources

Check out some other constant space solutions using a slow and fast pointer
[here!!](https://leetcode.com/problems/palindrome-linked-list/discuss/?currentPage=1&orderBy=most_votes&query=)
