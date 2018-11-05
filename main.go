// this sample app borrowed from Fabian Lee
//  https://fabianlee.org/2017/05/21/golang-running-a-go-binary-as-a-systemd-service-on-ubuntu-16-04/

package main

import (
	"fmt"
	"log"
	"net/http"
	"github.com/gorilla/mux"
)

func main() {
	IP := "0.0.0.0"
	router := mux.NewRouter().StrictSlash(true)
	router.HandleFunc("/hello/{name}", hello).Methods("GET")

	// start listening server
	log.Printf("creating listener on %s:%d",IP,8080)
	log.Fatal(http.ListenAndServe(fmt.Sprintf("%s:8080",IP), router))
}

func hello(w http.ResponseWriter, r *http.Request) {
	log.Println("Responding to /hello request")
	log.Println(r.UserAgent())

	// request variables
	vars := mux.Vars(r)
	log.Println("request:",vars)

	// query string parameters
	rvars := r.URL.Query()
	log.Println("query string",rvars)

	name := vars["name"]
	if name == "" {
	  name = "world"
	}

	w.WriteHeader(http.StatusOK)
	fmt.Fprintf(w, "Hello %s\n", name)
}
