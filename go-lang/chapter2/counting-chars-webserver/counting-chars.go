package main

import (
	"fmt"
	"net/http"
	"strconv"
	"strings"
)

func count_chars(words string) int {
	chars := strings.Split(words, "")
	return len(chars)

}

func root(w http.ResponseWriter, r *http.Request) {
	enableCors(&w)
	message := r.URL.Path
	message = strings.TrimPrefix(message, "/")
	message = strconv.Itoa(count_chars(message))

	w.Write([]byte(message))
}

func enableCors(w *http.ResponseWriter) {
	(*w).Header().Set("Access-Control-Allow-Origin", "*")
}

func main() {
	fmt.Println("vim-go")
	http.HandleFunc("/", root)
	if err := http.ListenAndServe(":8080", nil); err != nil {
		panic(err)
	}
}
