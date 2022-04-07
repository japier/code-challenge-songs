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

// Validation of existing Song
// This code can be reused with a switch-case statement for multiple cases
func (r *HealthzPSQL) CheckSong(name string) (string, error) {
	var flag int

	err := r.client.DB.Get(&flag, `SELECT TOP 1 1 FROM songs WHERE name =$1`, name)
	if err != nil {
		log.Println("There was an error on the request", err)
		return "", err
	}

	if flag == 1 {
		log.Println("Song cannot be inserted again")
		return "Song cannot be inserted again", nil
	}
	
	return "", nil
}

// Inserting function
// This code can be reused with a switch-case statement for multiple cases
func (r *HealthzPSQL) InsertSong(name string) (string, error) {
	// Migrating code to entities after dev completion
	type Song struct {
		Name string
	}

	query := `INSERT INTO song (name) VALUES (:name)`
	song := Song{Name: name}

	_, err := r.client.DB.NamedExec(query, song)

	if err != nil {
		log.Println("There was an error on the request", err)
		return "", err
	}
	
	return fmt.Sprintf("Data inserted correctly for %s", name), nil
}
