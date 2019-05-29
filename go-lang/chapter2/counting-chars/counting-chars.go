package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func main() {
	reader := bufio.NewReader(os.Stdin)
	trimmed := ""
	for {
		fmt.Print("What is the input string?")
		text, _ := reader.ReadString('\n')
		trimmed = strings.TrimSuffix(text, "\n")
		if len(trimmed) > 0 {
			break
		}
	}
	chars := strings.Split(trimmed, "")
	fmt.Printf("%s has %d characters", trimmed, len(chars))

}
