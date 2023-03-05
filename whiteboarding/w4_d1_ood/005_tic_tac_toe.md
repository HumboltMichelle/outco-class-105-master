# OOP Project - Tic Tac Toe

Prompt: "Build a working game of Tic Tac Toe from the command line."

The goal of this problem is to challenge you to build out a working version of Tic Tac Toe that takes user input from the command line and has a way of displaying to board.

You'll also need to know how to take input and output from the command line in your particular language. So you'll want to start there and get a working demo for that and then build your solution around it. If you've never done that before, a good place to start is by looking at how Hackerrank does it.

This problem was originally given on a tech screen where it was meant to be solved in 40 minutes.

So far, the earliest an Outcoder got a working solution for this problem was 7:40pm, starting at 6pm. Think you can do better? (Done in Ruby)

If you do finish early, spend some time doing any necessary code cleanup, and then try writing a game of Battleship.

# Objects

These are the objects/classes you should build out:

* `Game` class
* `Board` class

# User Stories

Users should be able to place a piece on the board.

Users should be able to see the board update after making a move.

*What additional user stories are there? Brainstorming will be a component
of this first step.*

# General Approach

Don't start by trying to figure out what classes should exist where and what they should do.

Think about the whole system, and the **event** that take place.

Think of the **life-cycle** of playing one round of Tic Tac Toe.

Diagram out an example game, and list out **EXACTLY WHAT HAPPENS**. Be as granular as possible.

For example:

```

Start a New Game.
Display the Empty Board.
Announce current player is X.
Prompt user to place a piece.
Display the board after piece is placed.
Announce current player is O.
...

```

Once you've mapped out **WHAT** needs to happen, then you can start making decisions on **HOW** it needs to happen. The **ACTIONS** you describe will likely be your **METHODS** and the **STATE** changes you describe will be your **PROPERTIES** or **VARIABLES**.

**Don't** commit to a certain data structure or way of approaching the problem until you've figured out what it is you're trying to accomplish.

The difficulty of OOP problems usually doesn't lie in the use of a complex algorithm. It has more to do with there being a LOT of simple moving parts to account for. That's where the complexity comes from.

# STDIN (Standard In) Examples

```JavaScript
/// JavaScript

const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function askName() {
    rl.question('Please input your name\n', (answer) => {
        console.log(`Hello ${answer}!`);
        rl.close();
    });
}

askName();
```

```Ruby
# Ruby

def ask_name()
    print("Please input your name\n")
    name = gets

    #perform slice to remove "\n" on end of name
    name = name[0..-2]
    print("Hello #{name}!")
end

ask_name()
```

```Python
# Python

def ask_name():
    name = input('Please input your name: ')
    print(f"Hello {name}!")

ask_name()
```

```Java
// Java

import java.util.*;
import java.io.*;

class Main {
    public static void main(String[] args) {
        Scanner in = new Scanner(new BufferedReader(new InputStreamReader(System.in)));

        System.out.println("Please input your name");
        String name = in.next();
        System.out.println(String.format("Hello %s!", name));
    }
}
```

```Swift
// Swift

func askName() {
    let name = readLine(strippingNewline: true)!

    print("Hello \(name)!")
}

askName()
```

```csharp
// CSharp

using System;

class MainClass {
  public static void Main (string[] args) {
    Console.WriteLine ("Please input your name");
    String name = Console.ReadLine();
    Console.WriteLine($"Hello {name}!");
  }
}
```


```cpp
// CPP

#include <iostream>

using namespace std;

int main() {
    string name;
    cin >> name;

    std::cout << "Hello " << name << "!";
}
```
