package handler

import (
	"encoding/json"
	"net/http"
)

type TestResponse struct {
	Status  string `json:"status"`
	Message string `json:"message"`
}

func TestHandler(w http.ResponseWriter, r *http.Request) {
	// Tell client we're returning JSON

	w.Header().Set("Content-Type", "application/json")

	resp := TestResponse{Status: "ok", Message: "Testing Testing"}
	json.NewEncoder(w).Encode(resp)
}
