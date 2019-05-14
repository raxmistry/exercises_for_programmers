package main

import "fmt"
import "bufio"
import "os"
import "strings"

func main() {
	reader := bufio.NewReader(os.Stdin)
	fmt.Println("What is your name?")
	text, _ := reader.ReadString('\n')
	fmt.Printf("Hello, %s, nice to meet you.", strings.TrimSuffix(text, "\n"))
	reader.ReadString('\n')
}
