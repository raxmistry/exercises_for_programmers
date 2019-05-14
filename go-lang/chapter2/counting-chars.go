package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func main() {
	fmt.Print("What is the input string?")
	reader := bufio.NewReader(os.Stdin)
	text, _ := reader.ReadString('\n')
	trimmed := strings.TrimSuffix(text, "\n")
	chars := strings.Split(trimmed, "")
	fmt.Printf("%s has %d characters", trimmed, len(chars))

}
