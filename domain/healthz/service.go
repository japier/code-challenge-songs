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

func (s *service) CreateSong(name string) (string, error) {
	// TODO
	//if s.repoDB.CheckSong(name) != nil {
		//return s.repoDB.CheckSong(name)
	//}

	return s.repoDB.InsertSong(name)
}

// Function for returning the first 20 elements of each asset type
func (s *service) GetAssetList(assetType int) ([]string, error) {
	return s.repoDB.RetrieveAssetList(assetType)
}