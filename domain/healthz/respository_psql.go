package healthz

import (
	"fmt"
	"github/CreatorNinja/code-challenge-songs/pkg/db"
	"log"
)

type HealthzPSQL struct {
	client *db.Client
}

func NewHealthzPSQL(client *db.Client) *HealthzPSQL {
	return &HealthzPSQL{client: client}
}

func (r *HealthzPSQL) CheckStatus() (string, error) {
	var songs int
	err := r.client.DB.Get(&songs, `SELECT count(*) FROM songs`)
	if err != nil {
		log.Println("There was an error on the request", err)
		return "", err
	}
	return fmt.Sprintf("DB Healthy, with %d songs", songs), nil
}
