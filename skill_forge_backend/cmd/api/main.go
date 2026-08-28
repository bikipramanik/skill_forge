package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"

	"skill_forge_backend/internal/config"
	"skill_forge_backend/internal/database"
	"skill_forge_backend/internal/handler"
)

func main() {
	// 1. Load Application Configuration
	cfg, err := config.LoadConfig()
	if err != nil {
		log.Fatalf("Failed to load configuration: %v", err)
	}

	// 2. Initialize PostgreSQL Database Connection Pool
	var db *sql.DB
	db, err = database.InitDB(cfg)
	if err != nil {
		log.Printf("⚠️ PostgreSQL connection failed: %v", err)
		log.Printf("⚠️ Starting server in DB-offline mode. Start Postgres container with `docker compose up`.")
	} else {
		defer db.Close()

		// 3. Run Database Migrations (Auto-Create Tables)
		if err := database.RunMigrations(db); err != nil {
			log.Printf("⚠️ Database migration error: %v", err)
		}
	}

	// 4. Set up HTTP Router
	mux := http.NewServeMux()

	// Register Routes
	mux.HandleFunc("/api/v1/health", handler.NewHealthCheckHandler(db))

	serverAddr := fmt.Sprintf(":%s", cfg.Port)
	log.Printf("🚀 Skill Forge Backend starting in %s mode on http://localhost%s", cfg.Env, serverAddr)
	log.Printf("🏥 Health check available at http://localhost%s/api/v1/health", serverAddr)

	// 5. Start Listening for HTTP Requests
	if err := http.ListenAndServe(serverAddr, mux); err != nil {
		log.Fatalf("Server failed to start: %v", err)
	}
}
