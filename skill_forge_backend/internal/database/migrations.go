package database

import (
	"database/sql"
	"fmt"
	"log"
)

// RunMigrations creates the required SQL tables automatically at application startup
func RunMigrations(db *sql.DB) error {
	schemaSQL := `
	-- 1. Users Table
	CREATE TABLE IF NOT EXISTS users (
		id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
		full_name VARCHAR(100) NOT NULL,
		email VARCHAR(255) UNIQUE NOT NULL,
		password_hash TEXT NOT NULL,
		avatar_url TEXT DEFAULT '',
		created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
	);

	-- 2. Categories Table
	CREATE TABLE IF NOT EXISTS categories (
		id VARCHAR(50) PRIMARY KEY,
		name VARCHAR(100) NOT NULL,
		icon_url TEXT DEFAULT ''
	);

	-- 3. Courses Table
	CREATE TABLE IF NOT EXISTS courses (
		id VARCHAR(50) PRIMARY KEY,
		title VARCHAR(255) NOT NULL,
		description TEXT NOT NULL,
		thumbnail_url TEXT DEFAULT '',
		price NUMERIC(10, 2) NOT NULL DEFAULT 0.00,
		rating NUMERIC(3, 2) NOT NULL DEFAULT 0.00,
		category_id VARCHAR(50) REFERENCES categories(id) ON DELETE SET NULL,
		instructor_name VARCHAR(100) NOT NULL,
		created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
	);

	-- 4. Lessons Table
	CREATE TABLE IF NOT EXISTS lessons (
		id VARCHAR(50) PRIMARY KEY,
		course_id VARCHAR(50) NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
		title VARCHAR(255) NOT NULL,
		video_url TEXT DEFAULT '',
		duration_seconds INT NOT NULL DEFAULT 0,
		order_index INT NOT NULL DEFAULT 1
	);

	-- 5. Enrollments Table
	CREATE TABLE IF NOT EXISTS enrollments (
		id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
		user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
		course_id VARCHAR(50) NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
		progress_percent NUMERIC(5, 2) NOT NULL DEFAULT 0.00,
		enrolled_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
		UNIQUE(user_id, course_id)
	);

	-- 6. Wishlist Table
	CREATE TABLE IF NOT EXISTS wishlist (
		id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
		user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
		course_id VARCHAR(50) NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
		created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
		UNIQUE(user_id, course_id)
	);
	`

	_, err := db.Exec(schemaSQL)
	if err != nil {
		return fmt.Errorf("failed to execute migration SQL: %w", err)
	}

	log.Println("✅ Database schema migrations executed successfully!")
	return nil
}
