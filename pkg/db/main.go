package db

import (
	"fmt"
	"log"

	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
)

type Client struct {
	DB *sqlx.DB
}

//NewSQLXClient Create SQLX connection
func NewClient(host string, port string, dbname string, user string, password string, applicationName string) *Client {
	dbString := fmt.Sprintf("host=%s port=%s dbname=%s user=%s password=%s sslmode=disable application_name=%s", host, port, dbname, user, password, applicationName)
	db, err := sqlx.Connect("postgres", dbString)
	if err != nil {
		log.Fatalf("Error connecting to postgres: %s", err)
	} else {
		log.Println("Successfully connected to PSQL")
	}

	client := new(Client)
	client.DB = db
	return client
}
