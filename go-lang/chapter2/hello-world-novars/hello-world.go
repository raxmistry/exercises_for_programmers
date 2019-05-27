package main

import "fmt"
import "bufio"
import "os"
import "strings"

func main() {
	fmt.Println("What is your name?")
	//text, _ := bufio.NewReader(os.Stdin).ReadString('\n')
	fmt.Printf("Hello, %s, nice to meet you.", strings.TrimSuffix((text, _ := bufio.NewReader(os.Stdin).ReadString('\n')), "\n"))
}
