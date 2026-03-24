# CoolRubyGem

Markov Algorithm Interpreter
A Ruby implementation of Markov algorithms – a string rewriting system that defines formal grammars and computable functions.

Overview
This interpreter processes strings using Markov algorithm rules. It supports multiple rule systems within a single file, allowing you to define distinct rewriting systems and apply them to different sets of input words.

Rule System Definition
Each system is enclosed in curly braces with a # prefix:

{\
  rule1;\
  rule2;\
  rule3;\
}

Rule Syntax
Rules follow one of two formats:

Type	Syntax	Behavior
Regular	x -> y;	Replace all occurrences of x with y and continue with next rule
Terminal	x ->. y;	Replace the first occurrence of x with y and terminate the algorithm (final result)

Notes:
Rules are evaluated sequentially from top to bottom
After a successful replacement, the algorithm restarts from the first rule (unless it's a terminal rule)
Newline after each rule is optional but recommended for readability

Complete File Structure

{\
 aa -> a;\
 bb -> b;\
 ab ->. ba;\
}\
word1.1 word1.2...word1.n\

{\
 a -> ab;\
 b -> a;\
}\
word2.1 word2.2...word2.n\

{\
 x -> y;\
 x ->. z;\
}\
word3.1 word3.2...word3.n\
