package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
)

func main() {
	reader := bufio.NewReader(os.Stdin)

	fmt.Print("What is the first number?")
	numString1, _ := reader.ReadString('\n')
	fmt.Print("What is the second number?")
	numString2, _ := reader.ReadString('\n')

	num1 := convertStringtoNum(numString1)
	num2 := convertStringtoNum(numString2)

	sum := num1 + num2
	diff := num1 - num2
	product := num1 * num2
	div := num1 / num2

	fmt.Printf("%d +  %d = %d\n%d - %d = %d\n%d * %d = %d\n%d / %d = %d ", num1, num2, sum, num1, num2, diff, num1, num2, product, num1, num2, div)
}

func convertStringtoNum(val string) int {

	integer, err := strconv.Atoi(strings.TrimSuffix(val, "\n"))
	if err != nil {
		log.Fatal(err)
	}
	return integer
}
