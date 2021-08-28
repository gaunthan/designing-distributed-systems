package main

import (
	"io"
	"log"
	"net/http"
)

func main() {
	helloHandler := func(w http.ResponseWriter, req *http.Request) {
		io.WriteString(w, "Hello, world!")
	}

	http.HandleFunc("/", helloHandler)
	log.Fatal(http.ListenAndServe(":8000", nil))
}

