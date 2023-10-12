package main

// import (
//
//	"fmt"
//	"log"
//	"math"
//	"os"
//	"strconv"
//	"strings"
//	"time"
//
// )
func handleErr(err error) {
	if err != nil {
		log.Panic(err)
	}
}

func gatherEstimate() float64 {
	currentChargeFile := "/sys/class/power_supply/BAT0/charge_now"
	currentCurrentFile := "/sys/class/power_supply/BAT0/current_now"

	currentCharge := readFileToInt(currentChargeFile)
	currentCurrent := readFileToInt(currentCurrentFile)

	result := currentCharge / currentCurrent * 60
	return result
}

func main() {
	dataPoints := 100
	fmt.Printf("⏳ wait %d secs for fist good estimate\n", dataPoints)
	var numbers []float64
	for {
		if len(numbers) >= dataPoints {
			numbers = numbers[1:]
		}
		number := gatherEstimate()
		numbers = append(numbers, number)

		var sum float64 = 0
		for _, val := range numbers {
			sum += val
		}
		minutes := math.Round(sum / float64(len(numbers)))

		timein := time.Now().Local().Add(
			time.Minute * time.Duration(minutes))
		fmt.Printf("until %s or %.fmin\n", timein.Format("15:04"), minutes)
		time.Sleep(time.Second)
	}
}

func readFileToInt(filepath string) (value float64) {

	content, err := os.ReadFile(filepath)
	if err != nil {
		fmt.Println("Error reading the file:", err)
		return
	}

	fileContentInt, err := strconv.ParseFloat(
		strings.Trim(string(content), "\n"), 64)
	handleErr(err)
	return fileContentInt
}
