package healthz

import (
	"fmt"
	"github/CreatorNinja/code-challenge-songs/pkg/db"
	// TODO
	//"github/CreatorNinja/code-challenge-songs/entities/healthz"
	"log"
)

type Song struct {
	Name string
}

type Artist struct {
	Name string
}

type Album struct {
	Name string
	Thumbnail_URL string
}

type Playlist struct {
	Name string
	Thumbnail_URL string
}

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

// General function for retrieving the first 20 elements of each type
func (r *HealthzPSQL) RetrieveAssetList(assetType int) ([]string, error) {
	assetTable := "NONE"
	assetStruct := []string{}

	switch assetType {
	case 0:
		assetTable = "songs"
	case 1:
		assetTable = "artists"
	case 2:
		assetTable = "albums"
	case 3:
		assetTable = "playlists"
	default:
		assetTable = "undefined"
	}

	query := `SELECT name FROM ` + assetTable + ` LIMIT 20`

	// Execute query
	err := r.client.DB.Select(&assetStruct, query)

	if err != nil {
		log.Println("There was an error on the request", err)
		return []string{""}, err
	}

	return assetStruct, nil
}

// General function for searching any asset based on its name
func (r *HealthzPSQL) SearchAsset(objectType string, params *string) ([]string, error) {
	var err error
	var query string
	var assetStruct []string
	
	if params == nil {
		query = `SELECT name FROM ` + objectType + ` LIMIT 20`

		// Execute query
		err = r.client.DB.Select(&assetStruct, query)

		if err != nil {
			log.Println("There was an error on the request", err)
			return []string{""}, err
		}
	}

	query = `SELECT name FROM songs LIMIT 20`

	// Execute query
	err = r.client.DB.Select(&assetStruct, query)

	if err != nil {
		log.Println("There was an error on the request", err)
		return []string{""}, err
	}

	return assetStruct, nil
}
