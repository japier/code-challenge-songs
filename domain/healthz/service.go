package healthz

type service struct {
	repoDB RepositoryPsql
}

func NewService(r RepositoryPsql) *service {
	return &service{repoDB: r}
}

func (s *service) GetHealthz() (string, error) {
	return s.repoDB.CheckStatus()
}
