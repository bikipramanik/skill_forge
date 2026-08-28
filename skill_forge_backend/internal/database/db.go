package database

import (
	"database/sql"
	"fmt"
	"log"
	"time"

	_ "github.com/lib/pq" // PostgreSQL driver
	"skill_forge_backend/internal/config"
)

// InitDB opens a PostgreSQL connection pool and tests connectivity
func InitDB(cfg *config.Config) (*sql.DB, error) {
	dsn := cfg.GetDSN()

	db, err := sql.Open("postgres", dsn)
	if err != nil {
		return nil, fmt.Errorf("failed to open database connection: %w", err)
	}

	// Configure connection pool settings
	db.SetMaxOpenConns(25)                 // Maximum open connections
	db.SetMaxIdleConns(10)                 // Maximum idle connections in pool
	db.SetConnMaxLifetime(5 * time.Minute) // Connection max lifetime

	// Test connection ping
	if err := db.Ping(); err != nil {
		db.Close()
		return nil, fmt.Errorf("failed to ping database: %w", err)
	}

	log.Println("✅ Successfully connected to PostgreSQL database!")
	return db, nil
}
