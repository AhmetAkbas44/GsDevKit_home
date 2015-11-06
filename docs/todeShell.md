## The tODE shell

One of the most important advantages of using the tODE development environment is the command line tODE shell.  This allows you to execute existing  commands and create your own commands, execute Smalltalk expressions and return results, work with objects and classes, and create multi-line scripts for later use.  The tODE shell acts like a Smalltalk workspace, but can accept and return arguments.

![The tODE shell][1]

The tODE shell has similarities both to the bash shell and to the GemStone topaz command line environment. 

* The tODE shell uses bash posix syntax with a few exceptions: the back tick ` is used, rather than double or single quotes " or ', to escape lines of text that includes spaces.  
* The tODE shell is object-in and object-out; as bash accepts input from stdin, and send output to stdout, the tODE shell accepts objects in, and returns objects.  
*  The initial token in each tODE shell expression is a command, which may be followed by subcommands or arguments.  All the tODE menu items are available to execute as tODE commands.
*  The tODE shell provides tab completion for files and commands.
*  Shell variables are not yet supported in tODE.

### Commands

tODE command words are registered in a lookup dictionary, which will return an instance of a Class; subcommands and options are translated to methods and arguments.  You may create your own commands as well.  

tODE commands include operations such as **man** and **project**, which are starting points for working with, respectively man page documentation and projects; each of these have many subcommands.  

For example, man is a command; sending eval to this command has the effect of opening the man page above the tODE shell console (replacing it, if it's already open); it also return a string with the first part of the result to the shell.

![tode man eval][3]

To execute Smalltalk code, use the eval command.  

For example:

![tode single line eval][2]

#### Combining commands

The tODE expressions above return an object to the command line, as well as performing the operations.  
For `man eval`, for example, the man page is opened, but a value is also returned (the first part of the String containing the man information). You may use this to chain commands.  For example:

![tode multi line eval][4]

Commands are broken up by newlines, as in these examples, or by the | or ; characters.  So the above is the same as:

![tode chain eval][5]

---

[Continue to the next page: Projects in tODE][10]

---
[**FEEDBACK**][28]
---


[1]: images/todeShell.png
[2]: images/todeManEval.png
[3]: images/todeShellSingleEval.png
[4]: images/todeShellMultiEvals.png
[5]: images/todeShellChainEvals.png

[10]: ./projectsInTode.md

[28]: https://github.com/GsDevKit/GsDevKit_home/issues/new
