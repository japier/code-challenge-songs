package main

import (
	"os"

	"github/CreatorNinja/code-challenge-songs/api/handler"
	"github/CreatorNinja/code-challenge-songs/domain/healthz"
	"github/CreatorNinja/code-challenge-songs/pkg/db"

	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
	log "github.com/sirupsen/logrus"
)

const AplicationName = "code-challenge-songs"

func main() {
	err := godotenv.Load()
	if err != nil {
		log.Println("Error loading envs", err)
	}

	psqlClient := db.NewClient(
		os.Getenv("DB_HOST"),
		os.Getenv("DB_PORT"),
		os.Getenv("DB_NAME"),
		os.Getenv("DB_USER"),
		os.Getenv("DB_PASS"),
		AplicationName,
	)

	log.Println(psqlClient)

	dbRepo := healthz.NewHealthzPSQL(psqlClient)
	healthzService := healthz.NewService(dbRepo)

	r := gin.Default()

	handler.HealthzRouter(r, healthzService)

	port := os.Getenv("APP_PORT")
	if port == "" {
		port = "8181"
	}

	err = r.Run(":" + port)
	if err != nil {
		log.Fatalf("Error when running server: %s", err)
	}
}
