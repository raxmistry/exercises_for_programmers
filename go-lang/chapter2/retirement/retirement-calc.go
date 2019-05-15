package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
	"time"
)

func main() {
	reader := bufio.NewReader(os.Stdin)

	fmt.Print("What is your current age?")
	ageString, _ := reader.ReadString('\n')
	fmt.Print("At what age would you like to retire?")
	retireString, _ := reader.ReadString('\n')

	age := convertStringtoNum(ageString)
	retireAge := convertStringtoNum(retireString)

	fmt.Printf("There are %d years left until you can retire\n", (retireAge - age))

	currentYear := time.Now().Year()
	retireYear := currentYear + (retireAge - age)

	fmt.Printf("It's %d, so you can retire in %d", currentYear, retireYear)

}

func convertStringtoNum(val string) int {

	integer, err := strconv.Atoi(strings.TrimSuffix(val, "\n"))
	if err != nil {
		log.Fatal(err)
	}
	return integer
}
