package database

import (
	"database/sql"
	"fmt"
	"log"
	"time"

	_ "github.com/lib/pq" // PostgreSQL driver
	"skill_forge_backend/internal/config"
)

// InitDB opens a PostgreSQL connection pool and retries ping until DB is ready
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

	// Retry database ping up to 10 times (to handle Docker DB boot time)
	var pingErr error
	for attempts := 1; attempts <= 10; attempts++ {
		pingErr = db.Ping()
		if pingErr == nil {
			log.Println("✅ Successfully connected to PostgreSQL database!")
			return db, nil
		}
		log.Printf("⏳ Waiting for PostgreSQL to be ready... (attempt %d/10: %v)", attempts, pingErr)
		time.Sleep(1 * time.Second)
	}

	db.Close()
	return nil, fmt.Errorf("failed to connect to database after 10 attempts: %w", pingErr)
}
