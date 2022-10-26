#!/usr/bin/python

from sys import argv

del argv[0]
input = ' '.join(argv)
# print(input)

top_border = "┌" + "─" * (len(input) + 2) + "┐"
bottom_border = "└" + "─" * (len(input) + 2) + "┘"

print(top_border) 
print("│ " + input + " │")
print(bottom_border) 
