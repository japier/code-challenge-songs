package healthz

type RepositoryPsql interface {
	CheckStatus() (string, error)
	CheckSong(name string) (string, error)
	InsertSong(name string) (string, error)
}

type UseCase interface {
	GetHealthz() (string, error)
	CreateSong(name string) (string, error)
}
