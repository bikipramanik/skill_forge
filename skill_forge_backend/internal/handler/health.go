package handler

import (
	"database/sql"
	"encoding/json"
	"net/http"
	"time"
)

type HealthResponse struct {
	Status    string    `json:"status"`
	Service   string    `json:"service"`
	DBStatus  string    `json:"db_status"`
	Timestamp time.Time `json:"timestamp"`
}

// NewHealthCheckHandler returns an HTTP handler that checks DB ping status
func NewHealthCheckHandler(db *sql.DB) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")

		dbStatus := "connected"
		if db == nil {
			dbStatus = "disconnected"
		} else if err := db.Ping(); err != nil {
			dbStatus = "error: " + err.Error()
		}

		w.WriteHeader(http.StatusOK)
		resp := HealthResponse{
			Status:    "ok",
			Service:   "Skill Forge Backend API",
			DBStatus:  dbStatus,
			Timestamp: time.Now(),
		}

		json.NewEncoder(w).Encode(resp)
	}
}
