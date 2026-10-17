package api

import (
	"log"
	"net/http"
)

// Routes Setup server mux and handle routes
func Routes() {

	// Setup mux
	mux := http.NewServeMux()

	// Handle routes
	mux.HandleFunc("/", indexHandler)
	mux.HandleFunc("/dashboard", dashboardHandler)
	mux.HandleFunc("/login", loginHandler)
	mux.HandleFunc("/stats", statsHandler)
	mux.HandleFunc("/status", statusHandler)
	mux.HandleFunc("/submit", submitHandler)
	mux.HandleFunc("/rss", rssHandler)

	// Start service
	log.Fatal(http.ListenAndServe(":80", mux))

}
