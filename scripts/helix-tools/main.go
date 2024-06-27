package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"regexp"
	"strings"
)

func normalizeTable(inputTable string) string {
	var result string
	// var err error

	// remove all spaces
	re := regexp.MustCompile(`(?m) +`)
	result = re.ReplaceAllString(inputTable, " ")

	// remove existing -----
	re2 := regexp.MustCompile(`(?m)-+`)
	resultSlice := strings.Split(result, "\n")
	resultSlice[1] = re2.ReplaceAllString(resultSlice[1], "-")

	// get largest cell
	// split
	var cells [][]string
	for _, line := range resultSlice {
		splitLine := strings.Split(line, "|")
		// Remove the first and last elements (empty cells)
		cells = append(cells, splitLine[1:len(splitLine)-1])
	}

	var columnWidths []int
	for _, col := range cells {
		maxWidth := 0
		for _, cell := range col {
			cellWidth := len(strings.TrimSpace(cell))
			if cellWidth > maxWidth {
				maxWidth = cellWidth
			}
		}
		columnWidths = append(columnWidths, maxWidth)
	}

	var alignedTable []string
	for _, row := range cells {
		var alignedRow string
		for i, cell := range row {
			alignedCell := fmt.Sprintf(" %s ", strings.TrimSpace(cell))
			alignedCell = alignedCell + strings.Repeat(" ", columnWidths[i]-len(cell))
			alignedRow += "|" + alignedCell
		}
		alignedRow += "|"
		alignedTable = append(alignedTable, alignedRow)
	}

	for _, row := range alignedTable {
		fmt.Println(row)
	}

	var result2 string
	for _, line := range resultSlice {
		result2 += line
		result2 += "\n"
	}

	return result2
}

func main() {
	inputTable := ""
	scanner := bufio.NewScanner(os.Stdin)
	for scanner.Scan() {
		inputTable += scanner.Text() + "\n"
	}

	inputTable = normalizeTable(inputTable)

	log.Println(inputTable)
}

// | Programm            | BGP | BFD    | VIP |
// |---------------------|--------|----|-----|
// | `Bird`             | y  | y  | x  |
// | `Calico`               | y  | x  | y  |
// | `Cilium`           | y  |    x  | y  |
// | `FrRouting`            | y  | y  | x  |
// | `Kube-VIP` (BGP Mode)            | y  | x  | y  |
// | `MetalLB` (`FrR` Mode) | y  | y  | y  |
