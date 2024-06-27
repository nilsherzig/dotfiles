#!/usr/bin/env python3

import re
import fileinput

input_table = ""
for line in fileinput.input():
    input_table += line

def align_table(table_lines):
    # Split the table lines into cells
    cells = [line.split('|')[1:-1] for line in table_lines]
    
    # Calculate the maximum width for each column
    column_widths = [max(len(cell.strip()) for cell in col) for col in zip(*cells)]
    
    # Generate the aligned table
    aligned_table = []
    for row in cells:
        aligned_row = '| ' + ' | '.join(cell.strip().ljust(width) for cell, width in zip(row, column_widths)) + ' |'
        aligned_table.append(aligned_row)
    
    return aligned_table

pattern = r" +"
replacement = " "    # Replacement string
input_table = re.sub(pattern, replacement, input_table)

pattern = r"-+"
replacement = "-"    # Replacement string
input_table = re.sub(pattern, replacement, input_table)

# Split the input table into lines
table_lines = input_table.strip().split('\n')



# Align the table
aligned_table = align_table(table_lines)

pattern = r" "
replacement = "-"    # Replacement string
aligned_table[1] = re.sub(pattern, replacement, aligned_table[1])

# Print the aligned table
for line in aligned_table:
    print(line)


