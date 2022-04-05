package healthz

type RepositoryPsql interface {
	CheckStatus() (string, error)
}

type UseCase interface {
	GetHealthz() (string, error)
}
