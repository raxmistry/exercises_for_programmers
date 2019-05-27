package main

import "fmt"
import "bufio"
import "os"
import "strings"

func main() {
	reader := bufio.NewReader(os.Stdin)
	fmt.Println("What is your name?")
	text, _ := reader.ReadString('\n')
	trimmed := strings.TrimSuffix(text, "\n")
	if trimmed == "Bob" {
		fmt.Printf("Hiya, %s !!", trimmed)
	} else {
		fmt.Printf("Hello, %s, nice to meet you.", trimmed)
	}

}
