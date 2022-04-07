package entities

type Healthz struct {
	Message  string
	DBStatus string
}

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