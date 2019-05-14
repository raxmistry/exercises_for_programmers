package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func main() {

	reader := bufio.NewReader(os.Stdin)
	fmt.Println("What is thq quote?")
	quote, _ := reader.ReadString('\n')

	fmt.Println("Who said it?")
	author, _ := reader.ReadString('\n')

	fmt.Printf("%s says, \"%s\"", strings.TrimSuffix(author, "\n"), strings.TrimSuffix(quote, "\n"))
}
