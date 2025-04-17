# String Transformation Challenge
This was a challenge in the segfault programming server on 17/04/2025.
This solution only runs on linux. The code is in `src/`.
Build and run it with `make`.

Check out the solution!
https://github.com/largenumberhere/string_escaping_in_assembly/commit/b8e02c7114a2bf9f71fd2e7674276b956fd6707d#diff-63ce4f05a2a3ad9013a97717ecb07b1e6b42fd80101ae88b5c98c121139401feR5

### Problem Description
https://discord.com/channels/1214821796751081482/1362149134081065233

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