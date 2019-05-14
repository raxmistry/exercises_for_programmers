package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func main() {
	reader := bufio.NewReader(os.Stdin)

	fmt.Println("Enter a noun:")
	noun, _ := reader.ReadString('\n')

	fmt.Println("Enter a verb:")
	verb, _ := reader.ReadString('\n')

	fmt.Println("Enter an adjective:")
	adjective, _ := reader.ReadString('\n')

	fmt.Println("Enter an adverb:")
	adverb, _ := reader.ReadString('\n')

	fmt.Printf("Do you %s your %s %s %s? That's hilarious", strings.TrimSuffix(verb, "\n"), strings.TrimSuffix(adjective, "\n"), strings.TrimSuffix(noun, "\n"), strings.TrimSuffix(adverb, "\n"))
}
