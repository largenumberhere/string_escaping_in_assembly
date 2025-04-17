# String Transformation Challenge
This was a challenge (I posted) in a programming community on 17/04/2025.
This solution only runs on linux. The code is in `src/`.
Build and run it with `make`.

### Problem Description
```
You have to use an **assembly** language or brainfuck for this challenge!

The concept for this one is straightforward but the constraints are restrictive.
Your goal is to escape an ipv4 string by turning the `.`'s into `[.]`. 
Eg ``"1.1.1.1"` = > `1[.]1[.]1[.]1`. 

Requirements:
- you must do it in **assembly**!
- you must use manual allocation
- you must have **no memory bugs**. This means no read-only buffers can be modified, no out of bounds bugs, no stack corruption etc
- you must return the new (or modified) string
- you must use a **full function** with prologue, epilogue and register preservation.
- it must be **handwritten assembly**, compiler-generated assembly is not permitted (we will know!)
- you must correctly handle and** arbitrary input** correctly, even if it's not an IP address. This means that "meow meow ...." is a valid input!
- your function should follow the **C ABI**

Encouraged:
Extra points for faster speeds, doing less work or doing it in less lines, etc. If you make any performance claims they must be backed up by at least one **benchmark or profiling**.

Allowed:
- call to any C standard library functions such as malloc
- modify a buffer passed in
- pass in any arguments such as a length, capacity, etc
- you can use any assembly language that can run or be emulated on a modern computer
- you can write your tests in another language. It is only the function specified that must be written in assembly

(this challenge is loosely based on this problem <https://leetcode.com/problems/defanging-an-ip-address/>)
```

## My solution
This is the meat of my solution.
https://github.com/largenumberhere/string_escaping_in_assembly/blob/f1080c05bdcf0cf55dcdd8727ef5673c6df3edad/src/convert.asm#L1-L785
